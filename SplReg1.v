module SplReg1(out, in, clk, load);
    input clk, load;
    input [0:262143] in;
    output [0:2047] out;
    reg [0:262143] tmp;
    
    always @(posedge clk)
        begin
            if(load)
                begin
                    tmp <= in;
                end
            else
                begin
                    tmp <= {tmp[2048:262143],2048'd0};
                end
        end
        
    assign out = tmp[0:2047];
    
endmodule
