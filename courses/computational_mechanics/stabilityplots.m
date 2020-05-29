close all
clear all

C = 'color'; c = {'b','r','g','m','y','c'};
x = [0 0]; y = [-8 8]; K = 'k'; LW = 'linewidth'; FS = 'fontsize';

%%%%%%%%%%%%%%%%%

figure;
hold on;

plot(y,x,K,LW,1, 'HandleVisibility','off'), plot(x,y,K, 'HandleVisibility','off')

t = chebfun('t',[0 2*pi]);
z = exp(1i*t); r = z-1;

s = 1; 
P = feval(r./s, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','green', 'FaceColor','green','FaceAlpha',0.1, 'DisplayName', 'Euler');


axis([-3 1 -2 2]), axis square, grid on
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');

title('Explicit Euler')
saveas(gcf,'stability_euler.png');

%%%%%%%%%%%%%%%%%

figure;
hold on;

plot(y,x,K,LW,1, 'HandleVisibility','off'), plot(x,y,K, 'HandleVisibility','off')

d = 1-1./z; r = 0;
%for i = 1:4
%  r = r+(d.^i)/i;
%  plot(r,C,c{i},LW,2)
%end

r = r+(d.^1)/1;
P = feval(r, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
shi = addboundary(shp,[-10,-10,10,10],[-10,+10,+10,-10]);
plot(shi, 'EdgeColor','green', 'FaceColor','green','FaceAlpha',0.1, 'DisplayName', 'implicit Euler');


axis([-1 3 -2 2]), axis square, grid on
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');

title('Implicit Euler')
saveas(gcf,'stability_ieuler.png');



%%%%%%%%%%%%%%%%%

figure;
hold on;

plot(y,x,K,LW,1, 'HandleVisibility','off'), plot(x,y,K, 'HandleVisibility','off')

shi = polyshape([-10,-10,0,0],[-10,+10,+10,-10]);
plot(shi, 'EdgeColor','green', 'FaceColor','green','FaceAlpha',0.1, 'DisplayName', 'implicit Euler');


axis([-2 2 -2 2]), axis square, grid on
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');

title('Trapezoidal')
saveas(gcf,'stability_trapezoidal.png');


%%%%%%%%%%%%%


figure;
hold on;

plot(y,x,K,LW,1, 'HandleVisibility','off'), plot(x,y,K, 'HandleVisibility','off')

t = chebfun('t',[0 2*pi]);
z = exp(1i*t); r = z-1;

s = 1; 
P = feval(r./s, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','green', 'FaceColor','green','FaceAlpha',0.1, 'DisplayName', 'Order 1');

s = (3-1./z)/2; 
P = feval(r./s, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','red', 'FaceColor','red','FaceAlpha',0.1, 'DisplayName', 'Order 2');


s = (23-16./z+5./z.^2)/12;
P = feval(r./s, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','blue', 'FaceColor','blue','FaceAlpha',0.1, 'DisplayName', 'Order 3');

axis([-2.5 .5 -1.5 1.5]), axis square, grid on
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');
legend;
title('Adams-Bashforth')
saveas(gcf,'stability_adams.png');

%%%%%%

figure;
hold on;

plot(y,x,K,LW,1, 'HandleVisibility','off'), plot(x,y,K, 'HandleVisibility','off')

w = z-1;
%plot(w,C,c{1},LW,2)                                % order 1
P = feval(w, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','green', 'FaceColor','green','FaceAlpha',0.1, 'DisplayName', 'Order 1 (explicit Euler)');

for i = 1:3
  w = w-(1+w+.5*w.^2-z.^2)./(1+w);
end
%plot(w,C,c{2},LW,2)                                % order 2
P = feval(w, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','red', 'FaceColor','red','FaceAlpha',0.1, 'DisplayName', 'Order 2');

for i = 1:4
  w = w-(1+w+.5*w.^2+w.^3/6-z.^3)./(1+w+w.^2/2);
end
%plot(w,C,c{3},LW,2)                                % order 3
P = feval(w, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','blue', 'FaceColor','blue','FaceAlpha',0.1, 'DisplayName', 'Order 3');


for i = 1:4
  w = w-(1+w+.5*w.^2+w.^3/6+w.^4/24-z.^4)...
      ./(1+w+w.^2/2+w.^3/6);
end
%plot(w,C,c{4},LW,2)                                % order 4
P = feval(w, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
plot(shp, 'EdgeColor','magenta', 'FaceColor','magenta','FaceAlpha',0.1, 'DisplayName', 'Order 4');

axis([-5 2 -3.5 3.5]), axis square, grid on
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');
legend;
title('Runge-Kutta orders 1,2,3,4')
saveas(gcf,'stability_runge.png');

%%%%%%

figure;
hold on;

plot(y,x,K,LW,1, 'HandleVisibility','off'), plot(x,y,K, 'HandleVisibility','off')

d = 1-1./z; r = 0;
%for i = 1:4
%  r = r+(d.^i)/i;
%  plot(r,C,c{i},LW,2)
%end

r = r+(d.^1)/1;
P = feval(r, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
shi = addboundary(shp,[-10,-10,10,10],[-10,+10,+10,-10]);
plot(shi, 'EdgeColor','green', 'FaceColor','green','FaceAlpha',0.1, 'DisplayName', 'Order 1');

r = r+(d.^2)/2;
P = feval(r, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
shi = addboundary(shp,[-10,-10,10,10],[-10,+10,+10,-10]);
plot(shi, 'EdgeColor','red', 'FaceColor','red','FaceAlpha',0.1, 'DisplayName', 'Order 2');

r = r+(d.^3)/3;
P = feval(r, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
shi = addboundary(shp,[-100,-100,100,100],[-100,+100,+100,-100]);
plot(shi, 'EdgeColor','blue', 'FaceColor','blue','FaceAlpha',0.1, 'DisplayName', 'Order 3');

r = r+(d.^4)/4;
P = feval(r, linspace(0, 2*pi, 100))';
shp = polyshape(real(P), imag(P));
shi = addboundary(shp,[-100,-100,100,100],[-100,+100,+100,-100]);
plot(shi, 'EdgeColor','magenta', 'FaceColor','magenta','FaceAlpha',0.1, 'DisplayName', 'Order 3');

axis([-2 5 -3.5 3.5]), axis square, grid on
xlabel('Re(h\lambda)');
ylabel('Im(h\lambda)');
legend;
title('BDF orders 1,2,3,4')
saveas(gcf,'stability_bdf.png');

