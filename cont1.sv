/*Definição do contador do 1o tipo: 0, 1, 2,..., 13, 14, 15, 14, 13,..., 1, 0, 1, 2...*/

`timescale 1ns/1ns //Diretiva necessária para poder simular
  
  
module Teste (
	input Reset,//Sinal de reset 
  		  Clock, //Sinal de clock 
	
	output [3:0] Out //Saída de 4 bits
	);
	
  logic [3:0] Cont; //Definição do registrador de 4 bits
  assign Out = Cont;
  logic Dir; //Sinal que determina se a contagem será crescente ou decrescente
	always_ff @ (posedge Clock) begin //Sensível na borda de subida do sinal de Clock
		
		if(Reset) //Reset síncrono
			Cont <= 4'd0;
		
		else
          if(Dir == 0) //Contador incrementa, contando de 0 a 15
            if(Cont == 4'd15)begin //Atingindo 15: no próximo pulso de Clock, Dir recebe 1 e Cont recebe 14.
				Dir = 1;
      				Cont <= 4'd14;
            end
		else
				Cont <= Cont + 4'd1;
			
	  else //Contador decrementa, contando de 15 a 0
        if(Cont == 4'd0)begin //Atingindo 0: no próximo pulso de Clock, Dir recebe 0 e Con recebe 1.
				Dir = 0;
          			Cont <= 4'd1;
        end
		else
				Cont <= Cont - 4'd1;
end
	
endmodule
