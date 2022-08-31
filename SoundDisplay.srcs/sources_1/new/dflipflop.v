`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2020 18:54:19
// Design Name: 
// Module Name: dflipflop
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



module dflipflop(input basys_clock, pb,output reg q_output = 0 );

        always @ (posedge basys_clock) begin
        q_output <= pb;
        end
endmodule

