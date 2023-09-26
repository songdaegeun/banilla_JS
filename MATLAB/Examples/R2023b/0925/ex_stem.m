figure();
X = linspace(0,2*pi,50)';
Y = (exp(X).*sin(X));
% descrete data
subplot(2,1,1);
stem(X,Y)
% continuous data
subplot(2,1,2);
plot(X,Y)
