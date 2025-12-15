vlib work
vmap work work

vlog ../rtl/simpleuart.v
vlog ../tb/testbench_simpleuart.sv

vsim work.testbench_simpleuart -voptargs="+acc"


add wave -divider "Clock and Reset"
add wave sim:/testbench_simpleuart/clk
add wave sim:/testbench_simpleuart/resetn

add wave -divider "UART module external signals"
add wave sim:/testbench_simpleuart/ser_tx
add wave sim:/testbench_simpleuart/ser_rx

add wave sim:/testbench_simpleuart/reg_div_we
add wave sim:/testbench_simpleuart/reg_div_di
add wave sim:/testbench_simpleuart/reg_div_do

add wave sim:/testbench_simpleuart/reg_dat_we
add wave sim:/testbench_simpleuart/reg_dat_re
add wave sim:/testbench_simpleuart/reg_dat_di
add wave sim:/testbench_simpleuart/reg_dat_do
add wave sim:/testbench_simpleuart/reg_dat_wait

add wave -divider "UART module internal signals"
add wave sim:/testbench_simpleuart/uart/cfg_divider

add wave sim:/testbench_simpleuart/uart/recv_state
add wave sim:/testbench_simpleuart/uart/recv_divcnt
add wave sim:/testbench_simpleuart/uart/recv_pattern
add wave sim:/testbench_simpleuart/uart/recv_buf_data
add wave sim:/testbench_simpleuart/uart/recv_buf_valid

add wave sim:/testbench_simpleuart/uart/send_pattern
add wave sim:/testbench_simpleuart/uart/send_bitcnt
add wave sim:/testbench_simpleuart/uart/send_divcnt
add wave sim:/testbench_simpleuart/uart/send_dummy

add wave -divider "UART module debug signals"
add wave sim:/testbench_simpleuart/uart/debug

run 3us