clear all, close all, clc;
n = 30;
k = 1:25;

FPE = (n+k)./(n-k);
AIC = 2*(k+1)/n;
AICc = (n+k)./(n-k-2);

FPE = FPE - FPE(1);
AIC = AIC - AIC(1);
AICc = AICc - AICc(1);

plot(FPE); hold on;
plot(AIC);hold on;
plot(AICc);hold off;