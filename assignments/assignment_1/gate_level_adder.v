module gate_level_adder(
    input   a,b,cin,
    output  sum,cout
);
    wire net1,net2,net3 ; 

    // sum = (a^b^cin)
    xor u1(sum,a,b,cin);
    
    // cout = (a&b)|(a&cin)|(b&cin)
    and u2(net1,a,b);
    and u3(net2,a,cin);
    and u4(net3,b,cin);
    or  u5(cout,net1,net2,net3);

endmodule