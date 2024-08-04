# FEMM-rotating-MMF
This page contatins supporting files for the blog post [space vector modulation explained](https://y-cyc-esc.com/motor-control-basics/2024/08/03/space-vector-modulation-explained.html)

![simulation setup screenshot](https://github.com/yoga-cycle/FEMM-rotating-MMF/blob/main/resources/femm-screenshot.png)

3 phase current supplied to a 3 phase winding in a 4 pole 24 slot machine and plot the air gap MMF.

![rotating MMF simulation](https://github.com/yoga-cycle/FEMM-rotating-MMF/blob/main/resources/MMF-rotating.gif)

To run the simulation, 
- Download the resources folder
- Open FEMM
- Click *file->Open lua script*
- Navigate to the resources folder and Select *rotating_MMF.lua*

## Supporting vector addition example 
Simple octave example adding three vectors 120 degree to each other and geenrating a rotating resultant vector. 

Run *rotating-MMF.m* in octave to generate the images

![rotating vector resultant](https://github.com/yoga-cycle/FEMM-rotating-MMF/blob/main/resources/rotating-mmf-vector.gif)
