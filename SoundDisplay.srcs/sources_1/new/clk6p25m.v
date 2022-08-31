`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 16:50:12
// Design Name: 
// Module Name: clock6p25m
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


module clock6p25m(input basys_clock,output reg clk6p25m = 0);

    reg [31:0] counter;
    
    always @ (posedge basys_clock)
    begin
        counter <= (counter == 7) ? 0: counter + 1;
        clk6p25m <= (counter == 0) ? ~clk6p25m : clk6p25m;
    end
endmodule
