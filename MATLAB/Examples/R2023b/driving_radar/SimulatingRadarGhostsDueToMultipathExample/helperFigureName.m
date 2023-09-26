function [fig,isNew] = helperFigureName(name)
% This is a helper function and may be removed or modified in a future
% release.

%   Copyright 2021-2023 The MathWorks, Inc.
fig = findobj(groot,'Type','figure','Name',name);
isNew = isempty(fig);
if isNew
    fig = figure('Name',name);
end
fig = fig(1);
end
