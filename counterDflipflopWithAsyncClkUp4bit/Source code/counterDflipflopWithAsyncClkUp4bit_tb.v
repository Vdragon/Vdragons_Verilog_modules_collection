`timescale 1ns / 100ps
`include "../../Source code/counterDflipflopWithAsyncClkUp4bit/counterDflipflopWithAsyncClkUp4bit.v"
module counterDflipflopWithAsyncClkUp4bit_tb();
  wire [3:0]count;
  reg Clk, ClrN;


counterDflipflopWithAsyncClkUp4bit dffAsynClock(count, Clk, ClrN);

initial /*stimulus*/
  begin
    $dumpfile("Simulation/counterDflipflopWithAsyncClkUp4bit_tb.vcd");
    $dumpvars;
		$monitor($time, " Clk=%b, ClrN=%b -> count=%4b", Clk, ClrN, count);
    ClrN = 0;
    Clk = 0;

  end

initial
  begin
    #45; ClrN = 1;

    #1000 $finish;
  end


always
  begin

    #20 Clk = ~Clk;

  end
endmodule
