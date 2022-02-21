vcom -reportprogress 300 -work work ../../e_my_calculator.vhd
vcom -reportprogress 300 -work work ../../e_finite_sm.vhd
vcom -reportprogress 300 -work work ../../e_flipflop.vhd
vcom -reportprogress 300 -work work ../../e_convert_switch_to_integer.vhd
vcom -reportprogress 300 -work work ../../e_combine_digits.vhd
vcom -reportprogress 300 -work work ../../e_arithmetic_operations.vhd


vcom -reportprogress 300 -work work e_my_calculator_vhd_tst.vht
vsim work.e_my_calculator_vhd_tst
do waves.do
run -all