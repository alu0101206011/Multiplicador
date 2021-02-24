`timescale 1 ns / 10 ps
//module cd(input wire [2:0] multiplicador, input wire [2:0] multiplicando, input wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, clk, reset, output wire q0, q_menos1, output wire [5:0] result);

module uc(input wire q0, reset, clk, q_menos1, output wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, Fin);

  reg [2:0] state, nextstate; //Variables para los estados actual y siguiente
                              //Tres bits son suficientes para los siete estados
  //Codificación de los estados
  parameter S0 = 3'b000; //declaracion de constantes que representan estados
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  parameter S5 = 3'b101;
  parameter S6 = 3'b110;
  parameter S7 = 3'b111;

  // Registro de estado, cambia en cada flanco ciclo de reloj por el nuevo estado o
  // se inicia en caso de flanco de subida de reset al estado inicial

  always @ (posedge clk, posedge reset)
    if (reset)
    state <= S0;
    else
    state <= nextstate;

  //Función de Transición
  always @(*) // (*) significa cualquier cambio en alguna variable del bloque
    case (state)
    S0: nextstate = S1;
    S1: nextstate = S2;
    S2: nextstate = S3;
    S3: nextstate = S4;
    S4: nextstate = S5;
    S5: nextstate = S6;
    S6: nextstate = S7;
    S7: nextstate = S7;
    default: nextstate = S0;
  endcase

  // Función de Salida
  assign Carga_A = ((q0 & !(q_menos1)) &((state == S1)|(state == S3)|(state == S5)))? 1:0;
  assign Carga_QM = (state == S0)? 1:0; //a 1 si el estado es S0
  assign Desplaza_AQ = ((state == S2)|(state == S4)|(state == S6))? 1:0;
  assign Reset_A = (state == S0)? 1:0;
  assign Resta = ((q0 & !(q_menos1)) & ((state == S1)|(state == S3)|(state == S5)))? 1:0;
  //assign reset = (state == S0)? 1:0;
  assign Fin = (state == S7)? 1:0;

endmodule

  // Cuando tengamos que hacer la función de la salida, cuando desplazar, assign desplazamiento, cuando estemos en el estado s4
  // cuando estemos en tal s4 s2 y s6 desplazamiento
  // Sumar y cargar, las dos cosas. Voy a sumar siempre. Bueno si la señal es 10 restamos, si no sumamos
  //10 resta
  //01 suma

// -Wall en compilación