
`timescale 1ns/1ps
module digital_clock_tb;

reg clk = 0, rst = 1, en = 0;
wire [3:0] s1, s2, m1, m2, h1, h2;

digital_clock uut(clk, en, rst, s1, s2, m1, m2, h1, h2);

always #5 clk = ~clk; // 10ns period clock

initial begin
    #10 rst = 0; en = 1;
    #10000 $stop;
end

endmodule