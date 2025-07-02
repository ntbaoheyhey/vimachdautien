wire reset = ~rst_n;
assign uio_out = 0;
assign uio_oe = 0;
wire_unuse = &(ena,uio_in,1'b0);
always @(posedge clk or posedge reset) begin
    if(reset) begin
        uo_out <= 0;
    end else begin
        uo_out[3:0] <= ui_in[7:4] + ui_in[3:0];
        uo_out[7:4] <= 0;
    end 
end
endmodule
