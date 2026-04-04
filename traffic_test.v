`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 12:17:40
// Design Name: 
// Module Name: traffic_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_test;

reg X, clk, clr;
wire [1:0] hwy, cty;

Traffic_controller_system uut (
    .X(X), 
    .clk(clk), 
    .clr(clr), 
    .hwy(hwy), 
    .cty(cty)
);

always #5 clk = ~clk;


initial begin
    $monitor("Time=%0t | clr=%b | X=%b | hwy=%b | cty=%b",
              $time, clr, X, hwy, cty);
end


initial begin
    clk = 0;
    clr = 1;   
    X = 0;

    #10 clr = 0;  

    
    #20 X = 0;
    #20 X = 1;
    #40 X = 0;
    #40 X = 1;
    #40 X = 0;

    #200 $finish;
end

endmodule