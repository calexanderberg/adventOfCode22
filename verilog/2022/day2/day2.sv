/*
*  Easy implementation
*  Just a simple mux
*/
module day2(
  input clk,
  input string filename,
  output [63:0] out1, out2
);

  always @(posedge clk) begin
    integer index = 0;
    reg [63:0] data[];
    logic [63:0] sum, temp1, temp2, temp3 = 0;
    integer file;

    // read the file
    file = $fopen({"../inputs/", filename}, "r");
    if (file == 0) begin
      $display("error: unable to open file ../tests/%s", filename);
    end else begin
      while (!$feof(file)) begin
        string line;
        $fgets(line, file);
        data = new[index + 1] (data);
        $sscanf(line, "%s", data[index]);
        index ++;
      end
      $fclose(file);
    end

    // now for the fun part
    // sums and returns the max values, ez work
    foreach (data[i]) begin
        if (data[i] == 0 && sum != 0) begin
            if (sum > temp1) begin
              temp3 = temp2;
              temp2 = temp1;
              temp1 = sum;
            end else if (sum > temp2 && sum != temp1) begin
              temp3 = temp2;
              temp2 = sum;
            end else if (sum > temp3 && sum != temp1 && sum != temp2) begin
              temp3 = sum;
            end
            sum = 0;
        end else begin
          sum += data[i];
        end
    end

    out1 <= temp1;
    out2 <= temp1 + temp2 + temp3;
  end
endmodule
