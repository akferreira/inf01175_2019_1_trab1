
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name trab1 -dir "/mnt/DISK2_MIKU/Documents/SD/inf01175_2019_1_trab1/planAhead_run_2" -part xc3s100ecp132-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "trab1.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {nibble_7seg.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/subtract.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
add_files [list {ipcore_dir/subtract.ngc}]
add_files [list {ipcore_dir/adder.ngc}]
set hdlfile [add_files [list {ipcore_dir/adder.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {display_driver.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {counter_4bit.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {button_singlepress.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {trab1.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top trab1 $srcset
add_files [list {trab1.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/subtract.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/adder.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-4
