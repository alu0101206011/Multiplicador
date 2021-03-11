`timescale 1 ns / 10 ps

module cd(input wire [2:0] multiplicador, input wire [2:0] multiplicando, input wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, clk, reset, output wire q0, q_menos1, output wire [5:0] result);

  wire [3:0] salida_sum, salida_M, salida_A;
  wire [2:0] salida_Q;
  wire carga_qmenos1, c_sumout;
  registro4 M({multiplicando[2],multiplicando}, 1'b0, Carga_QM, 1'b0, clk, reset, salida_M);
  registro4 A(salida_sum, salida_A[3], Carga_A, Desplaza_AQ, clk, Reset_A, salida_A);
  registro3 Q(multiplicador, salida_A[0], Carga_QM, Desplaza_AQ, clk, reset, salida_Q); // Necesitamos pegarle un biestable llamado q-1
  sum_resta4 sumador(salida_sum, c_sumout, salida_A, salida_M, Resta);
  ffdc bq_menos1(clk, reset, Desplaza_AQ, salida_Q[0], q_menos1);  // Flip flop mas sencillo

  assign q0 = salida_Q[0];
  assign result = {salida_A[2],salida_A[1],salida_A[0],salida_Q};

endmodule

// Desplaza_M siempre a 0
// Carga_M y Carga_Q pueden ser iguales porque siempre cargan a la par, A no lo hace 
// A y Q desplazan juntos
// Bit en desplazamiento de q es el bit menos significativo de A
// El c_sumout debería ser bit_en_desp de A?

// reg wire simplemente es implementación interna, cuando lo instanciemos fuera, no pasa nada si lo ponemos en un wire