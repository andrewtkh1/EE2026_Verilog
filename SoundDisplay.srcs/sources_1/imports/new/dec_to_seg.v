`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 12:15:05
// Design Name: 
// Module Name: dec_to_seg
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


module dec_to_seg(input [3:0] dec_val, output [7:0] seg_val);
assign seg_val = (dec_val == 0) ? 192 :
                 (dec_val == 1) ? 249 :
                 (dec_val == 2) ? 164 :
                 (dec_val == 3) ? 176 :
                 (dec_val == 4) ? 153 :
                 (dec_val == 5) ? 146 :
                 (dec_val == 6) ? 130 :
                 (dec_val == 7) ? 248 :
                 (dec_val == 8) ? 128 :
                 (dec_val == 9) ? 144 :
                 255;
endmodule
