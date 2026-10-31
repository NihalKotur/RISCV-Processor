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

immgen.sv - immediate generator (extracts and sign-extends constants from instructions)
iverilog -g2012 -o sim/immgen_tb.vvp rtl/immgen.sv tb/immgen_tb.sv && vvp sim/immgen_tb.vvp && surfer sim/immgen.vcd

datamem.sv & instrmem.sv - memory blocks
iverilog -g2012 -o sim/datamem_tb.vvp rtl/datamem.sv tb/datamem_tb.sv && vvp sim/datamem_tb.vvp && surfer sim/datamem.vcd
iverilog -g2012 -o sim/instrmem_tb.vvp rtl/instrmem.sv tb/instrmem_tb.sv && vvp sim/instrmem_tb.vvp && surfer sim/instrmem.vcd