top.sv - top-level module that instantiates everything and hooks them together

pc.sv - program counter register

regfile.sv - the register file (registers x0 through x31)

alu.sv - arithmetic + logic unit

control.sv - the control unit (decodes instructions and sets control lines)

imm_gen.sv - immediate generator (extracts and sign-extends constants from instructions)

data_memory.sv & instr_memory.sv - memory blocks

cpu_tb.sv - testbench to run simulation