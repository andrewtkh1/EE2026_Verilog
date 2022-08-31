`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 15:46:40
// Design Name: 
// Module Name: micin_to_oled
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


module micin_to_oled(input clk20k,clk8, pause_sw, input [11:0] mic_in, output reg [3:0] oled_data_case, output reg [11:0] new_mic_in);

reg [11:0] reset = 0;
reg [11:0] values = 0;
wire [3:0] temp;

always @ (posedge clk20k)
    begin
        values[11:0] = (pause_sw) ? values : ((reset == 2000) ? 0:(values[11:0] < mic_in[11:0]) ? mic_in[11:0]:values[11:0]);
        reset = (reset == 2000) ? 0 : reset + 1;
        
    end
    assign temp = (values[11:0] < 2354 ) ? 0:
                                (values[11:0] < 2436 ) ? 1:
                                (values[11:0] < 2554 ) ? 2:
                                (values[11:0] < 2672 ) ? 3:
                                (values[11:0] < 2790 ) ? 4:
                                (values[11:0] < 2908 ) ? 5:
                                (values[11:0] < 3026 ) ? 6:
                                (values[11:0] < 3144 ) ? 7:
                                (values[11:0] < 3262 ) ? 8:
                                (values[11:0] < 3380 ) ? 9:
                                (values[11:0] < 3498 ) ? 10:
                                (values[11:0] < 3616 ) ? 11:
                                (values[11:0] < 3734 ) ? 12:
                                (values[11:0] < 3852 ) ? 13:
                                (values[11:0] < 3970 ) ? 14:15;
    
always @ (posedge clk8)
    begin
        oled_data_case <= temp;
    end


endmodule
