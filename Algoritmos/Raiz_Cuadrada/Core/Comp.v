module comparador (
    input  [7:0] R,
    input  [7:0] C,
    output       z
);
    assign z = (R >= C);
endmodule
