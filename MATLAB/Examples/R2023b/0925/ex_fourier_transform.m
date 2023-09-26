T0=2:0.5:100;
f0=1./T0;
T_cut=1;

video=VideoWriter("fig_FT", "MPEG-4");
video.Quality=100;
video.FrameRate=10;
video.open();

h=figure;
set(h,'Position', [200,200,1000,800]);
for i=1:length(T0)
subplot(2,1,1);
t=linspace(0,T0(i),10000).';
x_t=t<T_cut;
t_4p=[t-2*T0(i); t-T0(i); t; t+T0(i);];
x_t_4p=[x_t;x_t;x_t;x_t;];
plot(t_4p, x_t_4p,'k','Linewidth',2);
xlabel('time [sec]');
ylim([0 2]);

subplot(2,1,2);
f_lim=3;
K=2*f_lim*T0(i)+1;
K=K+~mod(K,2);
k=1:K;
k_idx=k-median(k);
% t-domain에서 0 to 1 적분
% a=(exp(-1i*k_idx*2*pi*f0(i))-1)./(-1i*k_idx*2*pi);
a=T0(i)*(exp(-1i*k_idx*2*pi*f0(i))-1)./(-1i*k_idx*2*pi);
% k_idx=0인 경우 정의
% a(median(k))=1/T0(i);
a(median(k))=1;

% f0(i)간격으로 k_idx만큼 indexing한 범위가 x축
stem(k_idx*f0(i),abs(a),'k','fill','Linewidth',1);
xlim([-f_lim-0.5 f_lim+0.5]);
ylim([0 1])
xlabel('Frequency [Hz]');

% text(0.8,0.23,'|a_k|','FontSize',15,'FontWeight','bold');
text(0.8,0.23,'|T0*a_k|','FontSize',15,'FontWeight','bold');
text(1.5,0.23,sprintf('# of Sinusoid = %d',K),'FontSize', 15,'FontWeight','bold');
frame = getframe(gcf);
writeVideo(video, frame);
end

video.close();


