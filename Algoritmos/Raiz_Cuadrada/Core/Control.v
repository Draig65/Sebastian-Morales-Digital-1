module control(clk,rst,start,z,z_a,load_ra,shift_ra,sub_ra,shift_b,set_b0,load_c,calc_c,done);
    input      clk, rst, start;
    input      z;
    input      z_a;
    output reg load_ra, shift_ra, sub_ra;
    output reg shift_b, set_b0;
    output reg load_c, calc_c;
    output reg done;
  
    parameter START  = 3'b000;
    parameter SHIFT_RA  = 3'b001; 
    parameter SHIFT_CB  = 3'b010; 
    parameter CHECK = 3'b011; 
    parameter DECB0 = 3'b100;
    parameter CHECK_F  = 3'b101; 
    parameter END     = 3'b111;

reg [2:0] state;
reg [3:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
        state <= START;
        count <= 4'b0;
    end
   else begin
      case (state)
            START: begin
              if(start)
                    state <= SHIFT_RA;
                else 
                    state <= START;
            end

            SHIFT_RA: 
                  state <= SHIFT_CB;
               

            SHIFT_CB:
                state <=CHECK;

            CHECK:begin
                if(z)
                    state <= DECB0;
                else
                    state <= CHECK_F; 
            end
            DECB0:
                state <=CHECK_F;

            CHECK_F:begin
                if(z_a)
                    state <= END;
                else
                    state <= SHIFT_RA; 
            end
            END: begin
                  if (start)
                    state <= START;

                else 
                    state <= END;
            end

            default: state <= START;
        endcase 
    end
end
   always @(*) begin
    case (state)

        START: begin
            load_ra = 1;  
        shift_ra = 0;
        sub_ra = 0;
        shift_b = 0;  
        set_b0 = 0;
        load_c  = 0;
        calc_c = 0; 
        done = 0;
        end 

        SHIFT_RA: begin
            load_ra = 0;  
        shift_ra = 1;
        sub_ra = 0;
        shift_b = 0;  
        set_b0 = 0;
        load_c  = 1;
        calc_c = 0; 
        done = 0;
        end

       SHIFT_CB: begin
            load_ra = 0;  
        shift_ra = 0;
        sub_ra = 0;
        shift_b = 1;  
        set_b0 = 0;
        load_c  = 0;
        calc_c = 1; 
        done = 0;
        end

        CHECK: begin
            load_ra = 0;  
        shift_ra = 0;
        sub_ra = 0;
        shift_b = 0;  
        set_b0 = 0;
        load_c  = 0;
        calc_c = 0; 
        done = 0;
        end
        DECB0: begin
            load_ra = 0;  
        shift_ra = 0;
        sub_ra = 1;
        shift_b = 0;  
        set_b0 = 1;
        load_c  = 0;
        calc_c = 0; 
        done = 0;
        end

        CHECK_F: begin
            load_ra = 0;  
        shift_ra = 0;
        sub_ra = 0;
        shift_b = 0;  
        set_b0 = 0;
        load_c  = 0;
        calc_c = 0; 
        done = 0;
        end
        END: begin
        load_ra = 0;  
        shift_ra = 0;
        sub_ra = 0;
        shift_b = 0;  
        set_b0 = 0;
        load_c  = 0;
        calc_c = 0; 
        done = 1;
        end

        default: begin
         load_ra = 0;  
        shift_ra = 0;
        sub_ra = 0;
        shift_b = 0;  
        set_b0 = 0;
        load_c  = 0;
        calc_c = 0; 
        done = 0;
        end
        
    endcase
end
   

`define BENCH
`ifdef BENCH
  reg [8*40:1] state_name;
  always @(*) begin
    case (state)
      START:      state_name = "START";
      SHIFT_RA: state_name = "SHIFT_RA";
      SHIFT_CB: state_name = "SHIFT_CB";
      DECB0:       state_name = "DECB0";
      CHECK:       state_name = "CHECK";
      CHECK_F:     state_name = "CHK_CO";
      END:     state_name = "END";
    endcase
  end
`endif
endmodule
