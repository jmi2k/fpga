module vga #(
	parameter
		Width = 800,
		Height = 600,

		Hfp = 40,
		Hbp = 88,

		Vfp = 1,
		Vbp = 23,

		Hsync = 128,
		Vsync = 4
) (
	input
		clk,
		reset,

	output
		hsync, vsync,
		hblank, vblank,

	output reg [11:0]
		x, y
);

	localparam
		FullX = Width + Hfp + Hsync + Hbp,
		FullY = Height + Vfp + Vsync + Vbp;

	wire
		xmaxed = x == FullX-1,
		ymaxed = y == FullY-1;

	assign
		\hblank = !(x >= Width),
		\vblank = !(y >= Height),

		\hsync = !(x >= Width + Hfp & x < FullX - Hbp),
		\vsync = !(y >= Height + Vfp & y < FullY - Vbp);

	always @(posedge clk) begin
		if (!reset) begin
			x <= 0;
			y <= 0;
		end else if (xmaxed) begin
			x <= 0;
			y <= ymaxed ? 0 : y+1;
		end else x <= x+1;
	end

endmodule
