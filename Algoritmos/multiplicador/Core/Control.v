module Control(rst,clk,init,ao,shift,load,add,z,done);

input rst;
input clk;
input init;
input z;
input ao;

output reg shift;
output reg load;
output reg add;
output reg done;

parameter START = 3'b000;
parameter CHECK = 3'b001;
parameter ACCUMULATE = 3'b010;
parameter SHIFT = 3'b011;
parameter ECHECK = 3'b100;
parameter END = 3'b101;

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
              if(init)
                    state <= CHECK;
                else 
                    state <= START;
            end

            CHECK: begin 
                if(ao)
                    state <= ACCUMULATE;
                else
                    state <= SHIFT;
            end

            ACCUMULATE:
                state <= SHIFT;

            SHIFT:begin
              state <= ECHECK;
              end
              ECHECK:begin
                if(z)
                    state <= END;
                else
                    state <= CHECK; 
            end

            END: begin
                count <= count + 1;
                if(count > 9) begin
                    state <= START;
                    count <= 4'b0;
                end 
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
            load = 1;
            shift = 0;
            add = 0;
            done = 0;
        end 

        CHECK: begin
            load = 0;
            shift = 0;
            add = 0;
            done = 0;
        end

        ACCUMULATE: begin
            load = 0;
            shift = 0;
            add = 1;
            done = 0;
        end

        SHIFT: begin
            load = 0;
            shift = 1;
            add = 0;
            done = 0;
        end
        ECHECK: begin
            load = 0;
            shift = 0;
            add = 0;
            done = 0;
        end

        END: begin
            load = 0;
            shift = 0;
            add = 0;
            done = 1;
        end

        default: begin
            load = 0;
            shift = 0;
            add = 0;
            done = 0;
        end
        
    endcase
end
`define BENCH
`ifdef BENCH
reg [8*40:1] state_name;
always @(*) begin
    case (state)
        START        : state_name = "START";
        CHECK        : state_name = "CHECK";
        ACCUMULATE   : state_name = "ACCUMULATE";
        SHIFT        : state_name = "SHIFT";
        ECHECK       : state_name = "ECHECK";
        END          : state_name = "END";
    endcase
end
`endif



endmodule
