module up_down_counter (
    input wire clk,          // Clock input
    input wire rst_n,        // Asynchronous reset (active low)
    input wire enable,       // Enable input
    input wire up_down,      // Direction control input (0 for up, 1 for down)
    input wire load,         // Load input
    input wire [3:0] data_in,// Data input for synchronous load
    output reg [3:0] count   // Counter output
);

// Counter logic
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n) begin        // Asynchronous reset
        count <= 4'b0000;
    end
    else if (enable) begin
        if (load) begin      // Synchronous load
            count <= data_in;
        end
        else begin
            if (up_down) begin // Down counter
                count <= count - 1;
            end
            else begin        // Up counter
                count <= count + 1;
            end
        end
    end
end

endmodule