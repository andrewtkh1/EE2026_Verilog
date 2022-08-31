`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2020 17:57:00
// Design Name: 
// Module Name: Oled_coordinates
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


module Oled_coordinates(input [12:0] sample_index, output reg [12:0] x_axis, output reg [12:0] y_axis );

    always @ (*)
    begin
        x_axis = sample_index[12:0] % 96;
        y_axis = sample_index[12:0] / 96;
    end
endmodule
