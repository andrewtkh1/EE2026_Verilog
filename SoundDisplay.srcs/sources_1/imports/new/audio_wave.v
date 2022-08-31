`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 10:35:47
// Design Name: 
// Module Name: audio_wave
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


module audio_wave(input [11:0] raw_sound, input c20khz, sys_clk, output [15:0] led, output [7:0] sevseg, output [3:0] an);
reg [11:0] max_vol = 0;
reg [3:0] cases = 0;
reg [10:0] reset = 0;
wire [3:0] temp;
wire c8hz;

main_clk fivehz (.basys_clk(sys_clk), .M(6249999), .clk_out(c8hz));//8hz 6249999
VolumeCase volume (.sys_clk(sys_clk), .vol_lvl(cases), .led(led), .sevseg(sevseg), .an(an));

//gets the max vol every 20khz
always @ (posedge c20khz)
begin
    max_vol <= (reset == 2000) ? 0 : (max_vol < raw_sound) ? raw_sound : max_vol;
    reset <= (reset == 2000) ? 0 : reset + 1;
end

//depending on raw volume output what case
assign temp = (max_vol <= 2318) ? 0 :
     (max_vol <= 2436) ? 1 :
     (max_vol <= 2554) ? 2 :
     (max_vol <= 2672) ? 3 :
     (max_vol <= 2790) ? 4 :
     (max_vol <= 2908) ? 5 :
     (max_vol <= 3026) ? 6 :
     (max_vol <= 3144) ? 7 :
     (max_vol <= 3262) ? 8 :
     (max_vol <= 3380) ? 9 :
     (max_vol <= 3498) ? 10 :
     (max_vol <= 3616) ? 11 :
     (max_vol <= 3734) ? 12 :
     (max_vol <= 3852) ? 13 :
     (max_vol <= 3970) ? 14 : 15;
     
always @ (posedge c8hz)
begin
     cases <= temp;
end

endmodule
