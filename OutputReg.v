module OutputReg(out, in, clk, load);
    input clk, load;
    input [0:4095] in;
    output reg [0:524287] out;
    
    always @(posedge clk)
        begin
            if(load)
                begin
                    out <= 524288'd0;
                end
            else
                begin
                    out = {in, out[4096:524287]}; 
                end
        end
        
    
endmodule
