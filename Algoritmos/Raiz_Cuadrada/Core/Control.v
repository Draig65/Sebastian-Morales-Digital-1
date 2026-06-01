module control(clk,rst,start,z,z_a,load_ra,shift_ra,sub_ra,clear_b,shift_b,set_b0,load_c,calc_c,done);
    input      clk, rst, start;
    input      z;
    input      z_a;
    output reg load_ra, shift_ra, sub_ra;
    output reg clear_b, shift_b, set_b0;
    output reg load_c, calc_c;
    output reg done;
  
    parameter START  = 3'b000;
    parameter SHIFT_RA  = 3'b001; 
    parameter SHIFT_CB  = 3'b010; 
    parameter CHECK = 3'b011; 
    parameter CHECK_F  = 3'b100; 
    parameter DONE     = 3'b101;

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst) state <= START;
        else  state <= next_state;
    end

    // Transiciones de estado
    always @(*) begin
        next_state = state;
        case (state)
            START:    if (start) next_state = SHIFT_RA;
            SHIFT_RA:   next_state = SHIFT_CB;
            SHIFT_CB:   next_state = CHECK;
            CHECK:    next_state = CHECK_F;
            CHECK_F:   if (z_a)   next_state = DONE;
                     else       next_state = SHIFT_RA;
            DONE: if (rst)  next_state = START;
            default: next_state = START;
        endcase
    end

    // Generación de Salidas
    always @(*) begin
        load_ra = 0; shift_ra = 0; sub_ra = 0;
        clear_b = 0; shift_b = 0;  set_b0 = 0;
        load_c  = 0; calc_c = 0;   done = 0;

        case (state)
            START: begin
                if (start) begin
                    load_ra = 1;
                    clear_b = 1;
                end
            end
            SHIFT_RA: begin
                shift_ra = 1;
                load_c   = 1;
            end
            SHIFT_CB: begin
                calc_c  = 1;
                shift_b = 1;
            end
            CHECK: begin
                if (z) begin
                    sub_ra = 1;
                    set_b0 = 1;
                end
            end
            DONE: begin
                done = 1;
            end
        endcase
    end
endmodule
