module MultiplicationUnit(c, a ,b);
    input [0:15] a, b;
    output [0:31] c;
    
    assign c = a*b;
    
endmodule
