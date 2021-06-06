R1 = 1000;
R2 = 1000;
R3 = 100000;
R4 = 1000;
C1 = 110e-9;
C2 = 220e-9;
i = sqrt(-1);



wL = 1/(R1*C1);
wH = 1/(R2*C2);

if wL>wH
	aux = wL;
	wL = wH;
	wH = aux;
endif

w0 = sqrt(wL*wH);

input_imp = R1 + 1/(i*w0*C1);
output_imp = R2/(1+i*w0*C2*R2);


T_w0 = ((R1*C1*w0*i)/(1+R1*C1*w0*i))*(1/(1+R2*C2*w0*i))*(1+(R3/R4));
Gain_w0 = abs(T_w0);
Gain_w0_dB = 20*log10(Gain_w0);

f = logspace(1,8,70);
w = 2*pi*f;
T_dB = ones(1,length(w));

for k = 1:length(w)
	T = ((R1*C1*w(k)*i)/(1+R1*C1*w(k)*i))*(1/(1+R2*C2*w(k)*i))*(1+(R3/R4))
	T_dB(k) = 20*log10(abs(T));
endfor

freq_deviation = w0/(2*pi) - 1000;
gain_deviation = Gain_w0_dB - 40;

Cost = R1/1000 + R2/1000 + R3/1000 + R4/1000 + (3*220)/(1e-6) + 1;

Merit = 1/(Cost*freq_deviation*gain_deviation);

%Ponto 2 Teorica
teorica = figure ();
plot(log10(f),T_dB,"g");
legend("v_o(f)/v_I(f)");

xlabel ("Log10(Frequency [Hz])");
ylabel ("Circuit Gain");

print (teorica, "teoria", "-depsc");

printf ("final_TAB\n");
printf ("Central Frequency Deviation = %e Hz \n", freq_deviation);
printf ("Gain Deviation = %e dB \n", gain_deviation);
printf ("Cost = %e MU \n", Cost);
printf ("Merit = %e \n", Merit);
printf ("final_END\n\n");

printf ("frequencias_TAB\n");
printf ("Lower Cut Off Frequency = %e rad/s\n", wL);
printf ("Higher Cut Off Frequency = %e rad/s\n", wH);
printf ("Central Frequency = %e rad/s\n", w0);
printf ("frequencias_END\n\n");

printf ("ganhos_TAB\n");
printf ("Gain = %e \n", Gain_w0);
printf ("Gain = %e dB \n", Gain_w0_dB);
printf ("ganhos_END\n\n");

printf ("impedancias_TAB\n");
printf ("Input Impedance = %e \n", input_imp);
printf ("Output Impedance = %e \n", output_imp);
printf ("impedancias_END\n\n");

printf ("componentes_TAB\n");
printf ("R1 = %e \n", R1);
printf ("R2 = %e \n", R2);
printf ("R3 = %e \n", R3);
printf ("R4 = %e \n", R4);
printf ("componentes_END\n\n");
printf ("C1 = %e \n", C1);
printf ("C2 = %e \n", C2);
printf ("componentes_END\n\n");
