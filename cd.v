// module registro4 (input wire [3:0] entrada, input wire bit_en_desp, input wire Carga, Desplaza, clk, reset, output wire [3:0] salida);
// module registro3 (input wire [2:0] entrada, input wire bit_en_desp, input wire Carga, Desplaza, clk, reset, output wire [2:0] salida);
// module sum_resta4(output wire[3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire resta);
// module ffdc #(parameter retardo = 0)(input wire clk, reset, carga, d, output reg q);

module cd(input wire [2:0] multiplicador, input wire [2:0] multiplicando, input wire Carga_A, Carga_QM, Desplaza_AQ, Desplaza_M, Resta, clk, reset, output wire salida_Q[0], output reg q_menos1);

  wire [3:0] salida_sum, salida_M, salida_A;
  wire [2:0] salida_Q;
  wire reset_qmenos1, carga_qmenos1, c_sumout;
  registro4 M({multiplicando[2],multiplicando}, 0, Carga_QM, Desplaza_M, clk, reset, salida_M);
  regsitro4 A(salida_sum, salida_A[3], Carga_A, Desplaza_AQ, clk, reset, salida_A);
  registro3 Q(multiplicador, salida_A[0], Carga_QM, Desplaza_AQ, clk, reset, salida_Q); // Necesitamos pegarle un biestable llamado q-1
  sum_resta4 sumador(salida_sum, c_sumout, salida_A, salida_M, Resta);
  ffdc q_menos1(clk, reset_qmenos1, Carga_Q, carga_qmenos1, q_menos1);  // Flip flop mas sencillo
  
endmodule

// Desplaza_M siempre a 0
// Carga_M y Carga_Q pueden ser iguales porque siempre cargan a la par, A no lo hace 
// A y Q desplazan juntos
// Bit en desplazamiento de q es el bit menos significativo de A
// El c_sumout debería ser bit_en_desp de A?