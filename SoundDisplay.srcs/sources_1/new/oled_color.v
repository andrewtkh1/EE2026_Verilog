`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 09:20:56
// Design Name: 
// Module Name: oled_color
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


module oled_color(input basys_clock, input [2:0] oled_choice, output reg [15:0] oled_final_color );

    always @ (posedge basys_clock)
    case ( oled_choice)
        3'b001 :    //Cyan  1
            begin
                oled_final_color = {5'b00000, 6'b111000, 5'b11100};
            end
        3'b010 :    //Magenta   2
            begin
                oled_final_color = {5'b11100, 6'b000000, 5'b11100};
            end
        3'b011:     //Red   3
            begin
                oled_final_color = {5'b11111, 6'b000000, 5'b00000};
            end
        3'b100:     //Yellow    4
            begin
                oled_final_color = {5'b11111, 6'b111110, 5'b00000};
            end
        3'b101:     //Green     5
            begin
                oled_final_color = {5'b00000, 6'b111110, 5'b00000};
            end
    endcase
endmodule
