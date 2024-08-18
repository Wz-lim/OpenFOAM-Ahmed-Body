#!/bin/bash

<<comment
change viscosity(nu) and initial velocity(U)

create base case
sed -i 's/"nu              1e-05"/new_text/g' physicalProperties
sed -i 's/"meanVelocity	10"/new_text/g' U
comment

cd OpenFOAM\weizhe-12\run\ahmed\changeProperty


viscosities=()
velocities=()

while IFS= read -r line; do
    my_list+=("$line")
done < "viscosities.txt"

while IFS= read -r line; do
    my_list+=("$line")
done < "velocities.txt"

cd ../results

for viscosity in "${viscosities[@]}"; do
	for velocity in "${velocities[@]}"; do
		
		mkdir "${viscosity}_${velocity}"
		cp -r OpenFOAM\weizhe-12\run\ahmed\ahmedBase "OpenFOAM\weizhe-12\run\ahmed\results\${viscosity}_${velocity}"
		cd "OpenFOAM\weizhe-12\run\ahmed\results\${viscosity}_${velocity}"
		
		cd constant
		sed -i 's/nu              1e-05/${viscosity}/g' physicalProperties
		cd "../0"
		sed -i 's/meanVelocity	10/${velocity}/g' U
		cd ..
		
		blockMesh
		foamRun
		paraFoam -touch
		
		cd ..
	done
done

echo "properties run completed"