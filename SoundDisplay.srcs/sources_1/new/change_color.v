`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2020 07:59:18
// Design Name: 
// Module Name: change_color
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


module change_color(input twentyhz,input bgc_signal, output reg [15:0] volume_color_low = 0, output reg [15:0] volume_color_mid = 0,output reg [15:0] volume_color_high = 0,output reg [15:0] border_color = 0, output reg [15:0] background_color = 0);

    reg [1:0] counter = 0;
    
    always @ (posedge twentyhz)
    begin
        counter = (bgc_signal == 1) ? ((counter < 2) ? counter + 1: 0) : counter;
    end
    
    always @ (posedge twentyhz)
        case (counter)
            2'b00:
                begin
                volume_color_low = {5'b11111, 6'b000000, 5'b00000}; //Red
                volume_color_mid = {5'b11111, 6'b111110, 5'b00000}; //Yellow
                volume_color_high = {5'b00000, 6'b111110, 5'b00000}; //Green
                border_color = {5'b11111, 6'b111111, 5'b11111}; //White
                background_color = {5'b00000,6'b000000,5'b00000}; //Black
                end
            2'b01:
                begin
                volume_color_low = {5'b00000,6'b111111,5'b00000}; //Green
                volume_color_mid = {5'b00000,6'b000000,5'b11111};   //Blue
                volume_color_high = {5'b11111,6'b000000,5'b00000};  //Red
                border_color = {5'b00000,6'b000000,5'b00000};   //Black
                background_color = {5'b11111,6'b111110,5'b11111};   //White
                end
            2'b10:
                begin
                volume_color_low = {5'b00000,6'b000000,5'b11111};   //Blue
                volume_color_mid = {5'b00000,6'b111111,5'b00000};   //Green
                volume_color_high = {5'b11111,6'b000000,5'b11111};  //Purple
                border_color = {5'b11111,6'b111111,5'b00000};   //yellow
                background_color = {5'b11100,6'b000000,5'b00000};   //Red
                end
        endcase
endmodule
