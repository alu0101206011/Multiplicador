# Algoritmo de multiplicación de Booth de N bits con recodificación a N bits.
Se ha implementado este algoritmo en Verilog donde la unidad de control es un sistema secuencial calculado. 
En este, se puede hacer la multiplicación de cualquier número de N bits par.

## Implementación
Es un módulo grande llamado multiplicador en el que dentro se encuentran 2 módulos:
- La unidad de control (uc)
- El camino de datos (cd)


## Funcionamiento básico de Verilog

- Para compilar:
```terminal
  $ iverilog -o multiplicador componentes.v cd.v uc.v mul.v multiplicador_tb.v
```

- Para simulación rápida
```terminal
  $ vvp multiplicador
```

- Para simular con el GTKWave:
```terminal
  $ gtkwave multiplicador_tb.vcd
```


## Funcionamiento básico de GTKWave
Una vez abierto es necesario darle a reload para que se "ponga en marcha".

Luego vamos arrastrando las señales que queramos visualizar.

## Resultados y dificultades encontradas
Deberían ser todos CORRECTO para decir que hemos realizado correctamente la práctica.

Las dificultades encontradas han sido a la hora de parametrizar los estados de la máquina Mealy y el doble desplazamiento en un estado.

- Se ha solucionado el doble desplazamiento con un registro que desplace dos posiciones en vez de 1 

- Para calcular los estados de la máquina Mealy se ha realizado una especie de pseudocontador. Lo que se consigue con esto es hacer una máquina que vaya 
calculando sus estados. Se consigue de la siguiente manera:
  - Tenemos 2 estados que siempre van a estar (el estado inicial y el final) y a eso hay que añadirle 1 estado por bit, por ejemplo si es
    de 4 bits tendrá 4 estados adicionales. Esto ocurre porque al desplazar dos veces, el número de iteraciones que tenemos se reduce a la mitad
    pero por cada iteración tenemos 2 estados, por lo que al final coincide con nuestro número par de bits.




