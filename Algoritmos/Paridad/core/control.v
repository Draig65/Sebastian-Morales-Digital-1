module control (clk, rst, init, b0, z_co, done, shift, load, inc, dec);
  input  clk, rst, init;
  input  b0;          
  input  z_co;        

  output reg done; 
  output reg shift;  
  output reg load;    
  output reg inc;
  output reg dec;     

  
  parameter START  = 3'b000;
   parameter LOAD   = 3'b001;
   parameter CHECK_B0= 3'b010;
   parameter INC = 3'b011;
   parameter DEC= 3'b100;
    parameter SHIFT  = 3'b101;
  parameter CHECK_F = 3'b110;
   parameter END_ST = 3'b111;

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
                if (init)
                    state <= LOAD;
                else
                    state <= START;
            end

            LOAD: begin
                state <= CHECK_B0;
            end

            CHECK_B0: begin
                if (b0)
                    state <= INC;
                else
                    state <= DEC;
            end

            INC: begin
                state <= DEC;
            end

            DEC: begin
                state <= SHIFT;
            end

            SHIFT: begin
                state <= CHECK_F;
            end

            CHECK_F: begin
                if (z_co)
                    state <= END_ST;
                else
                    state <= CHECK_B0;
            end

            END_ST: begin
                  if (init)
                    state <= START;

                else 
                    state <= END_ST;
            end

            default: begin
                state <= START;
            end

        endcase
    end
end
  

always @(*) begin
    case (state)

        START: begin
            done  = 0;
            shift = 0;
            load  = 0;
            inc   = 0;
            dec   = 0;
        end

        LOAD: begin
            done  = 0;
            shift = 0;
            load  = 1;
            inc   = 0;
            dec   = 0;
        end

        CHECK_B0: begin
            done  = 0;
            shift = 0;
            load  = 0;
            inc   = 0;
            dec   = 0;
        end

        INC: begin
            done  = 0;
            shift = 0;
            load  = 0;
            inc   = 1;
            dec   = 0;
        end

        DEC: begin
            done  = 0;
            shift = 0;
            load  = 0;
            inc   = 0;
            dec   = 1;
        end

        SHIFT: begin
            done  = 0;
            shift = 1;
            load  = 0;
            inc   = 0;
            dec   = 0;
        end

        CHECK_F: begin
            done  = 0;
            shift = 0;
            load  = 0;
            inc   = 0;
            dec   = 0;
        end

        END_ST: begin
            done  = 1;
            shift = 0;
            load  = 0;
            inc   = 0;
            dec   = 0;
        end

        default: begin
            done  = 0;
            shift = 0;
            load  = 0;
            inc   = 0;
            dec   = 0;
        end

    endcase
end

`define BENCH
`ifdef BENCH
  reg [8*16:1] state_name;
  always @(*) begin
    case (state)
      START : state_name = "START";
      LOAD  : state_name = "LOAD";
      CHECK_B0: state_name = "CHECK_B0";
      INC : state_name = "INC";
      DEC : state_name = "DEC";
      SHIFT : state_name = "SHIFT";
      CHECK_F: state_name = "CHECK_F";
      END_ST: state_name = "END";
      default: state_name = "UNKN";
    endcase
  end
`endif
endmodule
