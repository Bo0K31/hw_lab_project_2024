`timescale 1ns / 1ps

module CharacterFeeder(
    ido,
    idi,
    r,
    c,
    s,
    reset,
    we,
    clk
    );
    
    
    output reg [7:0] ido;
    input wire [7:0] idi;
    output reg [3:0] r;
    output reg [5:0] c;
    output reg s;
    output reg reset;
    input wire we;
    input wire clk;
    
    reg [10 - 1:0] p;
    
    initial begin
        p = 0;
        ido = 0;
        s = 0;
        r = 0;
        c = 0;
        reset = 0;
    end 
    
    always@(posedge clk) begin
        if(idi >= 48 && idi <= 57) begin
            ido <= idi - 48 + 0;
        end
        else if(idi >= 65 && idi <= 90) begin
            ido <= idi - 65 + 10;
        end
        else if(idi >= 97 && idi <= 122) begin
            ido <= idi - 97 + 36;
        end
        else if(idi >= 128 && idi <= 195) begin
            ido <= idi - 128 + 62;
        end
        else if(idi == 8'b11111111) begin
            ido <= 8'b11111111;
        end
        else begin
            ido <= 128;
        end
    
        if(we) begin
            if(idi == 8'b11111111) begin
                p = 0;
                r = 0;
                c = 0;
                reset = 1;
            end
            else begin
                p = p + 1;
                reset = 0;
                r = p / 20;
                c = p % 20;
                if(p == 140) begin
                    p = 140 - 20;
                    s = 1;
                end
                else begin
                    s = 0;
                end
            end
        end
        else begin
            reset = 0;
            s = 0;
        end
    end
endmodule