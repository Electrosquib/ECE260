module testbench ();

  reg clk_5MHz;
  wire pulse;

  // Instantiate the clock divider module
  clock_divider dut (
    .clk_5MHz(clk_5MHz),
    .pulse(pulse)
  );

  // Clock generation
  initial 
  begin
    #100;  // 100 time units per clock cycle
    clk_5MHz = ~clk_5MHz;
  end

endmodule
