module sr_ff(
    input sb,rb,
    output  q,qb
);
nand u1(q,sb,qb);
nand u2(qb,rb,q);


endmodule