`timescale 1ns/1ns

module tb;
    reg j, k, clk;
    wire q, qb;

    jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qb(qb)
    );

    initial begin
        clk = 0;
        j = 0;
        k = 0;

        #5;
        j = 1; k = 0;
        #10;
        j = 0; k = 1;
        #10;
        j = 1; k = 1;
        #10;
        j = 0; k = 0;
        #10;

        $finish;
    end


    initial begin
        $monitor("t = %0t | j=%b k=%b | q=%b qb=%b", $time, j, k, q, qb);
    end

    always #10 clk=~clk;
        
endmodule