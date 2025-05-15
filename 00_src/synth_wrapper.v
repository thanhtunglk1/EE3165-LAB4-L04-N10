module synth_wrapper (

    input  wire      clk  ,
    input  wire      rst_n,
    input  wire      sel  ,
    output reg [3:0] count
    
);

    reg       sel_reg;
    reg [3:0] count_reg;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            sel_reg <= 1'b0;
            count   <= 4'b0;
        end else begin          
            sel_reg <= sel      ;
            count   <= count_reg;
        end
    end

    counter_4bit counter_4bit(
        .clk  (clk)      ,
        .rst_n(rst_n)    ,
        .sel  (sel_reg)  ,
        .out(count_reg)
    );

endmodule