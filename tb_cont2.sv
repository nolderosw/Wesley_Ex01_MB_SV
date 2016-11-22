/*Arquivo para simulação do arquivo cont2.sv */

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
    	#1650 //Provando que no tempo de 1750 ns o 15 se repete, sendo um contador do tipo 2 especificado, usei display pois monitor so imprime quando a variavel se altera, foi a unica forma que vi de fazer
     		$display("Gerado o número %d no tempo(ns):",Saida, $time);
     	#1600 //Mesma lógica que utilizei para o 15 no tempo 1750 ns usei para o 0 em 3450 ns.
     		$display("Gerado o número %d no tempo(ns):",Saida, $time);
	#300
     		$stop; //simulação para com 3650 ns
   end
endmodule
