`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_StudentA (
    input sys_clk,BTres,BTup,BTdown,
    input [1:0] switch,
    input [11:0] raw_sound_bits,
    output reg [15:0] leds,
    output reg [7:0] sevsegment,
    output reg [3:0] annode
    );
    
    //IN use
    wire [11:0] sound_bits; // Use sound_bits > outputs from amp
    wire twentyhz, sixtwofivehz, btfreq;
    wire c20khz, c6p25khz, cbthz;
    wire [15:0] max_vol_led;
    wire [7:0] raw_sound_seg, max_sound_seg, mpx_seg;
    wire [3:0] raw_sound_an, max_sound_an, mpx_an;
    reg Bup_mpx = 0, Bdw_mpx = 0, BTauto = 0;
    reg DEAD = 0;
    //not in use
    wire BUhold, BDhold;
    wire [5:0] visual;
    wire [12:0] pix;
    wire [15:0] work;
    reg TEMP;
    
main_clk twentykhz (.basys_clk(sys_clk), .M(2499), .clk_out(c20khz));//20khz
main_clk btclk (.basys_clk(sys_clk), .M(2097152), .clk_out(cbthz));//button hz

//pulse buttonUP(.clk(cbthz) ,.inpt(BTup) ,.S(BUhold));
//pulse buttoDown(.clk(cbthz) ,.inpt(BTdown) ,.S(BDhold));

Multiplier amplifier (.raw_sounds(raw_sound_bits),.sound(sound_bits),.sys_clk(sys_clk),.btauto_in(BTauto),.btup_in(Bup_mpx),.btdown_in(Bdw_mpx),.sw1(switch),.mpx_seg(mpx_seg),.mpx_an(mpx_an));
raw_numbers rawdata (.sys_clk(sys_clk),.raw_sound(sound_bits),.segout(raw_sound_seg),.anout(raw_sound_an));
audio_wave Aprocess (.raw_sound(sound_bits),.c20khz(c20khz),.sys_clk(sys_clk),.led(max_vol_led),.an(max_sound_an),.sevseg(max_sound_seg));
//.micL(raw_sound_bits_L),.micR(raw_sound_bits),

// Sw0(1) = Peak value (Using LED + 7seg)
// Sw0(1) = raw sound (Using LED + 7seg)
always @ (*)
begin
    case (switch)
        //Raw numbers
        2'b00:
        begin
            leds <= max_vol_led;
            sevsegment <= raw_sound_seg;
            annode <= raw_sound_an;
            //TEMP <= BTup;//used to test sound_dist
//            Bup_mpx = DEAD;
//            Bauto = DEAD;
//            Bdw_mpx = DEAD;
        end
        //max_avg (must do)
        2'b01:
        begin
            leds <= max_vol_led;
            sevsegment <= max_sound_seg;
            annode <= max_sound_an;
//            Bup_mpx = DEAD;
//            Bauto = DEAD;
//            Bdw_mpx = DEAD;
        end
        //Amp mode
        2'b10:
        begin
            leds <= max_vol_led;
            sevsegment <= mpx_seg;
            annode <= mpx_an;
            Bup_mpx <= BTup;
            Bdw_mpx <= BTdown;
            //BTauto = DEAD;
        end
        //Auto Tune mode
        2'b11:
        begin
            leds <= max_vol_led;
            sevsegment <= mpx_seg;
            annode <= mpx_an;
            BTauto <= BTup;
//            Bdw_mpx = DEAD;
//            Bup_mpx = DEAD;
        end
        default
        begin
            leds <= 16'd0;
            sevsegment <= 8'd255;
            annode <= 4'b1111;
//            Bup_mpx = DEAD;
//            Bauto = DEAD;
//            Bdw_mpx = DEAD;
        end
    endcase
end
endmodule





