function [out] = performSM(Rob,Tim,Opt)
% PERFORMSM, using the option given by the user, says whether to perform
% scan match or not. We perform a Scan Matching after a certain distance
% has been travelled

if Opt.scanmatcher.usematcher==0
    out = 0;
    return
end

Map = Rob.Map;

% We have no points, no correction will be performed but the last points
% taken will be added
if Rob.lastcorrection == 0
    out = 1;
    return
end

% Distance travelled in meters
distance = ptsDistance(Rob.state.x_full(1:2,Rob.lastcorrection), Rob.state.x(1:2) );

if  distance >= Opt.scanmatcher.motionamount
    out = 1;
else
    out = 0;
end

end