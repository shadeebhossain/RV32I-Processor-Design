`timescale 1ns / 1ps

module ProgramCounter_tb;

reg clk;
reg reset;
wire [31:0] pc_out;

// Instantiate the ProgramCounter module
ProgramCounter uut (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)
);

// Clock generation
always begin
    #5 clk = ~clk;
end

// Stimulus process
initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    #10 reset = 0;

    // Simulate for some clock cycles
    #100;

    // Check the output
    if (pc_out !== 32'h00000004)
        $fatal("Error: PC not initialized correctly");

 

    $stop;
end

endmodule
