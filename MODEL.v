module fsm_counter(
    input wire clk,
    input wire reset,
    output reg [1:0] count
);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (current_state)
            S0: count = 2'b00;
            S1: count = 2'b01;
            S2: count = 2'b10;
            S3: count = 2'b11;
            default: count = 2'b00;
        endcase
    end

endmodule
