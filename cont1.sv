/*Definição do contador do 1o tipo: 0, 1, 2,..., 13, 14, 15, 14, 13,..., 1, 0, 1, 2...*/

`timescale 1ns/1ns //Diretiva necessária para poder simular
  
  
module Teste (
	input Reset,//Sinal de reset 
  		  Clock, //Sinal de clock 
	
	output [3:0] Out //Saída de 4 bits
	);
	
  logic [3:0] Cont; //Definição do registrador de 4 bits
  assign Out = Cont;
	always_ff @ (posedge Clock) begin //Sensível na borda de subida do sinal de Clock
		
		if(Reset) //Reset síncrono
			Cont <= 4'd0;
		
		else
			Cont <= Cont + 4'd1;
	end
	
endmodule
