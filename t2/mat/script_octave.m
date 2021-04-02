close all
clear all

pkg load symbolic

R1 = 1.00676538952e03;
R2 = 2.03303206695e03;
R3 = 3.03391315228e03;
R4 = 4.00312807132e03;
R5 = 3.13101052342e03;
R6 = 2.0938993245e03;
R7 = 1.01774389701e03;
Vs = 5.22319986769;
C = 1.03536137445e-06;
Kb = 7.2727641018e-03;
Kd = 8.17006533463e-03;

G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
G5 = 1/R5;
G6 = 1/R6;
G7 = 1/R7;

%Ponto1

Matriz_tensoes1 = [1, 0, 0, 0, 0, 0, 0, 0; -G1, G1+G2+G3, -G2, 0, -G3, 0, 0, 0; 0, -G2-Kb, G2, 0, Kb, 0, 0, 0; 0, 0, 0, 1, 0, 0, 0, 0; 0, 0, 0, Kd*G6, -1, 0, -Kd*G6, 1; 0, Kb, 0, 0, -Kb, G5, 0, 0; 0, 0, 0, -G6, 0, 0, G6+G7, -G7; 0, -G3, 0, -G4-G6, G3+G4+G5, -G5, G6, 0];

Matriz_tensoes2 = [Vs; 0; 0; 0; 0; 0; 0; 0];

Tensoes = Matriz_tensoes1\Matriz_tensoes2;

%Ponto2

Matriz_potenciais1 = [1, 0, 0, -1, 0, 0, 0, 0; -G1, G1+G2+G3, -G2, 0, -G3, 0, 0, 0;  0, -G2-Kb, G2, 0, Kb, 0, 0, 0; G1+G4+G6, -G1, 0, 0, -G4, 0, -G6, 0; 0, 0, 0, 1, 0, 0, 0, 0; 0, 0, 0, 0, 0, 1, 0, 0; 0, 0, 0, -G6, 0, 0, G6+G7, -G7; 0, 0, 0, 0, 0, 0, 0, 1];

Matriz_potenciais2 = [0; 0; 0; 0; 0; Tensoes(6); 0; Tensoes(8)];

Potenciais = Matriz_potenciais1\Matriz_potenciais2;

Vx = Potenciais(6)-Potenciais(8)
Ix = Kb*(Potenciais(5)-Potenciais(2)) + G5*(Potenciais(5)-Potenciais(6));
Req = Vx/Ix;
Time_const = Req*C;

printf ("dados_TAB\n");
printf ("R1 = %e Ohm \n", R1);
printf ("R2 = %e Ohm \n", R2);
printf ("R3 = %e Ohm \n", R3);
printf ("R4 = %e Ohm \n", R4);
printf ("R5 = %e Ohm \n", R5);
printf ("R6 = %e Ohm \n", R6);
printf ("R7 = %e Ohm \n", R7);
printf ("Vs = %e V \n", Vs);
printf ("C = %e F \n", C);
printf ("Kb = %e s \n", Kb);
printf ("Kd = %e s \n", Kd);
printf ("dados_END\n");

printf ("tensoes_TAB\n");
printf ("V1 = %e V \n", Tensoes(1));
printf ("V2 = %e V \n", Tensoes(2));
printf ("V3 = %e V \n", Tensoes(3));
printf ("V4 = %e V \n", Tensoes(4));
printf ("V5 = %e V \n", Tensoes(5));
printf ("V6 = %e V \n", Tensoes(6));
printf ("V7 = %e V \n", Tensoes(7));
printf ("V8 = %e V \n", Tensoes(8));
printf ("tensoes_END\n");

printf ("potenciais_TAB\n");
printf ("V1 = %e V \n", Potenciais(1));
printf ("V2 = %e V \n", Potenciais(2));
printf ("V3 = %e V \n", Potenciais(3));
printf ("V4 = %e V \n", Potenciais(4));
printf ("V5 = %e V \n", Potenciais(5));
printf ("V6 = %e V \n", Potenciais(6));
printf ("V7 = %e V \n", Potenciais(7));
printf ("V8 = %e V \n", Potenciais(8));
printf ("potenciais_END\n");

printf ("dados2_TAB\n");
printf ("Vx = %e V \n", Vx);
printf ("Ix = %e A \n", Ix);
printf ("Req = %e Ohm \n", Req);
printf ("RC = %e s \n", Time_const);
printf ("dados2_END\n");
