`timescale 1 ns / 100 ps

module tb;

	reg
		clk,
		reset,
		start;

	reg [7:0]
		in;

	wire
		out,
		ready;

	tx tx0 (
		.clk(clk),
		.reset(reset),
		.start(start),

		.in(in),
		.out(out),

		.ready(ready)
	);

	always begin
		clk = 1;
		#2.5;

		clk = 0;
		#2.5;
	end

	initial begin
		$dumpfile(`VCD);
		$dumpvars(0, tb);

		\reset = 0;

		#100
		\reset = 1;

		in = 'b10110010;
	
		#100
		start = 1;

		$finish;
	end

endmodule