`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 22:52:09
// Design Name: 
// Module Name: fuck
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


module fuck( );

reg sw15, sw13;
reg [3:0] oled_counter;
reg clk20k;
//reg [12:0] sample_index;  .sample_index(sample_index)
wire [15:0] pixel_data;

//subtask_4B wtf(.clk6p25m(clk20k),.sw15(sw15),.sw13(sw13),.oled_counter(oled_counter), .pixel_data(pixel_data));
dual_mic_dist dp (.sys_clk(clk20k));
shared_Proj_Display (.clk6p25m(clk20k));
always begin
#5 clk20k = ~clk20k;
end

initial begin

    clk20k = 0;
    //sample_index = 94;
    
    sw15 = 1;sw13 = 1;oled_counter[3:0] = 4; #250; 
    sw15 = 0; #250;
end


endmodule
