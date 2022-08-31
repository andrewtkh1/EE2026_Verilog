`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: Andrew tan
//  STUDENT A MATRICULATION NUMBER: A0218211W
//
//  STUDENT B NAME: Lau Wai Kit
//  STUDENT B MATRICULATION NUMBER: A0218353H
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,I_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,I_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,I_MIC3_Pin4,   // Connect to this signal from Audio_Capture.v
    input basys_clock,middle_btn,right_btn,left_btn,sw13,sw15,sw14,sw12,sw11,up_btn,down_btn,
    input [1:0] A_sw,
    output reg [15:0] led = 0,
    output [7:0] rgbs,
    //output reg [15:0] leds,
    output reg [7:0] sevsegment,
    output reg [3:0] annode);
    
    wire [11:0] mic_in,mic_in_L;
    
    wire clk20k;    //Clock for Mic
    wire clk6p25m;  //Clock for Oled_display
    wire clk8;
    wire twentyhz;

    wire bgc_signal;
    wire menuChoose;
    wire menuSelect;
    wire [3:0] oled_data_counter;
    wire [1:0] selection;
    wire [15:0] oled_data_first;
    wire [15:0] oled_data_B;
    wire [15:0] oled_data_SP;
    reg [15:0] oled_data_final;
    reg [15:0] oled_data_second;
    wire reset_btn;
    wire [11:0] new_mic_in;
    wire [12:0] sampleindex;
    wire [12:0] x_axis;
    wire [12:0] y_axis;  
    wire menuSelect_clk;
    reg A_btdown, A_btup;
    reg [1:0] A_switch;
    wire [15:0]A_leds;
    wire [7:0] A_sevsegment;
    wire [3:0] A_annode;
    wire signed [30:0] x_out;
    wire [15:0] y_out;
    reg [15:0] led_hold;
    reg [7:0] seg_hold;
    reg [4:0] an_hold;
    wire bt_up_pulse;
    reg bt_tune;
    
    reg t_sw15;
    reg t_sw14;
    reg t_sw13;
    reg t_sw12;
    reg t_sw11;
    reg t_bgc_signal;
    reg t_right_btn;
    reg t_middle_btn;
    reg t_up_btn;
    reg t_down_btn;
    
    reg flag = 0;
    
    assign menuSelect_clk = (flag) ? clk6p25m : 0;
    
    main_clk twentyKHz(basys_clock, 2499, clk20k);   //Mic Frequency, 20KHz
    main_clk sizMHz(basys_clock, 7,clk6p25m);
    main_clk eightHz(basys_clock,24990 ,clk8);
    main_clk oled_debounce(basys_clock, 2097152, twentyhz);
    
    oled_debounce_signal btups(twentyhz, up_btn, bt_up_pulse);
    oled_debounce_signal oledbgS(twentyhz, left_btn, bgc_signal); //Background Color, WK task.
    oled_debounce_signal menuChoice(twentyhz, right_btn, menuChoose);
    oled_debounce_signal menuSelection(twentyhz, middle_btn, menuSelect);
    //oled_debounce_signal reset(twentyhz, left_btn, reset_btn);
    Oled_coordinates coordinates(.sample_index(sampleindex[12:0]),.x_axis(x_axis[12:0]), .y_axis(y_axis[12:0]));  //Oled Coordinates
    
    //Mic L
    Audio_Capture (.CLK(basys_clock), .cs(clk20k),.MISO(I_MIC3_Pin3), .clk_samp(I_MIC3_Pin1), .sclk(I_MIC3_Pin4), .sample(mic_in_L));
    //Mic R
    Audio_Capture audio(.CLK(basys_clock), .cs(clk20k), .MISO(J_MIC3_Pin3),.clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_in[11:0]));
    
    micin_to_oled new_mic_in_data(clk20k,clk8,t_sw11, mic_in[11:0], oled_data_counter[3:0], new_mic_in[11:0]);
    
    Menu_display firstDisplay(.clk6p25m(clk6p25m),.twentyhz(twentyhz),.menuChoose(menuChoose),.menuSelect(menuSelect),.x(x_axis),.y(y_axis),.pixel_data(oled_data_first[15:0]),.selection(selection));
    
    subtask_4B subtask4B(.clk6p25m(clk6p25m), .clk20k(clk20k), .twentyhz(twentyhz),
        .sample_index(sampleindex[12:0]), .sw15(t_sw15), .sw14(t_sw14), .sw13(t_sw13),.sw12(t_sw12),.sw11(t_sw11), .bgc_signal(t_bgc_signal),
        .oled_counter(oled_data_counter[3:0]), .pixel_data(oled_data_B[15:0]));
    
    //Input raw X & y here
    shared_Proj_Display shared_proj(.clk6p25m(clk6p25m),.x(x_axis),.y(y_axis),.raw_x(x_out),.raw_y(y_out),.pixel_data(oled_data_SP[15:0]));
    
    Oled_Display oled(.clk(clk6p25m),.pixel_data(oled_data_final[15:0]),.pixel_index(sampleindex[12:0]),
      .cs(rgbs[0]), .sdin(rgbs[1]), .sclk(rgbs[3]), .d_cn(rgbs[4]), .resn(rgbs[5]), .vccen(rgbs[6]), 
      .pmoden(rgbs[7]));  
    
    //Andrew's task
    Top_StudentA(.sys_clk(basys_clock),.BTup(A_btup),.BTdown(A_btdown),.switch(A_switch),.raw_sound_bits(mic_in),.leds(A_leds),.sevsegment(A_sevsegment),.annode(A_annode));
    //combined task
    dual_mic_dist (.sys_clk(basys_clock),.bt_in(bt_tune),.mic_1(mic_in),.mic_2(mic_in_L),.x(x_out),.y(y_out));
    always @(posedge menuSelect)
    begin
        flag = (flag == 1) ? 0 : 1;
    end
    
    always @ (posedge clk6p25m)
    begin
         if( flag ==0)
         begin  
           oled_data_final = oled_data_first;
           
           led = 0;
           sevsegment = 8'b11111111;
           annode = 4'b1111;
           end
        else begin
            oled_data_final = oled_data_second;
            sevsegment = seg_hold;
            led = led_hold;
            annode = an_hold;
            end
    end
    always @(posedge menuSelect_clk)
            case (selection)
            //Andrew TAsk
            2'b00:
                begin
                    oled_data_second = 0;
                    A_btup = up_btn;//raw button
                    A_btdown = down_btn;
                    A_switch = A_sw;
                    led_hold = A_leds;
                    seg_hold = A_sevsegment;
                    an_hold = A_annode;
                end
            //WK TASK
            2'b01:
                begin
                    t_sw15 = sw15;
                    t_sw14 = sw14;
                    t_sw13 = sw13;
                    t_sw12 = sw12;
                    t_sw11 = sw11;
                    t_bgc_signal = bgc_signal;
                    oled_data_second = oled_data_B;
                    led_hold = 0;
                    seg_hold = 0;
                    an_hold = 0;
                end
            //AMPLIFIER
            2'b10:
                begin
                    oled_data_second= 0;
                end
            //SHARED PROEJCT
            2'b11:
                begin
                    oled_data_second = oled_data_SP;
                    led_hold = 0;
                    seg_hold = 0;
                    an_hold = 0;
                    bt_tune = bt_up_pulse;
                end
            endcase
endmodule