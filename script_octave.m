close all
clear all

pkg load symbolic

R1 = 1.00676538952;
R2 = 2.03303206695;
R3 = 3.03391315228;
R4 = 4.00312807132;
R5 = 3.13101052342;
R6 = 2.0938993245;
R7 = 1.01774389701;

G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
G5 = 1/R5;
G6 = 1/R6;
G7 = 1/R7;

Matriz1_malhas = [R1+R3+R4 R3 R4 0;R4 0 R4+R6+R7-Kc 0;R3*Kb R3*Kb-1 0 0;0 0 0 1];

Matriz2_malhas = [Va;0;0;-Id];

Correntes = Matriz1_malhas\Matriz2_malhas;

Matriz1_nos = [0 G5 0 Kb 0 0 0 -G5-Kb;0 0 G2 -Kb-G2 0 0 0 Kb;0 0 -G2 G2+G1+G3 -G1 0 0 -G3;-G7 0 0 0 0 -G6 G7+G6 0;G7 -G5 0 -G3 0 -G4 -G7 G5+G4+G3;0 0 0 0 1 -1 0 0;-1 0 0 0 0 -Kc*G6 Kc*G6 1;1 0 0 0 0 0 0 0];

Matriz2_nos = [Id;0;0;0;-Id;Va;0;0];

Tensoes = Matriz1_nos\Matriz2_nos;


