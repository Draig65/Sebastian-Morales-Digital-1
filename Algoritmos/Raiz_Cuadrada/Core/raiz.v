module raiz_cuadrada (
    input        clk, rst, start,
    input  [7:0] radical,
    output [4:0] resultado,
    output       done
);
    wire w_z, w_z_a;
    wire w_load_ra, w_shift_ra, w_sub_ra;
    wire w_clear_b, w_shift_b, w_set_b0;
    wire w_load_c, w_calc_c;
    wire [7:0] w_A, w_R, w_C;
    wire [4:0] w_B;

    assign w_z_a     = (w_A == 8'b0); 
    assign resultado = w_B;


    comparador comp   (.R(w_R), .C(w_C), .z(w_z));
    Corrimiento_ra   corr_ra(.clk(clk), .rst(rst), .load(w_load_ra),.radical_in(radical), .shift(w_shift_ra), .sub_en(w_sub_ra), .C(w_C), .A(w_A), .R(w_R));
    Corr_b      corr_b(.clk(clk), .rst(rst),.shift(w_shift_b), .b0(w_set_b0), .B(w_B));                
    Corrimiento_c      corr_c (.clk(clk), .rst(rst), .load_b(w_load_c),.B(w_B), .calc_c(w_calc_c), .C(w_C));                  
    control  ctrl(.clk(clk), .rst(rst), .start(start), .z(w_z), .z_a(w_z_a), .load_ra(w_load_ra), .shift_ra(w_shift_ra), .sub_ra(w_sub_ra), 
                       .clear_b(w_clear_b), .shift_b(w_shift_b), .set_b0(w_set_b0), .load_c(w_load_c), .calc_c(w_calc_c), .done(done));
endmodule
