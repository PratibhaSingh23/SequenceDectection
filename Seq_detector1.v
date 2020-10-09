//MOORE IMPLEMENTATION OF 1011 DETECTOR


module Seq_detector1(clk, rst, in, out);
input in, clk, rst;
output reg out;
parameter s0=0, s1=1, s2=2, s3=3, s4=4;
reg [2:0] ps, ns;
always@(posedge clk, posedge rst)
if(rst)
    ps<= s0;
else
    ps<= ns;
always@(ps, in)
case(ps)
s0 : begin ns<= in? s1 : s0; out<= 0; end
s1 : begin ns<= in? s1 : s2; out<= 0; end
s2 : begin ns<= in? s3 : s0; out<= 0; end
s3 : begin ns<= in? s4 : s2; out<= 0; end
s4 : begin ns<= in? s1 : s2; out<= 1; end
default : begin ns<= s0; out<= 0; end
endcase

endmodule
