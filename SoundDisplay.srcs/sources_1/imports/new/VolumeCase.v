`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 15:00:04
// Design Name: 
// Module Name: VolumeCase
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


module VolumeCase(input sys_clk, input [3:0] vol_lvl, output reg [15:0] led = 0, output [7:0] sevseg, output [3:0] an );
reg [7:0] segdp0 = 8'd255;
reg [7:0] segdp1 = 8'd255;
reg [7:0] segdp2 = 8'd255;
reg [7:0] segdp3 = 8'd255;

SevenSegMod SevSegOut (.sys_clk(sys_clk), .seg0(segdp0), .seg1(segdp1), .seg2(segdp2), .seg3(segdp3), .sevsegout(sevseg), .an(an));

always @ (vol_lvl)
begin
    case (vol_lvl)
            4'd0:
                begin
                    led <= 1;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd249;
                end
            4'd1:
                begin
                    led <= 3;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd164;
                end
            4'd2:
                 begin
                    led <= 7;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd176;
                 end 
            4'd3:
                begin
                    led <= 15;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd153;          
                end
            4'd4:
                begin
                    led <= 31;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd146;
                end
            4'd5:
                begin
                    led <= 63;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd130;
                 end
            4'd6:
                begin
                    led <= 127;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd248;
                end
            4'd7:
                begin
                    led <= 255;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd128;
                end
            4'd8:
                begin
                    led <= 511;
                    segdp2 <= 8'd255;
                    segdp3 <= 8'd144;
                end
            4'd9:
                begin
                    led <= 1023;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd192;
                end
            4'd10:
                begin
                    led <= 2047;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd249;
                end
            4'd11:
                begin
                    led <= 4095;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd164;
                end
             4'd12:
                begin
                    led <= 8191;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd176;
                end
             4'd13:
                begin
                    led <= 16383;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd153;
                end
             4'd14:
                begin
                    led <= 32767;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd146;
                end
             4'd15:
                begin
                    led <= 65535;
                    segdp2 <= 8'd249;
                    segdp3 <= 8'd130;
                end
    endcase
end

endmodule
