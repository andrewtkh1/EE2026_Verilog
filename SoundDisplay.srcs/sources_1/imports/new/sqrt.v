`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2020 11:01:12
// Design Name: 
// Module Name: sqrt
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

//maximum is sqrt of 16.
module sqrt(input [30:0] sqrt_in, output [15:0] sqrt_out);
// DO NOT TOUCH CODE BELOW
//https://verilogcodes.blogspot.com/2017/11/a-verilog-function-for-finding-square-root.htmls
assign sqrt_out = sqrt(sqrt_in);
                  reg [15:0] sqr;
                  //Verilog function to find square root of a 32 bit number.
                  //The output is 16 bit.
                  function [15:0] sqrt;
                      input [31:0] num;  //declare input
                      //intermediate signals.
                      reg [31:0] a;
                      reg [15:0] q;
                      reg [17:0] left,right,r;    
                      integer i;
                  begin
                      //initialize all the variables.
                      a = num;
                      q = 0;
                      i = 0;
                      left = 0;   //input to adder/sub
                      right = 0;  //input to adder/sub
                      r = 0;  //remainder
                      //run the calculations for 16 iterations.
                      for(i=0;i<16;i=i+1) begin 
                          right = {q,r[17],1'b1};
                          left = {r[15:0],a[31:30]};
                          a = {a[29:0],2'b00};    //left shift by 2 bits.
                          if (r[17] == 1) //add if r is negative
                              r = left + right;
                          else    //subtract if r is positive
                              r = left - right;
                          q = {q[14:0],!r[17]};       
                      end
                      sqrt = q;   //final assignment of output.
                  end
                  endfunction //end of Function
endmodule
