`default_nettype none

module tt_um_asiclab_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output reg  [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset = ~rst_n;

    // Set IOs as unused (output 0, not driven)
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Dummy signal to avoid unused warnings
    wire unused = &{ena, uio_in, 1'b0};

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            uo_out <= 8'b0;
        end else begin
            uo_out[3:0] <= ui_in[7:4] + ui_in[3:0];  // add upper + lower 4 bits
            uo_out[7:4] <= 4'b0000;
        end 
    end

endmodule
