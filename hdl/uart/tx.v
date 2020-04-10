module tx #(
	parameter
		Start = 1,
		Data = 8,
		Parity = 0,
		Stop = 1
) (
	input
		clk,
		reset,
		start,

	input [Data-1:0] in,
	output ready,
	output reg out
);

	localparam
		IDLE = 0,
		START = 1,
		DATA = 2;

	reg [Data-1:0] data;
	reg [1:0] state;

	always @(posedge clk, negedge reset) begin
		if (!reset) begin
			state <= IDLE;
			data <= -1;
		end else begin
		end
	end

	always @(posedge clk) begin
		out <= data[0];
	end

endmodule