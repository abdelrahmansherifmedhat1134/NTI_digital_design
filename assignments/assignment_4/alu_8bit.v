/*
1. Design Specifications: 
• Ports: 
a. Inputs  
o An 8-bit A.  
o An 8-bit B.  
o A 1-bit Cin.  
o A 5-bit Control.  
b. Outputs  
o A 16-bit Out.  
2. Operational Requirements:  
You must use a case statement within an always block that checks the Control
*/
module alu_8bit (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire  cin,
    input wire [5:0] control,
    
    output reg [15:0] out
);

always @(*) begin
    case(control)
        6'b00000: out = a + b ; 
        6'b00001: out = a + b + cin ;
        6'b00010: out = a + ~b + 1 ;
        6'b00011: out = a + ~b ;
        6'b00100: out = a + 1 ;
        6'b00101: out = a - 1 ;
        6'b00110: out = a * b + 1 ; 
        6'b00111: out = a & b ;
        6'b01000: out = a | b ;
        6'b01001: out = a ^ b ;
        6'b01010: out = ~a ;
        6'b01011: out = ~(a & b) ;
        6'b01100: out = {a,{0{b}}} ;
        6'b01101: out = a >> b ;
        6'b01110: out = a <<< b ;
        6'b01111: out = $signed(a) >>> b ; //we will apply this aritmetic shift using concatenation 
        6'b10000: out = (a >> b ) | (a << (4'd8 - b)) ;
        6'b10001: out = (a << b ) | (a >> (4'd8 - b)) ;
        6'b10010: out =  a > b ? a : (a==b) ? a : b ; //a > b ? {{8{0}},{a}} : (a==b) ?  {{8{0}},{a}} : {{8{0}},{b}} ; 
        6'b10011: out = cin ? a : b ;
        6'b10100: out = {~a, ~b} ;
        6'b10101: out = { 2'b0, a>=b, a>b, a==b, a<=b, a<b, a!=b} ;
        6'b10110: out = {~^b,^a} ;
        default: out = 16'd0 ;
    endcase
end

endmodule //8bit_alu