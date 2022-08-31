`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 17:42:48
// Design Name: 
// Module Name: oled_debounce_signal
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


module oled_debounce_signal(input twentyhz,middle_btn,output signal);
    
    wire signalone;
    wire signaltwo;
    
    dflipflop first(twentyhz,middle_btn, signalone);
    dflipflop second(twentyhz,signalone, signaltwo);
    
    assign signal = signalone & ~signaltwo;
    

endmodule
