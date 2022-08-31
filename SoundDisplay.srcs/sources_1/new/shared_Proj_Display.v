`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2020 12:34:01
// Design Name: 
// Module Name: shared_Proj_Display
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


module shared_Proj_Display(input clk6p25m, input [12:0] x, input [12:0] y, input signed [30:0] raw_x,input [15:0] raw_y, output reg [15:0] pixel_data );
     
     
     wire [15:0] final_y;
     //wire [15:0] final_y_bound;
     wire signed [30:0] final_x;
     //wire [15:0] final_x_bound;
     wire [30:0] pos_x = -final_x;
     wire [30:0] pos;
     
     assign final_y = (raw_y *3) + 6;
     //assign final_x = (raw_x *2) - 59;
     assign final_x = (raw_x *2) -35;
     
     //assign pos = (raw_x[30] == 1'b1) ? pos_x + 49 : 49 - pos_x;
     
     always @ (posedge clk6p25m)
     begin
        if(x==45 && (y<63&&y>5))
            pixel_data = {5'b11111,6'b000000,5'b00000};
        else if(((x<92 && x>45) && y == 6) || ((x<45 && x>2) && y==6))
            pixel_data = {5'b11111,6'b000000,5'b00000};
        else if((x<pos_x+2 && x>pos_x-2) && (y<final_y+2 && y>final_y-2))
            pixel_data = {5'b11111,6'b111111,5'b11111};
        else
            pixel_data = {5'b00000,6'b000000,5'b00000};
     end
endmodule
