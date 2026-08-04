module jk_ff2(
    input   j,k,clk,
    output  q,qb
);
wire nand1, nand2;

nand u1(nand1, j, clk, qb);
nand u2(nand2, k, clk, q);
nand u3(q, nand1, qb);
nand u4(qb, nand2, q);      

endmodule