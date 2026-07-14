`timescale 1ns / 1ps
`define SIMULATION
module bin_to_bcd_TB;
    reg clk;
    reg rst;
    reg reset;
    reg start;
    reg [7:0] in_data;
    wire [7:0] result;
    wire done;

    bin_to_bcd uut (
        .clk(clk),
        .rst(rst),
        .init(start),
        .in_data(in_data),
        .result(result),
        .done(done)
    );

    parameter PERIOD          = 20;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET          = 0;
    reg [20:0] i;
    event reset_trigger;
    event reset_done_trigger;

    initial begin 
        forever begin 
            @ (reset_trigger);
            @ (negedge clk);
            rst = 1;
            @ (negedge clk);
            rst = 0;
            -> reset_done_trigger;
        end
    end

    initial begin 
        clk = 0;
        reset = 1; 
        start = 0; 
        in_data = 8'd45; 
    end

    initial begin 
        #OFFSET;
        forever begin
            clk = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end

    initial begin 
        #10 -> reset_trigger;
        @ (reset_done_trigger);
        @ (posedge clk);
        start = 0;
        @ (posedge clk);
        start = 1; 
        for(i=0; i<2; i=i+1) begin
            @ (posedge clk);
        end
        start = 0;
        
        for(i=0; i<25; i=i+1) begin
            @ (posedge clk);
        end

        in_data = 8'd78;
        @ (posedge clk);
        start = 1;
        for(i=0; i<2; i=i+1) begin
            @ (posedge clk);
        end
        start = 0;
        for(i=0; i<25; i=i+1) begin
            @ (posedge clk);
        end

        in_data = 8'd99;
        @ (posedge clk);
        start = 1;
        for(i=0; i<2; i=i+1) begin
            @ (posedge clk);
        end
        start = 0;
        for(i=0; i<25; i=i+1) begin
            @ (posedge clk);
        end
    end	 

    initial begin: TEST_CASE
        $dumpfile("bin_to_bcd_TB.vcd");
        $dumpvars(-1, uut);
        #((PERIOD*DUTY_CYCLE)*250) $finish;
    end
endmodule
