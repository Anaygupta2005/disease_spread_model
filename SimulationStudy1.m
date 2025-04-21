clc; clear ; close all

N = 100;
a1=2;
a2=4;
b1=10;
b2=20;
c1=10000;
c2=20000;
DT_bar=0.6;
NHo=99;
NIo=0;
NCo=1;
NHIo=0;
ND=80;
NSIM=5;

Results = SpreadOfDisease(N, a1, a2, b1, b2, c1, c2, DT_bar, NHo, NIo, NCo, NHIo, ND, NSIM);

NI = Results(1:80,:);
NC = Results(81:160,:);
NHI = Results(161:240,:);
NH = Results(241:320,:);

NI_sim1 = NI(:,1);
NC_sim1 = NC(:,1);
NHI_sim1 = NHI(:,1);
NH_sim1 = NH(:,1);
Day = (1:80)';

table_of_sim1 = table(Day, NI_sim1, NC_sim1, NHI_sim1, NH_sim1)

figure(1);

subplot(2,2,1);
plot(1:ND, NH, 'LineWidth', 1.2);
title('Healthy with No Immunity (NH)');
xlabel('Day'); 
ylabel('# Martians');
ylim([0 N]); 
xlim([1 ND]);
legend('Sim1','Sim2','Sim3','Sim4','Sim5');

subplot(2,2,2);
plot(1:ND, NI, 'LineWidth', 1.2);
title('Infected (NI)');
xlabel('Day'); 
ylabel('# Martians');
ylim([0 N]); 
xlim([1 ND]);
legend('Sim1','Sim2','Sim3','Sim4','Sim5');

subplot(2,2,3);
plot(1:ND, NC, 'LineWidth', 1.2);
title('Contagious (NC)');
xlabel('Day'); 
ylabel('# Martians');
ylim([0 N]); 
xlim([1 ND]);
legend('Sim1','Sim2','Sim3','Sim4','Sim5');

subplot(2,2,4);
plot(1:ND, NHI, 'LineWidth', 1.2);
title('Dead (NHI)');
xlabel('Day'); 
ylabel('# Martians');
ylim([0 N]); 
xlim([1 ND]);
legend('Sim1','Sim2','Sim3','Sim4','Sim5');
