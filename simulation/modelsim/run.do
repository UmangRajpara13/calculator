vcom -reportprogress 300 -work work ../../e_my_calculator.vhd
vcom -reportprogress 300 -work work ../../e_my_finite_SM.vhd
vcom -reportprogress 300 -work work ../../e_my_flipflop.vhd
vcom -reportprogress 300 -work work ../../e_convert_Sw_to_integer.vhd
vcom -reportprogress 300 -work work ../../e_combine_int.vhd
vcom -reportprogress 300 -work work ../../e_arithmetic_operations.vhd


vcom -reportprogress 300 -work work e_my_calculator_vhd_tst.vht
vsim work.e_my_calculator_vhd_tst
do wave.do
run -all