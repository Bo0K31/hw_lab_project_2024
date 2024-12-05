`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 15:06:53
// Design Name: 
// Module Name: FeederPlaneTest
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


module FeederPlaneTest(

    );
    
    wire [3:0] row;
    wire [5:0] column;
    wire [7:0] character_id;
    wire [3:0] _row;
    wire [5:0] _column;
    reg [7:0] _character_id;

    reg we;
    
    reg [3:0] a;
    reg [5:0] b;
    reg [7:0] c;
    
    wire push_up;
    wire reset_call;
    reg clock;
    
    CharacterFeeder characterFeeder(_row,_column,_character_id,push_up,reset_call,1,clock);
    CharacterPlane characterPlane(character_id,row,column,_character_id,_row,_column,1,reset_call,push_up,clock);
    
    
    initial begin
        #1; _character_id = 0;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 1;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 2;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 3;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 4;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 5;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 6;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 7;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 8;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 9;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 10;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 11;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 12;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 13;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 14;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 15;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 16;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 17;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 18;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 19;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 20;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 21;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 22;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 23;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 24;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 25;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 26;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 27;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 28;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 29;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 30;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 31;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 32;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 33;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 34;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 35;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 36;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 37;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 38;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 39;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 40;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 41;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 42;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 43;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 44;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 45;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 46;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 47;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 48;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 49;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 50;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 51;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 52;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 53;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 54;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 55;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 56;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 57;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 58;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 59;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 60;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 61;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 62;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 63;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 64;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 65;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 66;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 67;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 68;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 69;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 70;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 71;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 72;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 73;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 74;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 75;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 76;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 77;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 78;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 79;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 80;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 81;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 82;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 83;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 84;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 85;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 86;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 87;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 88;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 89;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 90;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 91;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 92;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 93;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 94;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 95;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 96;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 97;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 98;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 99;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 100;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 101;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 102;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 103;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 104;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 105;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 106;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 107;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 108;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 109;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 110;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 111;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 112;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 113;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 114;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 115;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 116;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 117;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 118;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 119;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 120;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 121;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 122;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 123;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 124;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 125;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 126;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 127;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 128;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 129;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 130;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 131;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 132;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 133;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 134;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 135;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 136;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 137;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 138;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 139;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 140;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 141;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 142;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 143;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 144;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 145;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 146;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 147;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 148;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 149;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 150;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 151;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 152;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 153;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 154;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 155;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 156;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 157;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 158;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 159;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 160;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 161;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 162;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 163;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 164;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 165;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 166;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 167;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 168;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 169;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 170;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 171;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 172;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 173;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 174;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 175;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 176;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 177;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 178;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 179;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 180;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 181;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 182;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 183;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 184;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 185;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 186;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 187;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 188;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 189;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 190;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 191;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 192;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 193;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 194;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 195;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 196;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 197;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 198;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 199;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 200;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 201;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 202;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 203;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 204;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 205;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 206;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 207;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 208;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 209;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 210;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 211;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 212;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 213;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 214;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 215;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 216;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 217;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 218;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 219;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 220;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 221;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 222;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 223;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 224;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 225;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 226;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 227;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 228;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 229;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 230;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 231;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 232;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 233;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 234;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 235;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 236;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 237;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 238;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 239;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 240;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 241;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 242;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 243;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 244;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 245;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 246;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 247;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 248;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 249;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 250;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 251;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 252;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 253;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 254;
#1; clock = 1;
#1; clock = 0;
#1; _character_id = 255;
#1; clock = 1;
#1; clock = 0;

    end
    
endmodule
