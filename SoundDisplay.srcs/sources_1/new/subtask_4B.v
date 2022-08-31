`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 21:19:18
// Design Name: 
// Module Name: subtask_4B
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


module subtask_4B(input clk6p25m,clk20k,twentyhz,input [12:0] sample_index,/*input [12:0] x_axis, input [12:0] y_axis,*/ input sw15, sw14,sw13,sw12,sw11,bgc_signal,input [3:0] oled_counter, output reg [15:0] pixel_data);
    
    wire sw11_result = sw11;
    wire temp_color;
    reg [1:0] counter_bgc = 0;
    wire counter_border = 0;
    
    reg [2:0] counter_sw14 = 0;
    reg [3:0] temp_pixel_data2;
    reg [3:0] temp_pixel_data;
    reg[1:0] pause_flag = 0;
    
    reg [12:0] x_axis;
    reg [12:0] y_axis;
    
    wire [15:0] volume_color_low;
    wire [15:0] volume_color_mid;
    wire [15:0] volume_color_high;
    wire [15:0] border_color;
    wire [15:0] background_color;
    
    change_color new_colors(.twentyhz(twentyhz), .bgc_signal(bgc_signal),.volume_color_low(volume_color_low),.volume_color_mid(volume_color_mid),.volume_color_high(volume_color_high),.border_color(border_color),.background_color(background_color));
    
    always @ (*)
    begin
        x_axis = sample_index[12:0] % 96;
        y_axis = sample_index[12:0] / 96;
    end
    
    always @ (posedge clk6p25m)   
    begin
    if(sw15 == 1)   //Toggle everything
    begin
        if(sw14 == 1)
        begin
            if(sw13 == 0) //Toggle 3px White Border
            begin     
                if((y_axis <3 ) || (x_axis < 2) || (x_axis > 91) || (y_axis > 60) )
                pixel_data = border_color;
                else
                pixel_data = background_color;
            end
            else if(sw13 == 1) //Toggle 1px White Border
            begin    
                if((y_axis == 0)||(x_axis == 95)||(x_axis == 94)||(y_axis == 63))
                pixel_data = border_color;
                else
                pixel_data = background_color;
            end
        end
    
        if(sw12 == 1)
        begin
                case (oled_counter)
                4'b0000:
                    begin
                        if((x_axis > 36 && x_axis<61) && (y_axis>5 && y_axis < 8))
                        pixel_data = volume_color_low;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end
                4'b0001:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11)))
                        pixel_data = volume_color_low;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end
                4'b0010:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14)))
                        pixel_data = volume_color_low;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end
                4'b0011:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17)))
                        pixel_data = volume_color_low;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end
                4'b0100:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                        pixel_data = volume_color_low;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end                  
                4'b0101:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                            pixel_data = volume_color_low;
                        else if((x_axis > 36 && x_axis<61) && (y_axis>20 && y_axis<23))
                            pixel_data = volume_color_mid;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end
                4'b0110:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                            pixel_data = volume_color_low;
                        else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26)))
                            pixel_data = volume_color_mid;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end
                4'b0111:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                            pixel_data = volume_color_low;
                        else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29)))
                            pixel_data = volume_color_mid;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;   
                    end
                4'b1000:
                    begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                            pixel_data = volume_color_low;
                        else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32)))
                            pixel_data = volume_color_mid;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                    end 
                4'b1001:
                        begin
                            if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                            else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                pixel_data = volume_color_mid; 
                            else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                            pixel_data = background_color;
                            else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                            pixel_data = background_color;       
                        end
                4'b1010:
                        begin
                        if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                        else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                pixel_data = volume_color_mid;
                        else if((x_axis > 36 && x_axis<61) &&(y_axis>35 && y_axis<38))
                              pixel_data = volume_color_high;
                        else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;
                        else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                        pixel_data = background_color;     
                        end                
                4'b1011:
                        begin
                            if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                            else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                pixel_data = volume_color_mid;
                            else if((x_axis > 36 && x_axis<61) &&((y_axis>35 && y_axis<38) || (y_axis>38 && y_axis<41)))
                                pixel_data = volume_color_high;     
                            else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                            pixel_data = background_color;
                            else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                            pixel_data = background_color;     
                        end
                4'b1100:
                        begin
                            if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                            else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                pixel_data = volume_color_mid;
                            else if((x_axis > 36 && x_axis<61) &&((y_axis>35 && y_axis<38) || (y_axis>38 && y_axis<41) || (y_axis>41 && y_axis<44)))
                                pixel_data = volume_color_high;    
                           else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                           pixel_data = background_color;
                           else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                           pixel_data = background_color;
                        end
                4'b1101:
                        begin
                            if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                            else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                pixel_data = volume_color_mid;
                            else if((x_axis > 36 && x_axis<61) &&((y_axis>35 && y_axis<38) || (y_axis>38 && y_axis<41) || (y_axis>41 && y_axis<44)|| (y_axis>44 && y_axis<47)))
                                pixel_data = volume_color_high;  
                            else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                            pixel_data = background_color;
                            else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                            pixel_data = background_color;      
                        end
                4'b1110:
                        begin
                            if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                            else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                 pixel_data = volume_color_mid;
                            else if((x_axis > 36 && x_axis<61) &&((y_axis>35 && y_axis<38) || (y_axis>38 && y_axis<41) || (y_axis>41 && y_axis<44)|| (y_axis>44 && y_axis<47) || (y_axis>47 && y_axis<50)))
                                 pixel_data = volume_color_high; 
                           else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                           pixel_data = background_color;
                           else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                           pixel_data = background_color;         
                        end
                4'b1111:
                        begin
                            if((x_axis > 36 && x_axis<61) && ((y_axis > 5 && y_axis<8) || (y_axis>8 && y_axis<11) || (y_axis>11 && y_axis<14) || (y_axis>14 && y_axis<17) || (y_axis>17 && y_axis<20)))
                                pixel_data = volume_color_low;
                            else if((x_axis > 36 && x_axis<61) && ((y_axis>20 && y_axis<23) || (y_axis>23 && y_axis<26) || (y_axis>26 && y_axis<29) || (y_axis>29 && y_axis<32) || (y_axis>32 && y_axis<35)))
                                pixel_data = volume_color_mid;
                            else if((x_axis > 36 && x_axis<61) &&((y_axis>35 && y_axis<38) || (y_axis>38 && y_axis<41) || (y_axis>41 && y_axis<44)|| (y_axis>44 && y_axis<47) || (y_axis>47 && y_axis<50) || (y_axis>50 && y_axis<53)))
                                pixel_data = volume_color_high;
                           else if((x_axis<37 && x_axis>2) && (y_axis<61 && y_axis>2))
                           pixel_data = background_color;
                           else if((x_axis >60 && x_axis <91) && (y_axis<61 && y_axis>2))
                           pixel_data = background_color;
                        end
//                default:
//                    begin
//                        pixel_data = {5'b00110,6'b111000,5'b11100};
//                    end
            endcase
            
            end
        end
    end

endmodule
