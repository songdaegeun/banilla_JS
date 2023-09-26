function [scenario, egoVehicle] = helperGroundBounceScenarioDSD(hgtGrndClearance,distToFirstCar,distBetweenCars)
% This is a helper function and may be removed or modified in a future
% release.

%   Copyright 2021-2023 The MathWorks, Inc.

% createDrivingScenario Returns the drivingScenario defined in the Designer

% Generated by MATLAB(R) 9.11 (R2021b) and Automated Driving Toolbox 3.2 (R2021b).
% Generated on: 23-Apr-2021 08:30:44

% Typical ground clearance for a sedan is 6 inches
if nargin<1
    hgtGrndClearance = 6/12*0.3048;
end

if nargin<2
    distToFirstCar = 20;
end

if nargin<3
    distBetweenCars = 16;
end

% Construct a drivingScenario object.
scenario = drivingScenario;

% Add all road segments
roadCenters = [0 0 0;
    20+distToFirstCar+distBetweenCars 0 0];
road(scenario, roadCenters, 'Name', 'Road');

% Add the ego vehicle
egoVehicle = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [0 0 0], ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car');

xoffset = egoVehicle.Length-egoVehicle.RearOverhang;
egoVehicle.Position = egoVehicle.Position + [xoffset 0 hgtGrndClearance];

% Place the ego 6 inches above the road
vehicleHgt = egoVehicle.Height-hgtGrndClearance;
egoVehicle.Height = vehicleHgt;

waypoints = [0 0 0;
    15 0 0];
speed = [30;30];
waittime = [0;0];

waypoints = waypoints + egoVehicle.Position;
trajectory(egoVehicle, waypoints, speed, waittime);

% Add the non-ego actors 6 inches above the road as well
car1 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [xoffset+distToFirstCar 0 hgtGrndClearance], ...
    'Height', vehicleHgt, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car1');
waypoints = [0 0 0;
    15 0 0];
speed = [30;30];
waittime = [0;0];

waypoints = waypoints + car1.Position;
trajectory(car1, waypoints, speed, waittime);

car2 = vehicle(scenario, ...
    'ClassID', 1, ...
    'Position', [xoffset+distToFirstCar+distBetweenCars+car1.Length 0 hgtGrndClearance], ...
    'Height', vehicleHgt, ...
    'Mesh', driving.scenario.carMesh, ...
    'Name', 'Car2');
waypoints = [0 0 0;
    15 0 0];
speed = [15;15];
waittime = [0;0];

waypoints = waypoints + car2.Position;
trajectory(car2, waypoints, speed, waittime);
