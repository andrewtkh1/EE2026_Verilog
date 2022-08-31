`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 17:00:17
// Design Name: 
// Module Name: Multiplier
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

//each time push button, Multipler increase by 0.1
//produces a disp to on 7seg to show current multipler val
module Multiplier(input [11:0] raw_sounds, input btup_in, btdown_in, btauto_in, sys_clk, input [1:0] sw1, output [11:0] sound, output [7:0] mpx_seg, output [3:0] mpx_an);

reg [4:0] counter = 10; //this represents multiplicator (Default val = 10. 1.0)
reg [11:0] avg_vol = 0, avg_out = 0;
reg [10:0] reset = 0;
reg [7:0] s0hold, s1hold, s2hold, s3hold;
wire [7:0] s1 = 255,s0 = 255;
wire [4:0] auto_counter;
wire [7:0] s2,s3,s0auto,s1auto,s2auto,s3auto;
wire c20khz, btclk, btdown, btup, btauto;
wire flag;
wire [30:0] hold;

main_clk clock_bt (.basys_clk(sys_clk), .M(2097152), .clk_out(btclk));//button hz
main_clk twentykhz (.basys_clk(sys_clk), .M(2499), .clk_out(c20khz));//20khz

pulse buttonUP(.clk(btclk) ,.inpt(btup_in) ,.S(btup));
pulse buttoDown(.clk(btclk) ,.inpt(btdown_in) ,.S(btdown));
pulse buttoAuto(.clk(btclk) ,.inpt(btauto_in) ,.S(btauto));

DP_auto auto_display (.sys_clk(sys_clk),.seg0(s0auto),.seg1(s1auto),.seg2(s2auto),.seg3(s3auto),.loading(flag),.mpx2(s2),.mpx3(s3));
tune_logic auto_tune (.sys_clk(sys_clk), .bits(avg_out), .bt(btauto), .xer(auto_counter),.flag(flag));

dec_to_seg dtc2 (.dec_val(counter/10),.seg_val(s2));
dec_to_seg dtc3 (.dec_val(counter%10),.seg_val(s3));

SevenSegMod seggg (.sys_clk(sys_clk),.sevsegout(mpx_seg),.an(mpx_an),.seg0(s0hold),.seg1(s1hold),.seg2(s2hold),.seg3(s3hold));

//gives average
always @ (posedge c20khz)
begin
    avg_vol <= (reset == 2000) ? 0 : (avg_vol < raw_sounds) ? raw_sounds : avg_vol;
    reset <= (reset == 2000) ? 0 : reset + 1;
    avg_out <= (reset == 2000) ? avg_vol : avg_out;
end

//Manual counter
always @ (posedge btclk)
begin
    case(sw1)
        2'b10:
        begin
            counter <= (sw1) ? ((btup) ? counter + 1 : ((btdown) ? counter - 1 : counter)) : counter;
            s0hold <= 255;
            s1hold <= 255;
            s2hold <= s2 + 128;
            s3hold <= s3;
        end
        2'b11:
        begin
            counter <= (flag) ? auto_counter : counter;
            if (flag)
            begin
            s0hold <= s0auto;
            s1hold <= s1auto;
            s2hold <= s2auto;
            s3hold <= s3auto;
            end
            else
            begin
            s0hold <= s0auto;
            s1hold <= s1auto;
            s2hold <= s2auto;
            s3hold <= s3auto;
            end
        end
    endcase
end
assign hold = raw_sounds * counter;
assign sound = hold / 10;
endmodule


















