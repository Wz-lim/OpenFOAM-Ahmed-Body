#!/bin/bash


cd ~/OpenFOAM/weizhe-12/run/ahmed/changeProperty || exit 1


viscosities=()
velocities=()

# Reading viscosities from viscosities.txt
echo -e "\e[4mViscosities\e[0m"
while IFS= read -r line; do
	echo "$line"
    viscosities+=("$line")
done < "viscosities.txt"

# Reading velocities from velocities.txt
echo -e "\e[4mVelocities\e[0m"
while IFS= read -r line; do
	echo "$line"
    velocities+=("$line")
done < "velocities.txt"

cd .. || exit 1

for viscosity in "${viscosities[@]}"; do
	for velocity in "${velocities[@]}"; do
		
		cleaned_name=$(echo "${viscosity}_${velocity}" | sed 's/\r//g')
		echo -e "\033[1m $cleaned_name \033[1m"
		
		if [ -d "results/$cleaned_name" ]; then
			echo "Directory exists"
			continue
		fi
		
		cp -r ahmedBase "results" || exit 2
		cd results
		mv "ahmedBase" "$cleaned_name"
		cd "$cleaned_name"
		
		cd constant
		sed -i "s/nu              [0-9.e-]\+/nu              ${viscosity}/g" physicalProperties
		cd "../3"
		sed -i "s/meanVelocity/${velocity}/g" U
		cd ..
		
		foamRun
		
		cd ../..
	done
done

echo "properties run completed"