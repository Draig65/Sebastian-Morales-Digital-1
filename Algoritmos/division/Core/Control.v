module control (clk, rst, start, z, z_co, msb, done, sh, load, load_ac, r0, dec);
  
  input  clk;
  input  rst;
  input  start;
  input  z;       
  input  z_co;    
  input  msb;     
  
  output reg done;
  output reg sh;
  output reg load;
  output reg load_ac;
  output reg r0;
  output reg dec;
 
  parameter START   = 3'b000;
  parameter SHIFT   = 3'b001;
  parameter CHECK   = 3'b010;
  parameter SUB     = 3'b011;
  parameter CHK_CO  = 3'b100;
  parameter END_ST  = 3'b101;
 
  reg [2:0] state;
 
  initial begin
    done=0; sh=0; load=0; load_ac=0; r0=0; dec=0;
    state = START;
  end
 
  //Transiciones de estado 
  always @(posedge clk or posedge rst) begin
    if (init) begin
        state <= START;
    end
    else begin
        case (state)

            START: begin
                if(start)
                    state <= SHIFT;
                else
                    state <= START;
            end

            SHIFT: begin
                state <= CHECK;
            end

            CHECK: begin
                if(z)
                    state <= SUB;
                else
                    state <= CHK_CO;
            end

            SUB: begin
                state <= CHK_CO;
            end

            CHK_CO: begin
                if(z_co)
                    state <= END_ST;
                else
                    state <= SHIFT;
            end

            END_ST: begin
                state <= END_ST;
            end

            default: begin
                state <= START;
            end

        endcase
    end
end
 
  // Salidas según estado 
  always @(*) begin
    if (init) begin
      done=0; sh=0; load=0; load_ac=0; r0=0; dec=0;
    end else begin
      case (state)
      
        START:   begin 
          done=0;
          sh=0; 
          load=1; 
          load_ac=0; 
          r0=0; 
          dec=0; 
        end
        SHIFT:   begin 
          done=0; 
          sh=1; 
          load=0; 
          load_ac=0; 
          r0=0; 
          dec=1; 
        end
        CHECK:   begin 
          done=0; 
          sh=0; 
          load=0; 
          load_ac=0; 
          r0=0; 
          dec=0; 
        end
        SUB:     begin 
          done=0; 
          sh=0; 
          load=0; 
          load_ac=1; 
          r0=1; 
          dec=0; 
        end
        CHK_CO:  begin 
          done=0; 
          sh=0; 
          load=0; 
          load_ac=0; 
          r0=0; 
          dec=0; 
        end
        END_ST:  begin 
          done=1; 
          sh=0; 
          load=0; 
          load_ac=0; 
          r0=0; 
          dec=0; 
        end
        default: begin 
          done=0; 
          sh=0; 
          load=1; 
          load_ac=0; 
          r0=0; 
          dec=0; 
        end
      endcase
    end
  end
 
endmodule
