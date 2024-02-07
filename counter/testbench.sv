module testbench;

    // Inputs
    reg clk;
    reg rst_n;
    reg enable;
    reg up_down;
    reg load;
    reg [3:0] data_in;

    // Outputs
    wire [3:0] count;

    // Instantiate the counter
    up_down_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .up_down(up_down),
        .load(load),
        .data_in(data_in),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        rst_n = 0;
        enable = 0;
        up_down = 0;
        load = 0;
        data_in = 4'b0000;

        // Reset and enable
        #10 rst_n = 1;
        #10 enable = 1;

        // Up counter test
        #10 up_down = 0;
        #10 load = 0;
        #10 load = 1;
        #10 load = 0;

        // Down counter test
        #10 up_down = 1;
        #10 load = 0;
        #10 load = 1;
        #10 load = 0;

        // Additional test cases can be added here

        // End simulation
        #10;
        $finish;
    end

endmodule
