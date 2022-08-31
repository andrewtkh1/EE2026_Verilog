`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 10:23:47
// Design Name: 
// Module Name: sim_20_khz
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


module sim_20_khz( );

    reg clocky_sim;
    wire new_clock;
    
    new_clocky simClock(clocky_sim, new_clock);
    
    always begin
        #5 clocky_sim = ~clocky_sim;
    end
    
    
    initial
    begin
       clocky_sim = 0;    
    
    end
endmodule
