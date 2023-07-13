module SplReg2(out, in, clk, load);
    input clk, load;
    input [0:262143] in;
    output [0:262143] out;
    reg [0:262143] tmp;
    
    always @(posedge clk)
        begin
            if(load)
                begin
                    tmp <= in;
                end
            else
                begin
                    tmp <= tmp;
                end
        end
        
    assign out = tmp;
    
endmodule
