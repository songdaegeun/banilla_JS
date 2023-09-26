T0=2:0.5:100;
f0=1./T0;
T_cut=1;

% video=VideoWriter('video3','MPEG-4');
% video.FrameRate=10;
% video.Quality=100;
% open(video)

h=figure;
set(h, 'Position', [100 300 1200 440])

for kk=1:length(T0)
t=linspace(0,T0(kk),10000).';
rect=t<T_cut;
subplot(2,1,1)
t_4p=[t-2*T0(kk) ; t-T0(kk) ; t ; t+T0(kk)];
rect_4p=[rect ; rect ; rect ; rect];
plot(t_4p,rect_4p,'k','Linewidth',2)
xlabel('time [sec]')
ylim([0 2])

subplot(2,1,2)
f_lim=3;     % 기준하는 maximum Hz까지 닿을 때까지 k를 뻗을 예정
% kw
% f0=1/T0
K=f_lim*T0(kk)*2+1;
K=K+~mod(K,2); % 홀수로 만듦(upper)
k=1:K;
k_idx=k-median(k);
a=(exp(-1i*2*pi*f0(kk)*k_idx)-1)./(-1i*2*pi*k_idx);
% k_idx=0일 때를 정의
a(median(k))=1/T0(kk);
stem(k_idx*f0(kk),abs(a),'k','fill','Linewidth',1)
xlim([-f_lim-0.5 f_lim+0.5])
xlabel('Frequency [Hz]')
ylim([0 0.3])
text(0.6,0.23,'|a_k|','FontSize',15,'FontWeight','bold')
text(2.5,0.1, sprintf( '# of Sinusoids = %d',K) ,'FontSize',10,'FontWeight','bold')
set(gcf,'color','w');
frame = getframe(gcf);
% writeVideo(video,frame);
end

% close(video)