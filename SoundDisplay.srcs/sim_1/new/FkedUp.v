`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 00:04:25
// Design Name: 
// Module Name: FkedUp
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


module FkedUp(  );

reg basys_clock;
wire new_clock;
wire [7:0] rgbs;
wire reset_signal;
wire oled_data;

clock6p25m clocky(basys_clock, new_clock);

Oled_Display oled(.clk(new_clock), .reset(reset_signal),.pixel_data(oled_data), .cs(rgbs[0]), .sdin(rgbs[1]), .sclk(rgbs[3]), .d_cn(rgbs[4]), .resn(rgbs[5]), .vccen(rgbs[6]),
      .pmoden(rgbs[7]));




endmodule
