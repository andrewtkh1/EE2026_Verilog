`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2020 18:12:38
// Design Name: 
// Module Name: dist_tune
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

//this is meant for distance. it will tune to range at press of button.
//use Raw button signal & raw bit inputs.
module dist_tune(input sys_clk, bt_in, input [11:0] in_bits, output [11:0] out_bits);

reg flag = 0;
reg [30:0] average_val = 0;
reg [25:0] c10sec = 1; // counter to count ?? sec.
reg [4:0] xer = 10; //multipler default 1.0
reg [10:0] reset = 0;
reg [11:0] avg_out = 0, avg_vol = 0;
wire c20khz;
wire logic_clk, cbthz, bt;

main_clk t20khz (.basys_clk(sys_clk), .M(2499), .clk_out(c20khz));//20khz for button
main_clk btclk (.basys_clk(sys_clk), .M(2097152), .clk_out(cbthz));//button hz
pulse buttonUP(.clk(cbthz) ,.inpt(bt_in) ,.S(bt));//generates 1 pulse

// represents 1.0 multiplier etc....
//allows logic to run as long as flag on.
assign logic_clk = (flag) ? sys_clk : 0;
assign out_bits = (in_bits * xer) / 10;

//gets the avg
always @ (posedge c20khz)
begin
    avg_vol <= (reset == 2000) ? 0 : (avg_vol < in_bits) ? in_bits : avg_vol;
    reset <= (reset == 2000) ? 0 : reset + 1;
    //avg_out <= (reset == 2000) ? avg_vol : avg_out;
end

//to start/stop the auto tune
always @ (posedge sys_clk)
begin
    //counts up to 10 sec
    c10sec <= (bt || c10sec > 1) ? c10sec + 1 : 1;
    //flag 10 for 10 seconds then off flag.
    flag <= (bt) ? 1 : ((c10sec == 0) ? 0 : flag);
    average_val <= (average_val + avg_vol) / 2;
end

//Logic to increase or decrease mpx
always @ (posedge logic_clk)
begin
        if (bt)
        begin
            //to reset to 1.0 at start
            xer <= 10;
        end
        else if((in_bits*xer)/10 < 12'd3980)//2790
        begin
            xer <= (xer == 31) ? xer : xer + 1;
        end
        else if((in_bits*xer)/10 > 12'd4095)//3000
        begin
            xer <= (xer == 1) ? xer : xer - 1;
        end
        else xer <= xer;
end

endmodule
