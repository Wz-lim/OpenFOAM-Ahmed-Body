for velocities and viscosities.txt, add 1 extra empty line after last input
when running changeProperty, use bash changeProperty.sh

blockMesh | tee log.blockMesh
checkMesh | tee log.checkMesh
icoFoam | tee long.icoFoam
foamLog log.icoFoam
use gnuplot to plot residuals