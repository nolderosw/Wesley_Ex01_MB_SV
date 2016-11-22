/*Arquivo para simulação do arquivo cont1.sv */

`timescale 1ns/1ns //Diretiva de compilação necessário pra simulação

module TB_Teste();

   logic Rst, Clock;
   logic [3:0] Saida;

   //Instanciando o módulo Teste, com o nome de Tst
  Teste Tst(.Clock(Clock), .Reset(Rst), .Out(Saida));

   always #50 Clock <= ~Clock; //Gerando o sinal de clock, com período de 100 ns

   initial begin
		//Instante inicial na simulação
		Clock <= 0;
		Rst <= 1;
     	#100
     		Rst <= 0; //Tive que dar um clock de Reset para o contador iniciar tudo em estado ok.
     $monitor("Gerado o número %d no tempo(ns):",Saida,$time);//Monitorando a variável de saida, para conferir quais saidas foram geradas no determinado tempo
	#3550
     		$stop; //simulação para com 3650 ns
   end
endmodule
