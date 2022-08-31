`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 15:20:19
// Design Name: 
// Module Name: SevenSegMod
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

//Give it the 4 sevseg you want to display and it will rotate for you.
//Starting from seg0 > ... > seg3
module SevenSegMod(input [7:0] seg0, seg1, seg2, seg3 , input sys_clk , output reg [3:0] an = 4'b1111, output reg [7:0] sevsegout);
wire fastclk;//762 hz
reg [1:0] counter = 0;
main_clk sevsegclk (.basys_clk(sys_clk), .M(65616), .clk_out(fastclk));

always @ (posedge fastclk)
begin
    case (counter)
        2'd0:
            begin
                sevsegout <= seg0;
                an <= 4'b0111;
            end
        2'd1:
            begin
                sevsegout <= seg1;
                an <= 4'b1011;
            end
        2'd2:
            begin
                sevsegout <= seg2;
                an <= 4'b1101;
            end
        2'd3:
            begin
                sevsegout <= seg3;
                an <= 4'b1110;
            end
    endcase    
    counter <= counter + 1;
end
endmodule
