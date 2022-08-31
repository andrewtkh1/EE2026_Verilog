`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 10:00:50
// Design Name: 
// Module Name: new_clocky
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


module new_clocky( input basys_clock, output reg clk20k = 0 );

    reg [11:0] counter = 0; //can use [31:0] max 32 bits
    
    always @ (posedge basys_clock)
    begin
        counter <= (counter == 2499)? 0:counter + 1;
        clk20k <= (counter == 0)? ~clk20k : clk20k;   
    end

endmodule
