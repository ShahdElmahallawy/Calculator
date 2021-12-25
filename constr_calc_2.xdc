
#reset
set_property PACKAGE_PIN R2 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

#clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#Inputs
set_property PACKAGE_PIN T1 [get_ports return]
set_property IOSTANDARD LVCMOS33 [get_ports return]

set_property PACKAGE_PIN U1 [get_ports operation[0]]
set_property IOSTANDARD LVCMOS33 [get_ports operation[0]]
set_property PACKAGE_PIN W2 [get_ports operation[1]]
set_property IOSTANDARD LVCMOS33 [get_ports operation[1]]
set_property PACKAGE_PIN R3 [get_ports operation[2]]
set_property IOSTANDARD LVCMOS33 [get_ports operation[2]]
set_property PACKAGE_PIN T2 [get_ports operation[3]]
set_property IOSTANDARD LVCMOS33 [get_ports operation[3]]


set_property PACKAGE_PIN W19 [get_ports button[0]]
set_property IOSTANDARD LVCMOS33 [get_ports button[0]]
set_property PACKAGE_PIN T18 [get_ports button[1]]
set_property IOSTANDARD LVCMOS33 [get_ports button[1]]
set_property PACKAGE_PIN T17 [get_ports button[2]]
set_property IOSTANDARD LVCMOS33 [get_ports button[2]]
set_property PACKAGE_PIN U17 [get_ports button[3]]
set_property IOSTANDARD LVCMOS33 [get_ports button[3]]

#outputs
set_property PACKAGE_PIN V7 [get_ports finalToDisplay[7]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[7]]
set_property PACKAGE_PIN W7 [get_ports finalToDisplay[6]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[6]]
set_property PACKAGE_PIN W6 [get_ports finalToDisplay[5]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[5]]
set_property PACKAGE_PIN U8 [get_ports finalToDisplay[4]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[4]]
set_property PACKAGE_PIN V8 [get_ports finalToDisplay[3]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[3]]
set_property PACKAGE_PIN U5 [get_ports finalToDisplay[2]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[2]]
set_property PACKAGE_PIN V5 [get_ports finalToDisplay[1]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[1]]
set_property PACKAGE_PIN U7 [get_ports finalToDisplay[0]]
set_property IOSTANDARD LVCMOS33 [get_ports finalToDisplay[0]]

set_property PACKAGE_PIN W4 [get_ports enable[3]]
set_property IOSTANDARD LVCMOS33 [get_ports enable[3]]
set_property PACKAGE_PIN V4 [get_ports enable[2]]
set_property IOSTANDARD LVCMOS33 [get_ports enable[2]]
set_property PACKAGE_PIN U4 [get_ports enable[1]]
set_property IOSTANDARD LVCMOS33 [get_ports enable[1]]
set_property PACKAGE_PIN U2 [get_ports enable[0]]
set_property IOSTANDARD LVCMOS33 [get_ports enable[0]]

