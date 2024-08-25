
/*
*  Easy implementation
*  Just a simple mux
*/
module day3(
  input string filename,
  input logic clk,
  output [63:0] out1, out2
);

  always @(posedge clk) begin
    //reg [63:0] data;
    integer file;
    integer size;
    logic [7:0] char;
    logic [7:0] a[], b[];
    integer x, y = 0;
    logic [7:0] val1, val2 = 0;

    // read the file
    file = $fopen({"../tests/", filename}, "r");
    if (file == 0) begin
      $display("error: unable to open file ../tests/%s", filename);
    end else begin
      while (!$feof(file)) begin
        string line;
        $fgets(line, file);
        if ($sscanf(line.getc(0), "%d", size) != 10) begin
          size = (line.len() - 1) / 2;
          $display("%s", line);
          foreach (line[i]) begin
            if (i<size) begin
              a = new[x + 1] (a);
              char = line.getc(i);
              a[x] = char;
              x++;
            end else begin
              b = new[y + 1] (b);
              char = line.getc(i);
              b[y] = char;
              foreach (a[k]) begin
                val1 = (b[y] == a[k]) ? b[y] : val1;
              end
              y++;
            end
          end
          val2 = (val1 > 97) ? val1 - 96 : val1- (65-27); // I am keeping this math here because it is stupid
          $display("%d", val2);
        end
      end
      $fclose(file);
    end

    // now for the fun part

     out1 <= 0;
     out2 <= 0;
  end
endmodule
