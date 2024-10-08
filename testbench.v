module tb_fsm_counter;

    reg clk;
    reg reset;
    wire [1:0] count;

    fsm_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        reset = 1;
        #20;
        reset = 0;
        $monitor("Time: %0t | Count: %b", $time, count);
        #40;
        reset = 1;
        #20;
        reset = 0;
        #40;
        $finish;
    end

endmodule
