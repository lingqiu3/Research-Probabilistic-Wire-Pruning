/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP5
// Date      : Thu Jul  5 10:22:57 2018
/////////////////////////////////////////////////////////////

`timescale 100ns/1ns

module adder_4bit ( a, b, sum, carry );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  output carry;
  wire   n1, n2, n3, n4, n5, n6, n7;

  XOR2X1 U2 ( .IN1(n1), .IN2(n2), .Q(sum[3]) );
  XOR2X1 U3 ( .IN1(n3), .IN2(n4), .Q(sum[2]) );
  XOR2X1 U4 ( .IN1(n5), .IN2(n6), .Q(sum[1]) );
  AND2X1 U5 ( .IN1(a[0]), .IN2(b[0]), .Q(n5) );
  XOR2X1 U6 ( .IN1(b[0]), .IN2(a[0]), .Q(sum[0]) );
  AO22X1 U7 ( .IN1(a[3]), .IN2(b[3]), .IN3(n1), .IN4(n2), .Q(carry) );
  AO22X1 U8 ( .IN1(a[2]), .IN2(b[2]), .IN3(n3), .IN4(n4), .Q(n2) );
  AO22X1 U9 ( .IN1(a[1]), .IN2(b[1]), .IN3(n7), .IN4(b[0]), .Q(n4) );
  AND2X1 U10 ( .IN1(n6), .IN2(a[0]), .Q(n7) );
  XOR2X1 U11 ( .IN1(a[1]), .IN2(b[1]), .Q(n6) );
  XOR2X1 U12 ( .IN1(a[2]), .IN2(b[2]), .Q(n3) );
  XOR2X1 U13 ( .IN1(a[3]), .IN2(b[3]), .Q(n1) );
endmodule

