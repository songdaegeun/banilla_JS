T0=2:0.5:100;
f0=1./T0;
T_cut=1;

video=VideoWriter("FT_video", "MPEG-4");
video.Quality=100;
video.FrameRate=10;
video.open();


h=figure;
set(h,'Position', [200,200,1000,800]);
for kk=1:length(T0)

frame = getframe(gcf);
writeVideo(video, frame);
end

video.close();


