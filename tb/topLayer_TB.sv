`timescale 1ns / 1ps

module topLayer_TB;
    logic clk;
    logic rst;
    logic [31:0] pc;
    logic [31:0] alu_result;

    topLayer uut (
        .clk(clk),
        .rst(rst),
        .pc(pc),
        .alu_result(alu_result)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/topLayer.vcd");
        $dumpvars(0, topLayer_TB);

        clk = 0;
        rst = 1;
        #10;
        rst = 0;

        #100;
        
        $finish;
    end

    initial begin
        $monitor("Time=%0t | PC=%h | ALU_Result=%h", $time, pc, alu_result);
    end

endmodule