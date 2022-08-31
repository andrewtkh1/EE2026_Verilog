`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2020 16:24:41
// Design Name: 
// Module Name: AmpDisplay
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


module AmpDisplay(input basys_clock,input [12:0] x, input [12:0] y, output reg [15:0] pixel_data);

    always @ (posedge basys_clock)
    begin
                if( (x == 92) && ((y < 57) && (y > 47)))    //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if ((x == 90) && ((y<50) && (y>47)))   //.
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x < 88 && x > 84) && y == 56) || ((x == 88) && (y <56 && y > 52)) || ((x < 88 && x > 85) && y == 52) || ((x == 85) && (y < 52 && y > 48)) || ((y ==48) && (x < 89 && x>85)))  //s
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x < 84 && x > 78) && (y == 56)) || ((x == 81) && (y < 56 && y > 47))) //t
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x == 77) && (y<57 && y>48)) || ((x<77 && x > 74) && (y == 48)) || ((x==74) && (y<57 && y>48)))    //u
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if((x==72) && (y<50 && y>47))  //.
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x == 70) && (y<56 && y >47)) || ((x<70 && x>67) && y==56) || ((x<70 && x>67) && y==52) || (x == 67) && (y<56&&y>47))  //a
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if((x == 92) && ((y < 45) && (y > 35)))    //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if((x == 90) && ((y <45) && (y >35)))    //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if ((x == 88) && ((y <38) && (y>35)))  //.
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x < 86 && x > 82) && y == 44) || ((x == 86) && (y<44 && y>40)) || ((x<86 && x>83 ) && y == 40) || ((x == 83) && (y < 40 && y> 36)) || ((y == 36) && (x<87&&x>83)))    //S
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x<82 && x>76) && (y==44)) || ((x == 79) && (y<44 && y>35)))   //T
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x == 75) && (y<45 && y>36)) || ((x<75 && x>72) && (y == 36)) || ((x==72) && (y<45 && y>36)))  //U
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if((x==70) && (y<38 && y>35))  //.
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x == 68) && (y<45&&y>35)) || ((x<68&&x>65) && y==44) ||((x<68&&x>65) && y==40) ||((x<68&&x>65) && y==36) || ((x == 65) && (y<44&&y>40)) || ((x == 65) && (y<40&&y>36)))   //B
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if( (x == 92) && (y < 29 && y >19))    //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if( (x == 90) && ((y < 29) && (y > 19)))   //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if( (x == 88) && (y <29 && y >19)) //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if ((x == 86) && (y<22 && y>19))   //.
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x==84) && (y<28 && y>19)) || ((x<84 &&x>81)&&  y==28) ||((x<84 &&x>81)&& y==24) || ((x==81) && (y<28 && y>19)))   //A
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x==79) && (y<29 && y>19)) || ((x == 78) && (y == 27)) || ((x == 77) && (y<28 && y>25)) || ((x == 76) && (y == 27))||((x==75) && (y<29 && y>19)))   //M
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x == 73) && (y<29 && y>19)) || ((x<73 && x>70) && y == 28)||((x<73 && x>70) && y==24) || ((x==70) && (y<28 && y>24))) //P
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(x <93 && x>69 && y<29 && y>19)  //Border
                            pixel_data = {5'b00000, 6'b000000,5'b11111};
                        else if( (x == 92) && (y<15 && y>5))    //1
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if( (x == 90) && (y <15 && y>7) || (x == 89) && ((y< 9) && (y > 6)) || (x == 88) && (y<8 && y>5) || ((x==87) && (y<9&&y>6)) || ((x==86)&&(y<15 && y>7)))
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x==84) && (y<8 && y>5)))
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x==82) && (y<14 && y>10)) || ((x<82 && x>78) && (y == 14)) || ((x<82 && x>79) && (y == 10)) || ((x==79) && (y<10 && y>6)) || ((x<83 && x>80) && y==6))
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else if(((x == 77) && (y<15 && y>5)) || ((x<77 && x>74) && y == 14) ||((x<77 && x>74)&& y==10) || ((x==74) && (y<14 && y>10)))
                            pixel_data = {5'b11111, 6'b111111,5'b11111};
                        else
                            pixel_data = {5'b00000, 6'b000000,5'b00000};
    end
    
endmodule