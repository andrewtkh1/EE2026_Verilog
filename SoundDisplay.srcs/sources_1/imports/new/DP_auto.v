`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2020 15:08:46
// Design Name: 
// Module Name: DP_auto
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


module DP_auto(input sys_clk,loading,input [7:0] mpx2, mpx3 ,output reg [7:0] seg0,seg1,seg2,seg3);

reg [27:0] ck = 0;
reg [25:0] ck_load = 0;
reg flip = 0;
reg [3:0] load_dp = 0;
reg [27:0] post_load_count = 0; // runs for 2 seconds
reg post_load_dp = 0;

always @ (posedge sys_clk)
begin
if (loading)
begin
load_dp <= (ck_load == 0) ? ((load_dp == 11) ? 0 : load_dp + 1) : load_dp;
ck_load <= (ck_load == 24015015) ? 0 : ck_load + 1;
post_load_count <= 150000000;

    case(load_dp)
        4'd0: begin seg0<=247; seg1<=255; seg2<=255; seg3<=255;end
        4'd1: begin seg0<=255; seg1<=247; seg2<=255; seg3<=255;end
        4'd2: begin seg1<=255; seg2<=247; seg0<=255; seg3<=255;end
        4'd3: begin seg2<=255; seg3<=247; seg1<=255; seg0<=255;end
        4'd4: begin seg3<=251; seg1<=255; seg2<=255; seg0<=255;end
        4'd5: begin seg3<=253; seg1<=255; seg2<=255; seg0<=255;end
        4'd6: begin seg3<=254; seg1<=255; seg2<=255; seg0<=255;end
        4'd7: begin seg2<=254; seg3<=255; seg1<=255; seg0<=255;end
        4'd8: begin seg1<=254; seg2<=255; seg0<=255; seg3<=255;end
        4'd9: begin seg0<=254; seg1<=255; seg2<=255; seg3<=255;end
        4'd10:begin seg0<=223; seg1<=255; seg2<=255; seg3<=255;end
        4'd11:begin seg0<=239; seg1<=255; seg2<=255; seg3<=255;end
    endcase
end

else
begin //(2)
flip <= (ck == 100000000) ? ~flip : flip;
ck <= (ck == 100000000) ? 0 : ck + 1;
post_load_count <= (post_load_count == 0) ? post_load_count : post_load_count - 1;
if (post_load_count == 0) 
    begin //(1)
        if (flip)
        begin
        //dp AUTO
        seg0 <= 136;
        seg1 <= 193;
        seg2 <= 135;
        seg3 <= 192;
        end
        else
        begin
        //dp TUNE
        seg0 <= 135;
        seg1 <= 193;
        seg2 <= 200;
        seg3 <= 134;
        end
    end //(1)
    else begin
        seg0 <= 255;
        seg1 <= 255;
        seg2 <= mpx2 + 128;
        seg3 <= mpx3;
    end
  end //(2)
end
endmodule
