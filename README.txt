top.sv - top-level module that instantiates everything and hooks them together
iverilog -g2012 -o sim/top_tb.vvp rtl/*.sv tb/top_tb.sv && vvp sim/top_tb.vvp && surfer sim/top.vcd

pc.sv - program counter register
iverilog -g2012 -o sim/pc_tb.vvp rtl/pc.sv tb/pc_tb.sv && vvp sim/pc_tb.vvp && surfer sim/pc.vcd

regfile.sv - the register file (registers x0 through x31)
iverilog -g2012 -o sim/regfile_tb.vvp rtl/regfile.sv tb/regfile_tb.sv && vvp sim/regfile_tb.vvp && surfer sim/regfile.vcd

alu.sv - arithmetic + logic unit
iverilog -g2012 -o sim/alu_tb.vvp rtl/alu.sv tb/alu_tb.sv && vvp sim/alu_tb.vvp && surfer sim/alu.vcd

control.sv - the control unit (decodes instructions and sets control lines)
iverilog -g2012 -o sim/control_tb.vvp rtl/control.sv tb/control_tb.sv && vvp sim/control_tb.vvp && surfer sim/control.vcd

imm_gen.sv - immediate generator (extracts and sign-extends constants from instructions)
iverilog -g2012 -o sim/imm_gen_tb.vvp rtl/imm_gen.sv tb/imm_gen_tb.sv && vvp sim/imm_gen_tb.vvp && surfer sim/imm_gen.vcd

data_memory.sv & instr_memory.sv - memory blocks
iverilog -g2012 -o sim/data_memory_tb.vvp rtl/data_memory.sv tb/data_memory_tb.sv && vvp sim/data_memory_tb.vvp && surfer sim/data_memory.vcd
iverilog -g2012 -o sim/instr_memory_tb.vvp rtl/instr_memory.sv tb/instr_memory_tb.sv && vvp sim/instr_memory_tb.vvp && surfer sim/instr_memory.vcd