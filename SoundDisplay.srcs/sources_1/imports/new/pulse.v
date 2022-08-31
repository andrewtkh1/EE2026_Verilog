`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 16:58:31
// Design Name: 
// Module Name: pulse
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


module pulse(input clk, inpt, output S);

wire a ,b;
DFF flip (clk, inpt, a);
DFF flips (clk, a, b);

assign S = a & ~b;
endmodule
