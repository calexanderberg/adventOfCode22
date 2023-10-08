module aoc_tb();
  integer file;
  reg [4095:0] line; // Assuming a maximum line length of 4096 characters
  reg [31:0] numbers[4095:0]; // assuming a maximum of 4096 numbers
  logic in1p1;
  logic out1p1;
  day1 part1(in1p1, out1p1);

  initial begin
    // ----------------------------------
    //           DAY 1
    // ----------------------------------
    file = $fopen("tests/day1.txt", "r");

    assert(file != 0) else begin
      $display("Error: Cannot open day1.txt.txt");
      $finish;
    end

    while (!$feof(file)) begin
      line = $fgets(line, file);
      if (!$feof(file)) begin
        numbers[$] <= (line == "") ? 0 : $atoi(line);
        end
      end
    end

    #5
    in1p1 = numbers;
    #5

    assert(out1p1 == 24000) else begin
      $display("Error: Cannot open day1.txt.txt");
      $finish;
    end






  end
endmodule

