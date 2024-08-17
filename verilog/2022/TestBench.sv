/*
The testbench makes an array string of each line in a txt file,
  then it runs each file with that input

Although it is called testbench, I have yet to implement timing
*/
module TestBench;

  string filenames[] = {"day1.txt"}; // Add files as the project progress
  //string filenames[] = {"day1.txt", "day2.txt,", "day3.txt"}; // Add files as the project progress
  reg [63:0] outputs_test1[] = {24000};
  reg [63:0] outputs_test2[] = {45000};
  reg [63:0] outputs1[] = {68802};
  reg [63:0] outputs2[] = {205370};
  string file;
  logic [63:0] out11, out12, out31, out32;
  logic clk;

  day1 day1 (
    .clk(clk),
    .filename(file),
    .out1(out11),
    .out2(out12)
    );

    /*
  day3 day3 (
    .clk(clk),
    .filename(file),
    .out1(out31),
    .out2(out32)
    );
    */

  initial begin
    for ( integer i = 0; i < $size(filenames); i++ ) begin
      file = filenames[i];
      repeat(1) @(posedge clk);
      if (i == 0) begin
        assert (out11 == outputs1[i]);
        assert (out12 == outputs2[i]);
        $display("Day%d, part1: %d", i+1, out11);
        $display("Day%d, part2: %d", i+1, out12);/*
      end else if (i == 2) begin
        assert (out31 == outputs1[i]);
        assert (out32 == outputs2[i]);
        $display("Day%d, part1: %d", i+1, out31);
        $display("Day%d, part2: %d", i+1, out32);
      */
      end
    end
    $finish;
  end

  always #1 clk <= ~clk;
endmodule

