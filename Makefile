alu:
	iverilog ALU_NOT_5bit.v ALU_SHL_5bit.v ALU.v ALU_tb.v -o alu_test.vvp
	vvp alu_test.vvp
	gtkwave alu_test.vcd &

cu:
	iverilog CU.v CU_tb.v -o cu_test.vvp
	vvp cu_test.vvp
	gtkwave cu_test.vcd &

cpu:
	iverilog ALU_NOT_5bit.v ALU_SHL_5bit.v ALU.v CU.v CPU.v CPU_tb.v -o cpu_test.vvp
	vvp cpu_test.vvp
	gtkwave cpu_test.vcd &