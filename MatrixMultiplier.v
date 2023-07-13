module MatrixMultiplier(out, in1, in2, clk, load);
    input clk, load;
    input [0:262143] in1, in2;
    output [0:524287] out;
    wire [0:2047] out1;
    wire [0:262143] out2;
    wire [0:524287] out4;
    wire [0:4095] out5;
    genvar i, j;
    
    SplReg1 S1(out1, in1, clk, load);
    SplReg2 S2(out2, in2, clk, load);
    
    for(i = 0; i < 128; i=i+1)
        begin
            for(j = 0; j < 128; j=j+1)
                begin
                    MultiplicationUnit S3(out4[128*32*i+32*j:128*32*i+32*j+31], out1[16*i:16*i+15] ,out2[16*i+128*16*j:16*i+128*16*j+15]);
                end
        end
        
    for(i = 0; i < 128; i=i+1)
        begin
            assign out5[32*i:32*i+31] = out4[128*32*i:128*32*i+31];
            
            for(j = 1; j < 128; j=j+1)
                begin
                    assign out5[32*i:32*i+31] = out5[32*i:32*i+31] + out4[32*j:32*j+31];
                end
        end
        
    OutputReg S4(out, out5, clk, load);
        
endmodule
