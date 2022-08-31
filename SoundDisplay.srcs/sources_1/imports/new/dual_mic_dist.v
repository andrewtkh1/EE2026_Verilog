`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2020 16:43:42
// Design Name: 
// Module Name: dual_mic_dist
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

//Gives you x and y axis. (NOTE THAT x can be pos/neg value. y will always be pos.
//give it raw button to use to tune.
module dual_mic_dist(input sys_clk, bt_in, input [11:0] mic_1, mic_2, output signed [30:0] x, output [15:0] y);

wire signed [6:0] r1 , r2;
wire signed [30:0] x_hold, pre_sqrt;
reg [30:0] abs_pre_sqrt = 0;
wire signed [30:0] r1_hold;
wire signed [30:0] m_hold;

sound_distance mic1_dist(sys_clk, bt_in, mic_1, r1);//Right Mic
sound_distance mic2_dist(sys_clk, bt_in, mic_2, r2);//Left Mic

sqrt srtfunc(.sqrt_in(abs_pre_sqrt),.sqrt_out(y));


assign m_hold = (r1*r1) - (r2*r2) - 196;

assign x_hold = m_hold / 28 ;
assign x = x_hold;
assign pre_sqrt = (r1*r1) - (x*x);

always @ (*)
begin
    if (pre_sqrt[30] == 1'b1) begin
    abs_pre_sqrt = -pre_sqrt;
    end
    else begin
    abs_pre_sqrt = pre_sqrt;
    end
end
endmodule
