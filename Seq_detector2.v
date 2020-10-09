//H= 1 logic

module seq_detector2(clk, rst, in, out);
input clk, rst, in;
output reg out;
parameter s0=0, s1=1, s2=2, s3=3;
reg [1:0] ps, ns;
always@(posedge clk, posedge rst)
if(rst)
    ps<= s0;
else 
    ps<= ns;
always@(ps, in)
case(ps)
s0 : begin
     ns<= in ? s1 : s0;
     out<= 0;
     end
s1 : begin 
     ns<= in ? s2 : s0;
     out<= 0;
     end
s2 : begin
     ns<= in ? s3 : s0;
     out<= 0;
     end
s3 : begin
     ns<= in ? s3 : s0;
     out<= 1;
     end
endcase
endmodule 
