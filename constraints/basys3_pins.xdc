## -------------------------------------------------------------
## 1. Master Clock (100 MHz crystal on Basys 3)
## -------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_100MHz]

## -------------------------------------------------------------
## 2. Analog 1-Bit Stream Input (Mapped to Right-most Switch V17 for testing)
## -------------------------------------------------------------
set_property PACKAGE_PIN V17 [get_ports analog_in_pin]
set_property IOSTANDARD LVCMOS33 [get_ports analog_in_pin]

## -------------------------------------------------------------
## 3. Reset Button (Mapped to Center Push Button U18)
## -------------------------------------------------------------
set_property PACKAGE_PIN U18 [get_ports reset_btn]
set_property IOSTANDARD LVCMOS33 [get_ports reset_btn]

## -------------------------------------------------------------
## 4. Decimation Output (Mapped to the 16 LEDs above the switches)
## -------------------------------------------------------------
set_property PACKAGE_PIN U16 [get_ports {led_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {led_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {led_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {led_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {led_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[4]}]
set_property PACKAGE_PIN U15 [get_ports {led_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[5]}]
set_property PACKAGE_PIN U14 [get_ports {led_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[6]}]
set_property PACKAGE_PIN V14 [get_ports {led_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[7]}]
set_property PACKAGE_PIN V13 [get_ports {led_out[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[8]}]
set_property PACKAGE_PIN V3 [get_ports {led_out[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[9]}]
set_property PACKAGE_PIN W3 [get_ports {led_out[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[10]}]
set_property PACKAGE_PIN U3 [get_ports {led_out[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[11]}]
set_property PACKAGE_PIN P3 [get_ports {led_out[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[12]}]
set_property PACKAGE_PIN N3 [get_ports {led_out[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[13]}]
set_property PACKAGE_PIN P1 [get_ports {led_out[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[14]}]
set_property PACKAGE_PIN L1 [get_ports {led_out[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_out[15]}]
