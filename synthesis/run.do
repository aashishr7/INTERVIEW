# set fpga device for synthesis
# this step is necessary and command should be applied before any other actions
setup_fpga -tech VIRTEX7 -part xc7v585t

# create and map 'work' library
hlib create ./work
hlib map work ./work

# compile RTL sources to 'work' library
hcom -lib work -2000 design.sv 

# set synthesis output files (EDF and VM)
setoption output_edif "design.synth.edf"
setoption output_verilog "design.synth.vm"
setoption output_schematicsvg "diag.svg"

# run synthesis of top module with included 'work' library
hsyn -L work pe
