`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 08:21:40
// Design Name: 
// Module Name: sound_distance
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


module sound_distance(input bsys_clk, bt_tune, input [11:0] raw_sound, output [4:0] temps); //reg [11:0] average_bit = 0);
wire chz,c8hz;
wire [11:0] average_bit_tuneds;
reg [11:0] average_bit_tuned;
reg [30:0] reset = 0;
reg [11:0] average_bit = 0;
reg [11:0] avg_sound = 0, temp = 2048;

main_clk clock_hz (.basys_clk(bsys_clk),.M(2499),.clk_out(chz)); //20khz
dist_tune tune_distance(.sys_clk(bsys_clk), .bt_in(bt_tune),.in_bits(avg_sound),.out_bits(average_bit_tuneds)); 

main_clk fivehz (.basys_clk(bsys_clk), .M(6249999), .clk_out(c8hz));//8hz 6249999

assign temps = (average_bit_tuned >= 3980) ? 0 :
     (average_bit_tuned >= 3898) ? 1 :
     (average_bit_tuned >= 3816) ? 2 :
     (average_bit_tuned >= 3734) ? 3 :
     (average_bit_tuned >= 3652) ? 4 :
     (average_bit_tuned >= 3570) ? 5 :
     (average_bit_tuned >= 3488) ? 6 :
     (average_bit_tuned >= 3406) ? 7 :
     (average_bit_tuned >= 3324) ? 8 :
     (average_bit_tuned >= 3242) ? 9 :
     (average_bit_tuned >= 3160) ? 10 :
     (average_bit_tuned >= 3078) ? 11 :
     (average_bit_tuned >= 2996) ? 12 :
     (average_bit_tuned >= 2914) ? 14 :
     (average_bit_tuned >= 2832) ? 16 :
     (average_bit_tuned >= 2750) ? 18 :
     (average_bit_tuned >= 2668) ? 20 : 20;
     
     
always @ (posedge chz)
begin
    avg_sound <= (reset == 10000) ? 0 : ((avg_sound < raw_sound)  ? raw_sound : avg_sound);
    reset <= (reset == 10000) ? 0 : reset + 1;
end

always @ (posedge c8hz)
begin
    average_bit_tuned <= average_bit_tuneds;
end

always @(posedge bsys_clk)
begin
temp <= (avg_sound + temp) / 2;
average_bit <= (temp + average_bit) / 2;
end

endmodule