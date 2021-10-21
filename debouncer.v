`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2021 10:31:25 PM
// Design Name: 
// Module Name: debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(input D, input clk, output Q );

reg Q1,Q2,Q3;
always @(posedge clk)
begin
    Q1<=D;
    Q2<=Q1;
    Q3<=Q2;
end
assign Q= Q1& Q2&Q3;
endmodule
