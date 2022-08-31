`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2020 00:22:03
// Design Name: 
// Module Name: main_clk
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


module main_clk(input basys_clk,input [31:0] M, output reg clk_out = 0 );
reg [31:0] counter = 0;

always @ (posedge basys_clk)
    begin
        counter <= (counter == M ) ? 0 : counter + 1;
        clk_out <= (counter == 0) ? ~clk_out : clk_out;
    end
endmodule
