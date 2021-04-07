close all
clear all

pkg load symbolic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Erros1

fp = fopen("~/ist-tcfe/t2/mat/tensoes_tab.tex","r");
str = importdata("~/ist-tcfe/t2/mat/tensoes_tab.tex",'\t',8);

Tensoes1 = sscanf(char(str(1,1)),"V1 & %e V \\ hline");
Tensoes2 = sscanf(char(str(2,1)),"V2 & %e V \\ hline");
Tensoes3 = sscanf(char(str(3,1)),"V3 & %e V \\ hline");
Tensoes4 = sscanf(char(str(4,1)),"V4 & %e V \\ hline");
Tensoes5 = sscanf(char(str(5,1)),"V5 & %e V \\ hline");
Tensoes6 = sscanf(char(str(6,1)),"V6 & %e V \\ hline");
Tensoes7 = sscanf(char(str(7,1)),"V7 & %e V \\ hline");
Tensoes8 = sscanf(char(str(8,1)),"V8 & %e V \\ hline");

fclose(fp);

fp = fopen("~/ist-tcfe/t2/mat/correntes_tab.tex","r");
str = importdata("~/ist-tcfe/t2/mat/correntes_tab.tex",'\t',10);

I1 = sscanf(char(str(1,1)),"I1 & %e A \\ hline");
I2 = sscanf(char(str(2,1)),"I2 & %e A \\ hline");
I3 = sscanf(char(str(3,1)),"I3 & %e A \\ hline");
I4 = sscanf(char(str(4,1)),"I4 & %e A \\ hline");
I5 = sscanf(char(str(5,1)),"I5 & %e A \\ hline");
I6 = sscanf(char(str(6,1)),"I6 & %e A \\ hline");
I7 = sscanf(char(str(7,1)),"I7 & %e A \\ hline");
Is = sscanf(char(str(8,1)),"Is & %e A \\ hline");
Ic = sscanf(char(str(9,1)),"Ic & %e A \\ hline");
Id = sscanf(char(str(10,1)),"Id & %e A \\ hline");

fclose(fp);

fp = fopen("~/ist-tcfe/t2/sim/op1_tab.tex","r");
str = importdata("~/ist-tcfe/t2/sim/op1_tab.tex",'\t',17);

ca_i = sscanf(char(str(1,1)),"@ca[i] & %e\\ hline");
gb_i = sscanf(char(str(2,1)),"@gb[i] & %e\\ hline");
r1_i = sscanf(char(str(3,1)),"@r1[i] & %e\\ hline");
r2_i = sscanf(char(str(4,1)),"@r2[i] & %e\\ hline");
r3_i = sscanf(char(str(5,1)),"@r3[i] & %e\\ hline");
r4_i = sscanf(char(str(6,1)),"@r4[i] & %e\\ hline");
r5_i = sscanf(char(str(7,1)),"@r5[i] & %e\\ hline");
r6_i = sscanf(char(str(8,1)),"@r6[i] & %e\\ hline");
r7_i = sscanf(char(str(9,1)),"@r7[i] & %e\\ hline");
v_1 = sscanf(char(str(10,1)),"v(1) & %e\\ hline");
v_2 = sscanf(char(str(11,1)),"v(2) & %e\\ hline");
v_3 = sscanf(char(str(12,1)),"v(3) & %e\\ hline");
v_5 = sscanf(char(str(13,1)),"v(5) & %e\\ hline");
v_6 = sscanf(char(str(14,1)),"v(6) & %e\\ hline");
v_7 = sscanf(char(str(15,1)),"v(7) & %e\\ hline");
v_8 = sscanf(char(str(16,1)),"v(8) & %e\\ hline");
v_9 = sscanf(char(str(17,1)),"v(9) & %e\\ hline");

fclose(fp);

E1 = abs(ca_i-Ic);
E2 = abs(gb_i-I2);
E3 = abs(r1_i-I1);
E4 = abs(r2_i-I2);
E5 = abs(r3_i-I3);
E6 = abs(r4_i-I4);
E7 = abs(r5_i-I5);
E8 = abs(r6_i-I6);
E9 = abs(r7_i-I7);
E10 = abs(v_1-Tensoes1);
E11 = abs(v_2-Tensoes2);
E12 = abs(v_3-Tensoes3);
E13 = abs(v_5-Tensoes5);
E14 = abs(v_6-Tensoes6);
E15 = abs(v_7-Tensoes7);
E16 = abs(v_8-Tensoes8);
E17 = abs(v_9-Tensoes7);

