module counter_4bit(
    input  wire       clk  ,
    input  wire       rst_n,
    input  wire       sel  ,
    output wire [3:0] out
);

    reg [3:0] p_count, n_count, count_value;
    reg cin;

    always @(*) begin
        cin = ~sel;
        count_value = {~sel, ~sel, ~sel, sel};
    end

    assign out = p_count; 

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) p_count <= 4'b0000;
        else       p_count <= n_count;
    end

    cla_4bit cla_4bit(
        .a(p_count),
        .b(count_value),
        .cin(cin) ,
        .s(n_count)
    );
        
endmodule