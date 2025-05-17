module counter_4bit(
    input  wire       clk  ,
    input  wire       rst_n,
    input  wire       sel  ,
    output reg  [3:0] out
);

    reg  [3:0] p_count, count_value;
    wire [3:0] n_count;
    reg cin;

    always @(*) begin
        cin = ~sel;
        count_value = {~sel, ~sel, ~sel, sel};
        out = p_count;
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) p_count <= 4'b0;
        else       p_count <= n_count;
    end

    cla_4bit sum(
        .a(p_count),
        .b(count_value),
        .cin(cin) ,
        .s(n_count)
    );
        
endmodule