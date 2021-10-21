`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2021 10:51:38 PM
// Design Name: 
// Module Name: lock
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


module lock (
	input clk, rst, inA,inB,inC,inD,
	output unlocked);
	
	reg [2:0] state, nextState;
	
	parameter [2:0] I = 2'b000, A = 2'b001, B = 2'b010, C=3'b011, D=3'b100;
	
	always @(inA,inB,inC,inD, state)
		case (state)
			I: begin
                if (inA) nextState = A;
                else nextState = I;                
			end
			
			A: begin
                if (inB) nextState = B;
                else if (inC||inD) nextState = I;
                else nextState = A;
		    end
            
            B: begin
                if (inA) nextState = A;
                else if (inB||inD) nextState = I;
                else if (inC) nextState = C;
                else nextState = B;
            end
            
            C: begin
                if (inA) nextState = A;
                else if (inB||inC) nextState = I;
                else if (inD) nextState = D;
                else nextState = C;
            end

            D: begin
                if (inA) nextState = A;
                else if (inB||inC||inD) nextState = I;
                else nextState = D;
            end



		endcase
		
	always @(posedge clk or negedge rst) begin
		if(rst)
			state <= I;
		else
			state <= nextState;
	end
	assign unlocked = (state == D);
endmodule
				  

