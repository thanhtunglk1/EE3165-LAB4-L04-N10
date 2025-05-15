module testbench();

    reg clk;
    reg rst_n;
    reg sel;
    reg [3:0] count;

    synth_wrapper wrapper(
        .clk  (clk),
        .rst_n(rst_n),
        .sel  (sel),
        .count(count)
    );

    initial begin
        $shm_open("waves.shm"); 
        $shm_probe("AS");
    end

    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("COUNTER TEST BEGIN");
        test_reset();

        test_count(0, 1);
        rst_n = 1'b0;
        test_count(1, 1);
        rst_n = 1'b0;
        test_count(2, 1);
        rst_n = 1'b0;
        test_count(3, 1);
        rst_n = 1'b0;
        test_count(4, 1);
        rst_n = 1'b0;
        test_count(5, 1);
        rst_n = 1'b0;
        test_count(6, 1);
        rst_n = 1'b0;
        test_count(7, 1);
        rst_n = 1'b0;
        test_count(8, 1);
        rst_n = 1'b0;
        test_count(16, 1);
        if(count == 4'b0000) $display("COUNT UP OVERFLOW: [PASS]");
        else                 $display("COUNT UP OVERFLOW: [FAIL]");
        rst_n = 1'b0;

        test_count(0, 0);
        rst_n = 1'b0;
        test_count(1, 0);
        rst_n = 1'b0;
        test_count(2, 0);
        rst_n = 1'b0;
        test_count(3, 0);
        rst_n = 1'b0;
        test_count(4, 0);
        rst_n = 1'b0;
        test_count(5, 0);
        rst_n = 1'b0;
        test_count(6, 0);
        rst_n = 1'b0;
        test_count(7, 0);
        rst_n = 1'b0;
        test_count(8, 0);
        rst_n = 1'b0;
        test_count(17, 0);
        if(count == 4'b1111) $display("COUNT DOWN OVERFLOW: [PASS]");
        else                 $display("COUNT DOWN OVERFLOW: [FAIL]");
        rst_n = 1'b0;

        $display("COUNTER TEST DONE");

        #5000
        $finish;
    end

    task test_reset;
        begin
            rst_n = 1'b0;
            repeat(3) @(posedge clk);
            if (count == 4'b0000) $display("RESET VALUE: [PASS]");
            else                  $display("RESET VALUE: [FAIL]");
            
            repeat(10) @(posedge clk);
            if (count == 4'b0000) $display("RESET HOLD: [PASS]");
            else                  $display("RESET HOLD: [FAIL]");
        end
    endtask

    task test_count;
        input signed [31:0] time_count; // Verilog không hỗ trợ int, dùng [31:0] thay thế
        input up_down;
        integer i;
        begin
            if(up_down) $display("COUNT UP TEST: %4d times", time_count);
            else        $display("COUNT DOWN TEST: %4d times", time_count);
            rst_n = 1'b0;
            repeat(3) @(posedge clk);
            #1
            sel   = up_down;
            rst_n = 1'b1;
            
            if(up_down) repeat(2) @(posedge clk);
            else #0;

            $display("VALUE: %b", count);    
            repeat(2) @(posedge clk);

            for (i = 0; i < time_count; i = i + 1) begin
                @(posedge clk);
                $display("VALUE: %b", count);      
            end

            if(up_down) $display("COUNT UP TEST: %4d times, %s", time_count, (time_count == count) ? "[PASS]" : "[FAIL]");
            else        $display("COUNT DOWN TEST: %4d times, %s", time_count, ((16 - time_count) == count) ? "[PASS]" : "[FAIL]");
        end
    endtask

endmodule