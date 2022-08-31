`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 11:40:24
// Design Name: 
// Module Name: raw_numbers
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

//Raw input splits in val_x then to Vx then into 7seg dislp and out
module raw_numbers(input sys_clk, input [11:0] raw_sound, output [7:0] segout, output [3:0] anout);

reg [3:0] val_0 = 0, val_1 = 0, val_2 = 0, val_3 = 0;
wire [7:0] v0,v1,v2,v3;
wire c11hz;
wire [15:0] raw_soundy;
wire signed [30:0] raw_soundx;
wire [4:0] A, B;

dec_to_seg val0 (val_0,v0);
dec_to_seg val1 (val_1,v1);
dec_to_seg val2 (val_2,v2);
dec_to_seg val3 (val_3,v3);

SevenSegMod segdisp (.sys_clk(sys_clk),.seg0(v0),.seg1(v1),.seg2(v2),.seg3(v3),.sevsegout(segout),.an(anout));
main_clk clkddd(.basys_clk(sys_clk),.M(4545453),.clk_out(c11hz)); //11Hz

//dual_mic_dist LLR (.sys_clk(sys_clk),.bt_in(bt_in),.mic_1(micL),.mic_2(micR),.x1(A),.y1(B));
//dist_tune ts (.sys_clk(sys_clk),.bt_in(bt_in),.in_bits(raw_sound),.out_bits(raw_soundss));
//sound_distance dist (.bsys_clk(sys_clk),.raw_sound(raw_sound),.average_bit(raw_soundss));

//assign val_3 = raw_sound % 10;
//assign val_2 = (raw_sound / 10) % 10;
//assign val_1 = (raw_sound / 100) % 10;
//assign val_0 = raw_sound / 1000;

always @ (posedge c11hz)
begin
//val_3 <= raw_soundy % 10;
//val_2 <= (raw_soundy / 10) % 10;
//val_1 <= (raw_soundx[30] == 1'b1) ? ((-raw_soundx) / 100) % 10 : (-raw_soundx / 100) % 10;
//val_0 <= -raw_soundx / 1000;
val_3 <= raw_sound % 10;
val_2 <= (raw_sound / 10) % 10;
val_1 <= (raw_sound / 100) % 10;
val_0 <= raw_sound / 1000;
end
endmodule
