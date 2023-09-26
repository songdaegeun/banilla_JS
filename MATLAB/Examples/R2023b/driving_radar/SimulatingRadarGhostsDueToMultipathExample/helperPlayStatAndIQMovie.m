function frms = helperPlayStatAndIQMovie(scenario,egoVehicle,rtxrx,rdg,rngdopproc,beamformer,bmfwin)
% This is a helper function and may be removed or modified in a future
% release.

%   Copyright 2021-2023 The MathWorks, Inc.

s = rng;
clnup = onCleanup(@()rng(s));
rng default

[bep,detPlotterFcn] = helperSetupBEP(egoVehicle,rdg);

[figM,isNew] = helperFigureName('Statistical And IQ');
if isNew
    figM.Position(3) = 2*figM.Position(3);
end
figM.Visible = 'on';
uiBEP = uipanel('Parent',figM,'Title','Bird''s-Eye Plot','Position',[0.01 0.01 0.49 .98]);
uiIQ = uipanel('Parent',figM,'Title','Beamform, Range, and Dopper Processed Video','Position',[0.5 0.01 0.49 .98]);
figBEP = bep.Parent.Parent;

restart(scenario);
reset(rtxrx);
reset(rdg);
reset(rngdopproc);

frms = [];
anggrid = beamformer.Direction(1,:);
while scenario.IsRunning
    tsim = scenario.SimulationTime;

    helperPlotScenario(bep,egoVehicle);

    tgtPoses = targetPoses(egoVehicle);
    paths = helper3BounceGhostPaths(tgtPoses,rdg);
    time = scenario.SimulationTime; % Current simulation time

    [dets,~,config] = rdg(tgtPoses,time);
    detPlotterFcn(dets,config);

    Xcube = rtxrx(paths,time); % Get IQ data from transceiver for real and ghost targets

    mfcoeff = getMatchedFilter(rtxrx.Waveform);
    [Xrngdop,rggrid,rrgrid] = rngdopproc(Xcube,mfcoeff);

    Xbfmrngdop = Xrngdop;
    [Nr,Ne,Nd] = size(Xbfmrngdop);
    Xbfmrngdop = permute(Xbfmrngdop,[1 3 2]); % Nr x Nd x Ne
    Xbfmrngdop = reshape(Xbfmrngdop,[],Ne);
    Xbfmrngdop = beamformer(Xbfmrngdop.*bmfwin(Ne)');
    Xbfmrngdop = reshape(Xbfmrngdop,Nr,Nd,[]); % Nr x Nd x Nb
    Xbfmrngdop = permute(Xbfmrngdop,[1 3 2]); % Nr x Nb x Nd

    set(groot,'ShowHiddenHandles','off');
    figIQ = helperPlotBeamformedRangeDoppler(Xbfmrngdop,rggrid,anggrid,rtxrx);

    delete(uiBEP.Children);
    delete(uiIQ.Children);
    copyobj(figBEP.Children,uiBEP);
    copyobj(figIQ.Children,uiIQ);
    title(uiBEP.Children(2),sprintf('Time: %1.1f s',tsim));
    grid(uiBEP.Children(2),'on');
    delete(uiIQ.Children(end).Title);
    caxis(uiIQ.Children(end),[0 65]);
    xlim(uiIQ.Children(end),[-5 60]);
    uiIQ.Children(1).Location = 'northeast';
    uiIQ.Children(1).String = uiIQ.Children(1).String(1);

    kids = getHiddenChildren(uiBEP.Children(end));
    kids = copyobj(kids(10:end),uiIQ.Children(end));
    for m = 1:numel(kids)
        if isprop(kids(m),'Vertices')
            kids(m).Vertices(:,3) = 100;
        elseif isprop(kids(m),'ZData')
            kids(m).ZData = 100*ones(size(kids(m).XData));
        end
    end
    uiIQ.Children(1).String = uiIQ.Children(1).String(1);
    drawnow;
    frms = [frms;getframe(figM)]; %#ok<AGROW> 

    advance(scenario);
end
delete(clnup);
end

function kids = getHiddenChildren(h)
sh = get(groot,'ShowHiddenHandles');
clnup = onCleanup(@()set(groot,'ShowHiddenHandles',sh));
set(groot,'ShowHiddenHandles','on');
kids = h.Children;
delete(clnup);
end

function writeMovie(frms,scenario) %#ok<DEFNU> 
%%
dt =  scenario.SampleTime;

imgfile = 'ghostIQ_new.gif';
if exist(imgfile,'file')
    delete(imgfile);
end
for m = 1:numel(frms)
    im = frame2im(frms(m));
    [imind,cm] = rgb2ind(im,256);
    
    % Write to the GIF File
    if m == 1
        imwrite(imind,cm,imgfile,'gif', 'Loopcount',inf,'DelayTime',dt);
    else
        imwrite(imind,cm,imgfile,'gif','WriteMode','append','DelayTime',dt);
    end
end
end
