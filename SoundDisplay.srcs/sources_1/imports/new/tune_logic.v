`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 20:58:11
// Design Name: 
// Module Name: tune_logic
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

//Give it 100mhz, averaged out bits.
module tune_logic(input sys_clk, bt, input [11:0] bits, output reg [4:0] xer = 10, reg flag = 0);

wire logic_clk;
reg [30:0] average_val = 0;
reg [28:0] c10sec = 1; // counter to count 10 sec.
// represents 1.0 multiplier etc....
//allows logic to run as long as flag on.
assign logic_clk = (flag) ? sys_clk : 0;

always @ (posedge sys_clk)
begin
    //counts up to 10 sec
    c10sec <= (bt || c10sec > 1) ? c10sec + 1 : 1;
    //flag 10 for 10 seconds then off flag.
    flag <= (bt) ? 1 : ((c10sec == 0) ? 0 : flag);
    average_val <= (average_val + bits) / 2;
end

//Logic to increase or decrease mpx
always @ (posedge logic_clk)
begin
        if (bt)
        begin
            //to reset to 1.0 at start
            xer <= 10;
        end
        else if((average_val*xer)/10 < 12'd2790)
        begin
            xer <= (xer == 31) ? xer : xer + 1;
        end
        else if((average_val*xer)/10 > 12'd3000)
        begin
            xer <= (xer == 1) ? xer : xer - 1;
        end
        else xer <= xer;
end
endmodule
