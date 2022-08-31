`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2020 15:06:33
// Design Name: 
// Module Name: Menu_display
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


module Menu_display(input clk6p25m,twentyhz, menuChoose,menuSelect,input [12:0] x, input [12:0] y, output reg [15:0] pixel_data, output reg [1:0] selection);
    
    reg [1:0] counter = 0;
    wire [15:0] A_temp_pixel_data;
    wire [15:0] B_temp_pixel_data;
    wire [15:0] Amp_temp_pixel_data;
    wire [15:0] SP_temp_pixel_data;
    StudentA selectA(clk6p25m,x,y,A_temp_pixel_data);
    StudentB selectB(clk6p25m,x,y,B_temp_pixel_data);
    AmpDisplay selectAMP(clk6p25m,x,y,Amp_temp_pixel_data);
    spDisplay selectSP(clk6p25m,x,y,SP_temp_pixel_data);
    always @ (posedge twentyhz)
    begin
        if(menuChoose == 1)
            counter = (counter == 3) ? 0: counter + 1;
        if(menuSelect == 1)
            selection = counter;    
    end
            
    
    always @ (posedge clk6p25m)
    case (counter)
        2'b00:
        begin
            pixel_data = A_temp_pixel_data;
        end
        2'b01:
        begin
            pixel_data = B_temp_pixel_data;
        end
        2'b10:
        begin
            pixel_data = Amp_temp_pixel_data;
        end
        2'b11:
        begin
            pixel_data = SP_temp_pixel_data;
        end
    endcase
    
endmodule
