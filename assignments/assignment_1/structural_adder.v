module structural_adder(
    input a,b,cin,
    output cout,sum
);
    

wire sum1,cout1,cout2;

structural_half_adder u1(.a(a), .b(b), .sum(sum1), .cout(cout1));
structural_half_adder u2(.a(sum1), .b(cin), .sum(sum), .cout(cout2));

assign cout = cout1 | cout2 ; 

endmodule