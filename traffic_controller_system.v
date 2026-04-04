`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 12:16:55
// Design Name: 
// Module Name: traffic_controller_system
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



module Traffic_controller_system(
    input X, clk, clr,
    output reg [1:0] hwy, cty
);


parameter r = 2'b00;
parameter y = 2'b01;
parameter g = 2'b10;


parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;

reg [2:0] state, next_state;


always @(posedge clk or posedge clr) begin
    if (clr)
        state <= s0;
    else
        state <= next_state;
end


always @(*) begin
    next_state = state; 

    case(state)
        s0: next_state = (X == 0) ? s0 : s1;
        s1: next_state = s2;
        s2: next_state = s3;
        s3: next_state = (X == 0) ? s0 : s4;
        s4: next_state = s0;
        default: next_state = s0;
    endcase
end


always @(*) begin
    case(state)
        s0: begin hwy = g; cty = r; end
        s1: begin hwy = y; cty = r; end
        s2: begin hwy = r; cty = r; end
        s3: begin hwy = r; cty = g; end
        s4: begin hwy = r; cty = y; end
        default: begin hwy = r; cty = r; end
    endcase
end

endmodule
