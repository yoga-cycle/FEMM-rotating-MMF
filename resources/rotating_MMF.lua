-- simple script to simulate FOC on BLDC motor

-- display console to print torque estimation and simulation progress
showconsole()
clearconsole()

-- open the fem file
mydir="./"
open(mydir .. "MMF.fem")

-- save the fem file to another temporary file
-- the script will modify the rotor positions and winding currents during the simulation.  
mi_saveas(mydir .. "temp.fem")

-- 90 steps of simulation
step = 90

-- initial phase angle is zero
phase_angle=0

-- loop
for n=0,step do

	-- 90 steps, so increment phase angle by 4 degree each step to achieve 360 degree or 1 complete cycle
	phase_angle = phase_angle + 4

	i_a = 5*sin(phase_angle*3.14/180.0)
	i_b = 5*sin(phase_angle*3.14/180.0 + 2*3.14/3.0)
	i_c = 5*sin(phase_angle*3.14/180.0 - 2*3.14/3.0)
	
	-- update the current in all phase to generate 3 phase AC
	mi_modifycircprop("A",1,i_a)
	mi_modifycircprop("B",1,i_b)
	mi_modifycircprop("C",1,i_c)

	-- run the solver, minimize window. 
    mi_analyze(1)
	-- After the solver is done, loads the solution 
    mi_loadsolution()
	
	-- set to contour mode to plot contour
	mo_seteditmode("contour")
	
	-- draw contour around rotor in the airgap radius 58.5
	-- we need to analyze only 180 degree for 4 pole machine. So generate contour for half circle only.
	mo_clearcontour()
	mo_clearcontour()
	mo_addcontour(58.5,0)
	mo_addcontour(-58.5,0)
	mo_bendcontour(180,0.1)
	-- mo_addcontour(58.5,0)
	-- mo_bendcontour(180,0.1)
	
	-- plot B.n and save as EMF file
    filename = "sim-"..n..".emf"
	mo_makeplot(2,1500,filename)
end
mo_close()
mi_close()