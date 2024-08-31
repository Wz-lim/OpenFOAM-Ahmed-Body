# OpenFOAM case study: Ahmed Body

This repo documents my experience with learning OpenFOAM, and is based on the repo https://github.com/nathanrooy/ahmed-bluff-body-cfd. 
The Ahmed body geometry is included so anyone can use it in their simulations. However, if you would like to add a validation case, you can still open a pull request and I'll add it!

This repo will primarily be evaluating the characteristics and performance of different turbulence models. Results from the evaluation will be stored in the [results](results) folder as GIFs. If you want the full simulation, you can run the included scripts.

![image](https://github.com/user-attachments/assets/c677a258-b179-4985-a416-d7f2458df916)

This is currently under progress, and will be continually updated.

## Background

OpenFOAM is an open-source CFD package, which offers a high degree of customizability. If you are unfamiliar with it, it is highly recommended to follow the [tutorials](https://wiki.openfoam.com/index.php?title=Tutorials) and [youtube guides](https://www.youtube.com/watch?v=IMoFaZcPifM&list=PLvkU6i2iQ2fobFabvgRFeCGsHOqJ8iB5W&index=1)

## Models
| Turbulence Model | Type |
|----------|----------|
|   realizableKE  |   RAS  |
|   kOmegaSST  |   RAS  |
|   SpalartAllmaras  |   RAS   |
|   Smagorinsky  |   LES   |
