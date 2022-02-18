onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_clk
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_switch_input
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_digit_1
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_digit_2
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_digit_3
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_digit_4
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_enable_1
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_current_digit_from_switch
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_current_state

add wave -noupdate /e_my_calculator_vhd_tst/i1/combined_int_1

add wave -noupdate /e_my_calculator_vhd_tst/i1/combined_int_2

add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_result
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_r_digit_0
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_r_digit_1
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_r_digit_2
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_operand_2
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_operand_1
add wave -noupdate /e_my_calculator_vhd_tst/i1/slv_result_store

add wave -noupdate /e_my_calculator_vhd_tst/i1/r_digit_0
add wave -noupdate /e_my_calculator_vhd_tst/i1/r_digit_1
add wave -noupdate /e_my_calculator_vhd_tst/i1/r_digit_2

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 368
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {436 ps}
