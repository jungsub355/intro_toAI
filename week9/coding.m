clear; close all; clc;
x=0:1e-4:10;
a=-9;
fx=(log10(x).^2)-(a+2).*log10(x)-a+3;
x2=-100:1:100;
y=zeros(1,length(x2));
figure;
plot(x,fx); hold on;
plot(x2,y,'k','LineWidth',1.2); hold off;
grid on; xlim([-10 10]); ylim([-10 20])

%%
