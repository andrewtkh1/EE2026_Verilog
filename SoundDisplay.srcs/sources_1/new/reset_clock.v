`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 22:51:59
// Design Name: 
// Module Name: reset_clock
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


module reset_clock( input basys_clock, output reg reset_clock = 0);

    reg [20:0] counter;
    
    always @ (posedge basys_clock)
        begin
            counter <= counter + 1;
            reset_clock <= (counter ==0) ? ~reset_clock: reset_clock;
        end
endmodule
