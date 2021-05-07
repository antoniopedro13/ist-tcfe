close all
clear all

pkg load symbolic

format long;

R1 = 98437;
C = 0.0073476945;
n = 10;
eta = 1;
freq = 50;
I_s = 1e-14;
k = 22;
Vs = 230;
Vt = 0.025;
w = 2*pi*freq;

T = 1/(2*freq);
t_off = (1/4)*T;
R2 = 677410;

%R2 = ((230/n)-12)/(I_s*(exp(12/(eta*Vt*k))-1));

for i = 1:20
  f = (Vs/n)*C*w*sin(w*t_off) - (1/R1)*(Vs/n)*cos(w*t_off) - I_s*(exp(12/(eta*Vt*k))-1);
  fl = (Vs/n)*C*(w^2)*cos(w*t_off)+(1/R1)*(Vs/n)*w*sin(w*t_off);
  t_off = t_off - (f/fl);
end

t_on = (3/4)*T;

Req = 1/((1/R1)+(1/R2));

for i = 1:20
  f = (Vs/n)*cos(w*t_on)+(Vs/n)*cos(w*t_off)*exp(-(1/(Req*C))*(t_on-t_off));
  fl = -w*(Vs/n)*sin(w*t_on)-(Vs/n)*cos(w*t_off)*(1/(Req*C))*exp(-(1/(Req*C))*(t_on-t_off));
  t_on = t_on - (f/fl);
end

t = 0:(1e-4):0.2;

l = length(t);

v0_env = ones(1,l);

for i = 1:l
  if t(i)<=t_off
    v0_env(i) = abs((230/n)*cos(w*t(i)));
  else
    if t(i)<=t_on
      v0_env(i) = (230/n)*abs(cos(w*t_off))*exp(-(1/(Req*C))*(t(i)-t_off));
    else
      t_off = t_off + T;
      t_on = t_on + T;
      if t(i)<=t_off
        v0_env(i) = abs((230/n)*cos(w*t(i)));
      else
        if t(i)<=t_on
          v0_env(i) = (230/n)*abs(cos(w*t_off))*exp(-(1/(Req*C))*(t(i)-t_off));
        end
      end
    end
  end    
end

retifier = (230/n)*abs(cos(w*t));

v0_env_dc = mean(v0_env)
ripple_v0_env = max(v0_env) - min(v0_env);
v0_env_centro = (ripple_v0_env/2) + min(v0_env);

rd = (eta*Vt)/(I_s*exp((12/k)/(eta*Vt)));
v0_reg_ac = ((k*rd)/(k*rd + R2))*(v0_env - v0_env_dc);

if v0_env_centro >= 12
    v0_reg_dc = 12;
else
    v0_reg_dc = v0_env_centro;
end

v0_reg = v0_reg_ac + v0_reg_dc;

average_reg = mean(v0_reg);
testar = v0_reg - 12;
average = mean(testar);
ripple = max(v0_reg) - min(v0_reg);

Cost = (R1+R2)/1000 + C*(10^6) + 0.1*(k + 4);
Merit = 1/(Cost*(ripple+abs(average) + 10^(-6)));

printf ("envelope_TAB\n");
printf ("Ripple Envelope = %e V \n", ripple_v0_env);
printf ("Average Envelpe = %e V \n", v0_env_dc);
printf ("envelope_END\n");

printf ("regulator_TAB\n");
printf ("Ripple regulator = %e V \n", ripple);
printf ("Average regulator = %e V \n", average_reg);
printf ("regulator_END\n");

printf ("merito_TAB\n");
printf ("Cost = %e MU \n", Cost);
printf ("Merit = %e \n", Merit);
printf ("merito_END\n");

teorica = figure ();
plot (t*1000, v0_env, "g");
hold on
plot(t*1000, v0_reg, "b");
plot(t*1000,retifier, "r");
legend("v0_{envelope} (t)","vc_{regulator} (t)","vs_{retifier} (t)");

xlabel ("Time [ms]");
ylabel ("Voltage");

print (teorica, "teoria", "-depsc");

ripple_env = figure ();
plot (t*1000, v0_env, "g");
legend("vc_{envelop} (t)");

xlabel ("Time [ms]");
ylabel ("Voltage");

print (ripple_env, "ripple_env", "-depsc");

ripple_reg = figure ();
plot (t*1000, v0_reg, "g");
legend("vc_{regulator} (t)");

xlabel ("Time [ms]");
ylabel ("Voltage");

print (ripple_reg, "ripple_reg", "-depsc");