printf ("erros1_TAB\n");
printf ("@ca[i] = %e A \n", E1);
printf ("@gb[i] = %e A \n", E2);
printf ("@r1[i] = %e A \n", E3);
printf ("@r2[i] = %e A \n", E4);
printf ("@r3[i] = %e A \n", E5);
printf ("@r4[i] = %e A \n", E6);
printf ("@r5[i] = %e A \n", E7);
printf ("@r6[i] = %e A \n", E8);
printf ("@r7[i] = %e A \n", E9);
printf ("v(1) = %e V \n", E10);
printf ("v(2) = %e V \n", E11);
printf ("v(3) = %e V \n", E12);
printf ("v(5) = %e V \n", E13);
printf ("v(6) = %e V \n", E14);
printf ("v(7) = %e V \n", E15);
printf ("v(8) = %e V \n", E16);
printf ("v(9) = %e V \n", E17);
printf ("erros1_END\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Erros2

fp = fopen("~/ist-tcfe/t2/mat/potenciais_tab.tex","r");
str = importdata("~/ist-tcfe/t2/mat/potenciais_tab.tex",'\t',8);

Potenciais1 = sscanf(char(str(1,1)),"V1 & %e V \\ hline");
Potenciais2 = sscanf(char(str(2,1)),"V2 & %e V \\ hline");
Potenciais3 = sscanf(char(str(3,1)),"V3 & %e V \\ hline");
Potenciais4 = sscanf(char(str(4,1)),"V4 & %e V \\ hline");
Potenciais5 = sscanf(char(str(5,1)),"V5 & %e V \\ hline");
Potenciais6 = sscanf(char(str(6,1)),"V6 & %e V \\ hline");
Potenciais7 = sscanf(char(str(7,1)),"V7 & %e V \\ hline");
Potenciais8 = sscanf(char(str(8,1)),"V8 & %e V \\ hline");

fclose(fp);

fp = fopen("~/ist-tcfe/t2/sim/op2_tab.tex","r");
str = importdata("~/ist-tcfe/t2/sim/op2_tab.tex",'\t',16);

gb_i = sscanf(char(str(1,1)),"@gb[i] & %e\\ hline");
r1_i = sscanf(char(str(2,1)),"@r1[i] & %e\\ hline");
r2_i = sscanf(char(str(3,1)),"@r2[i] & %e\\ hline");
r3_i = sscanf(char(str(4,1)),"@r3[i] & %e\\ hline");
r4_i = sscanf(char(str(5,1)),"@r4[i] & %e\\ hline");
r5_i = sscanf(char(str(6,1)),"@r5[i] & %e\\ hline");
r6_i = sscanf(char(str(7,1)),"@r6[i] & %e\\ hline");
r7_i = sscanf(char(str(8,1)),"@r7[i] & %e\\ hline");
v_1 = sscanf(char(str(9,1)),"v(1) & %e\\ hline");
v_2 = sscanf(char(str(10,1)),"v(2) & %e\\ hline");
v_3 = sscanf(char(str(11,1)),"v(3) & %e\\ hline");
v_5 = sscanf(char(str(12,1)),"v(5) & %e\\ hline");
v_6 = sscanf(char(str(13,1)),"v(6) & %e\\ hline");
v_7 = sscanf(char(str(14,1)),"v(7) & %e\\ hline");
v_8 = sscanf(char(str(15,1)),"v(8) & %e\\ hline");
v_9 = sscanf(char(str(16,1)),"v(9) & %e\\ hline");

fclose(fp);

E18 = abs(v_1-Potenciais1);
E19 = abs(v_2-Potenciais2);
E20 = abs(v_3-Potenciais3);
E21 = abs(v_5-Potenciais5);
E22 = abs(v_6-Potenciais6);
E23 = abs(v_7-Potenciais7);
E24 = abs(v_8-Potenciais8);
E25 = abs(v_9-Potenciais7);

printf ("erros2_TAB\n");
printf ("v(1) = %e V \n", E18);
printf ("v(2) = %e V \n", E19);
printf ("v(3) = %e V \n", E20);
printf ("v(5) = %e V \n", E21);
printf ("v(6) = %e V \n", E22);
printf ("v(7) = %e V \n", E23);
printf ("v(8) = %e V \n", E24);
printf ("v(9) = %e V \n", E25);
printf ("erros2_END\n");
