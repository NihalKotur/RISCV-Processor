Running the testbenches on surfer

pc_TB.sv - program counter register
iverilog -g2012 -o sim/pc_TB.vvp rtl/pc.sv tb/pc_TB.sv && vvp sim/pc_TB.vvp && surfer sim/pc.vcd

alu_TB.sv - arithmetic + logic unit
iverilog -g2012 -o sim/alu_TB.vvp rtl/alu.sv tb/alu_TB.sv && vvp sim/alu_TB.vvp && surfer sim/alu.vcd

controlUnit_TB.sv - the control unit (decodes instructions and sets control lines)
NOT IMPLEMENTED YET

immGen_TB.sv - immediate generator (extracts and sign-extends constants from instructions)
iverilog -g2012 -o sim/immGen_TB.vvp rtl/immGen.sv tb/immGen_TB.sv && vvp sim/immGen_TB.vvp && surfer sim/immGen.vcd

regFile_TB.sv - the register file (registers x0 through x31)
iverilog -g2012 -o sim/regFile_TB.vvp rtl/regFile.sv tb/regFile_TB.sv && vvp sim/regFile_TB.vvp && surfer sim/regFile.vcd

dataMem_TB.sv & instrMem_TB.sv - memory blocks
iverilog -g2012 -o sim/dataMem_TB.vvp rtl/dataMem.sv tb/dataMem_TB.sv && vvp sim/dataMem_TB.vvp && surfer sim/dataMem.vcd
iverilog -g2012 -o sim/instrMem_TB.vvp rtl/instrMem.sv tb/instrMem_TB.sv && vvp sim/instrMem_TB.vvp && surfer sim/instrMem.vcd

topLayer_TB.sv - top-level module that instantiates everything and hooks them together (the main processor testbench)
iverilog -g2012 -o sim/topLayer_TB.vvp rtl/*.sv tb/topLayer_TB.sv && vvp sim/topLayer_TB.vvp && surfer sim/topLayer.vcd
