% eigen_vector
A=[2 -1; -1 2];

X=[];
for i=-10:10
   x = i*ones(1,21).';
   X=[X;x];
end

y=linspace(-10,10,21).';
Y=y;
for i=1:20
   Y=[Y;y];
end

trans_X=[];
trans_Y=[];
for i=1:length(X)

trans_v=A*[X(i);Y(i)];
trans_X=[trans_X;trans_v(1)];
trans_Y=[trans_Y;trans_v(2)];
end

figure();
hold on;
plot(X,Y,'k','Marker','.', 'LineStyle','none');
plot(trans_X,trans_Y,'k','Marker','.', 'LineStyle','none','Color','r');
xlim([-15 15]);
ylim([-15 15]);

hold off;


