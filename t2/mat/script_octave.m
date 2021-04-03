close all
clear all

pkg load symbolic

i = sqrt(-1);

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
Kd = 8.17006533463e03;

G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
G5 = 1/R5;
G6 = 1/R6;
G7 = 1/R7;

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
printf ("Kb = %e S \n", Kb);
printf ("Kd = %e Ohm \n", Kd);
printf ("dados_END\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ponto1

Matriz_tensoes1 = [1, 0, 0, 0, 0, 0, 0, 0; -G1, G1+G2+G3, -G2, 0, -G3, 0, 0, 0; 0, -G2-Kb, G2, 0, Kb, 0, 0, 0; 0, 0, 0, 1, 0, 0, 0, 0; 0, 0, 0, Kd*G6, -1, 0, -Kd*G6, 1; 0, Kb, 0, 0, -Kb-G5, G5, 0, 0; 0, 0, 0, -G6, 0, 0, G6+G7, -G7; 0, -G3, 0, -G4-G6, G3+G4+G5, -G5, G6, 0];

Matriz_tensoes2 = [Vs; 0; 0; 0; 0; 0; 0; 0];

Tensoes = Matriz_tensoes1\Matriz_tensoes2;

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ponto2

Matriz_potenciais1 = [1, 0, 0, -1, 0, 0, 0, 0; -G1, G1+G2+G3, -G2, 0, -G3, 0, 0, 0;  0, -G2-Kb, G2, 0, Kb, 0, 0, 0; G1+G4+G6, -G1, 0, 0, -G4, 0, -G6, 0; 0, 0, 0, 1, 0, 0, 0, 0; 0, 0, 0, 0, 0, 1, 0, 0; 0, 0, 0, -G6, 0, 0, G6+G7, -G7; 0, 0, 0, 0, 0, 0, 0, 1];

Matriz_potenciais2 = [0; 0; 0; 0; 0; Tensoes(6); 0; Tensoes(8)];

Potenciais = Matriz_potenciais1\Matriz_potenciais2;

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

Vx = Tensoes(6)-Tensoes(8);
Ix = Kb*(Potenciais(2)-Potenciais(5)) - G5*(Potenciais(5)-Potenciais(6));
Req = Vx/Ix;
Time_const = Req*C;

printf ("dados2_TAB\n");
printf ("Vx = %e V \n", Vx);
printf ("Ix = %e A \n", Ix);
printf ("Req = %e Ohm \n", Req);
printf ("tau = %e s \n", Time_const);
printf ("dados2_END\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ponto3

%time axis: 0 to 20ms with 1us steps
t=0:1e-6:20e-3;
v6n = (Vx)*exp(-(t/Time_const));

Natural = figure ();
plot (t*1000, v6n, "g");
hold on
xlabel ("t[ms]");
ylabel ("v_6n(t) [V]");
hold off

print (Natural, "Natural Solution in Node 6", "-depsc");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ponto4

w = 2*pi*1000;

Matriz_phasors1 = [1, 0, 0, 0, 0, 0, 0, 0; -G1, G1+G2+G3, -G2, 0, -G3, 0, 0, 0; 0, -G2-Kb, G2, 0, Kb, 0, 0, 0; 0, 0, 0, 1, 0, 0, 0, 0; 0, 0, 0, Kd*G6, -1, 0, -Kd*G6, 1; 0, Kb, 0, 0, -Kb-G5, G5+i*w*C, 0, -i*w*C; 0, 0, 0, -G6, 0, 0, G6+G7, -G7; 0, -G3, 0, -G4, G3+G4+G5, -G5-i*w*C, -G7, G7+i*w*C];

Matriz_phasors2 = [1; 0; 0; 0; 0; 0; 0; 0];

Phasors = Matriz_phasors1\Matriz_phasors2;

for n=1:8
	Fase(n) = (180/pi)*arg(Phasors(n));
	Amplitude(n) = abs(Phasors(n));
end

printf ("phasors_TAB\n");
printf ("Amplitude1 = %e V; Fase1 = %e graus \n",Amplitude(1), Fase(1));
printf ("Amplitude2 = %e V; Fase2 = %e graus \n",Amplitude(2), Fase(2));
printf ("Amplitude3 = %e V; Fase3 = %e graus \n",Amplitude(3), Fase(3));
printf ("Amplitude4 = %e V; Fase4 = %e graus \n",Amplitude(4), Fase(4));
printf ("Amplitude5 = %e V; Fase5 = %e graus \n",Amplitude(5), Fase(5));
printf ("Amplitude6 = %e V; Fase6 = %e graus \n",Amplitude(6), Fase(6));
printf ("Amplitude7 = %e V; Fase7 = %e graus \n",Amplitude(7), Fase(7));
printf ("Amplitude8 = %e V; Fase8 = %e graus \n",Amplitude(8), Fase(8));
printf ("phasors_END\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ponto5

t_neg=-5e-3:1e-6:(-1e-6);

t_total = [t_neg t];

n_neg = length(t_neg);
vetor_aux = ones(1,n_neg);
tensao6 = vetor_aux*Tensoes(6);
vetor_Vs = vetor_aux*Vs;
 
v6f = Amplitude(6)*sin(w*t+Fase(6)*(pi/180));
v6_pos = v6n + v6f;
v6 = [tensao6 v6_pos];

vs_pos = sin(w*t);
vs = [vetor_Vs vs_pos];

Solucao_geral = figure ();
plot (t_total*1000, v6, "g");
hold on
plot(t_total*1000, vs, "b");

xlabel ("t[ms]");
ylabel ("v_6(t), vs(t) [V]");
hold off

print (Solucao_geral, "General_solution", "-depsc");
