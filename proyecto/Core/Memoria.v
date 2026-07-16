module memoria_frames (
input clk,
input [10:0] dir,
output reg [11:0] dato
);

(* ram_style = "block" *) reg [11:0] frame_mem [0:1279];

initial begin
`ifndef BENCH
    $readmemh("frames.hex",frame_mem);
`endif
end

always @(posedge clk) begin
    dato <= frame_mem[dir];
end

endmodule
