`timescale 1ns / 1ps

module CharacterPlane(
    dout,
    rout,
    cout,
    din,
    rin,
    cin,
    we,
    reset,
    s,
    clk
    );
    
    output reg [7:0] dout;
    input wire [3:0] rout;
    input wire [5:0] cout;
    input wire [7:0] din;
    input wire [3:0] rin;
    input wire [5:0] cin;
    input wire we;
    input wire reset;
    input wire s;
    input wire clk;
    
    reg [7:0] mem [0:139];
    
    initial begin
        dout = 129;
    end
    
    genvar i,j;
    generate 
        for(i=0;i<7;i=i+1) begin
            for (j=0;j<20;j=j+1) begin
                initial begin
                    mem[{{6{1'b0}},i} * 20 + j] = 129;
                end
            end
        end 
    endgenerate
    
    always@(rout or cout) begin
        dout <= mem[{{6{1'b0}},rout} * 20 + cout];
    end
    
    always@(negedge clk) begin
       if(we == 1 && reset == 0 && s == 0) begin
            if(din == 8'b11111111) begin
                mem[{{6{1'b0}},rin} * 20 + cin] = 129;
            end
            else begin
                mem[{{6{1'b0}},rin} * 20 + cin] = din;
            end
       end
       else if(we == 1 && reset == 0 && s == 1) begin
            mem[{{6{1'b0}},7 - 1} * 20] = din;
       end
    end
    
endmodule