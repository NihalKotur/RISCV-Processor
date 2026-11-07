Instruction Set is stored in memFiles/instrMemFile.mem

Running the testbenches on Surfer:
pc_TB.sv:
iverilog -g2012 -o sim/pc_TB.vvp rtl/pc.sv tb/pc_TB.sv && vvp sim/pc_TB.vvp && surfer sim/pc.vcd

alu_TB.sv:
iverilog -g2012 -o sim/alu_TB.vvp rtl/alu.sv tb/alu_TB.sv && vvp sim/alu_TB.vvp && surfer sim/alu.vcd

controlUnit_TB.sv:
NOT IMPLEMENTED YET

immGen_TB.sv:
iverilog -g2012 -o sim/immGen_TB.vvp rtl/immGen.sv tb/immGen_TB.sv && vvp sim/immGen_TB.vvp && surfer sim/immGen.vcd

regFile_TB.sv:
iverilog -g2012 -o sim/regFile_TB.vvp rtl/regFile.sv tb/regFile_TB.sv && vvp sim/regFile_TB.vvp && surfer sim/regFile.vcd

dataMem_TB.sv:
iverilog -g2012 -o sim/dataMem_TB.vvp rtl/dataMem.sv tb/dataMem_TB.sv && vvp sim/dataMem_TB.vvp && surfer sim/dataMem.vcd

instrMem_TB.sv:
iverilog -g2012 -o sim/instrMem_TB.vvp rtl/instrMem.sv tb/instrMem_TB.sv && vvp sim/instrMem_TB.vvp && surfer sim/instrMem.vcd

topLayer_TB.sv (MAIN TEST BENCH):
iverilog -g2012 -o sim/topLayer_TB.vvp rtl/topLayer.sv tb/topLayer_TB.sv && vvp sim/topLayer_TB.vvp && surfer sim/topLayer.vcd
