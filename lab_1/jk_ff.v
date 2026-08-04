module jk_ff (
    input   j,k,Clk,
    output  q,qb
);

wire nand1, nand2;


sr_ff jk_ff_u1(nand1, nand2, q, qb);

nand jk_ff_u2(nand1, qb, j, Clk);
nand jk_ff_u3(nand2, q, k, Clk);



endmodule //jk_ff