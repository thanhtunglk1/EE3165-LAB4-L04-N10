module synth_wrapper (

    input  wire      clk  ,
    input  wire      rst_n,
    input  wire      sel  ,
    output reg [3:0] count
    
);

    reg        sel_reg;
    wire [3:0] count_reg;

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            sel_reg <= 1'b0;
        end 
        
        else begin          
            sel_reg <= sel      ;
        end
    end

    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            count = 4'b0;
        end 
        
        else begin
            count = count_reg;
        end
    end

    counter_4bit counter(
        .clk  (clk)      ,
        .rst_n(rst_n)    ,
        .sel  (sel_reg)  ,
        .out(count_reg)
    );

endmodule