module shared_common_data_bus (
    inout [7:0] shared_bus,
    input [7:0] data_in,
    output [7:0] tx_data,
    input  tx_en
);
    assign shared_bus = tx_en ? tx_data : 8'bz ;
    assign tx_data = shared_bus ;
    
endmodule