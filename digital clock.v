module digital_clock(clk,en,rst, s1,s2, m1, m2, h1, h2);
input clk, en, rst;
output [3:0] s1,s2, m1, m2, h1, h2;
reg [5:0] hour=0, min=0, sec=0;
wire [6:0] seg1,seg2,seg3,seg4;
integer clkc=0;
localparam onesec=100; //1 second
always @(posedge clk)
begin
if (rst == 1'b1)
    {hour,min,sec}<=0;
else if (en == 1'b1)
if (clkc == onesec)
begin
clkc<=0;
if (sec == 6'd59)begin
 sec<=0;
if (min == 6'd59)begin
 min<=0;
 if (hour == 6'd23)
  hour<=0;
  else
hour <= hour+1'd1;
end else
min<=min+1'd1;
end else
sec<=sec+1'd1;
end else
clkc<=clkc+1;
end
binarytoBCD secs(.binary(sec),.thos(),.huns(),.tens(s2),.ones(s1));
binarytoBCD mins(.binary(min),.thos(),.huns(),.tens(m2),.ones(m1));
binarytoBCD hours(.binary(hour),.thos(),.huns(),.tens(h2),.ones(h1));
decoder_7seg disp1 (h1, seg1);
decoder_7seg disp2 (h2, seg2);
decoder_7seg disp3 (m1, seg3);
decoder_7seg disp4 (m2, seg4);
endmodule

//7segmodule
module decoder_7seg(in1, out1);
input [3:0] in1;
output reg [6:0] out1;
always @(in1)
case (in1)
4'b0000:out1=7'b1000000; //0

4'b0001: out1=7'b1111001; //1

4'b0010: out1=7'b0100100; //2

4'b0011: out1=7'b0110000; //3

4'b0100: out1=7'b0011001; //4

4'b0101: out1=7'b0010010; //5

4'b0110: out1=7'b0000010; //6

4'b0111: out1=7'b1111000; //7

4'b1000: out1=7'b0000000; //8

4'b1001: out1=7'b0010000; //9
endcase
endmodule

//binary to bcd
module binarytoBCD (binary, thos, huns, tens, ones);
input [5:0] binary;
output reg [3:0] thos, huns, tens, ones;
reg [11:0] bcd_data=0;
always @(binary)
begin
bcd_data = binary;
thos = bcd_data / 1000;
bcd_data = bcd_data % 1000;
huns = bcd_data / 100;
bcd_data = bcd_data % 100;
tens=bcd_data / 10;
ones=bcd_data % 10;
end
endmodule