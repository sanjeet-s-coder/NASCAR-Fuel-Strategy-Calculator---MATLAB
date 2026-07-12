% Fuel Strategy Calculator for NASCAR Racing
% This program helps race teams determine if a race car has
% sufficient fuel to complete a race or if a pit stop is required.
% It includes input validation, additional calculations, and improved
% user feedback for better race strategy planning.


clear
clc

% Display program header
fprintf('========================================\n');
fprintf('NASCAR Fuel Strategy Calculator\n');
fprintf('========================================\n\n');

% Get user inputs for race parameters with validation
currentLap = input('Enter current lap number: ');
while currentLap < 1
    fprintf('Error: Current lap must be at least 1.\n');
    currentLap = input('Enter current lap number: ');
end

totalLaps = input('Enter total laps in race: ');
while totalLaps < currentLap
    fprintf('Error: Total laps must be greater than or equal to current lap.\n');
    totalLaps = input('Enter total laps in race: ');
end

tankCapacity = input('Enter fuel tank capacity (gallons): ');
while tankCapacity <= 0
    fprintf('Error: Tank capacity must be positive.\n');
    tankCapacity = input('Enter fuel tank capacity (gallons): ');
end

currentFuel = input('Enter current fuel level (gallons): ');
while currentFuel < 0 || currentFuel > tankCapacity
    fprintf('Error: Current fuel must be between 0 and tank capacity.\n');
    currentFuel = input('Enter current fuel level (gallons): ');
end

fuelPerLap = input('Enter average fuel consumption per lap (gallons/lap): ');
while fuelPerLap <= 0
    fprintf('Error: Fuel consumption per lap must be positive.\n');
    fuelPerLap = input('Enter average fuel consumption per lap (gallons/lap): ');
end

% Initialize variables for simulation
lapsCompleted = currentLap;
fuelRemaining = currentFuel;
lapsRemaining = totalLaps - currentLap;

% Calculate theoretical maximum laps with current fuel
maxLapsWithCurrentFuel = floor(currentFuel / fuelPerLap);

% Simulate fuel consumption lap by lap
while (lapsCompleted < totalLaps) && (fuelRemaining >= fuelPerLap)
    fuelRemaining = fuelRemaining - fuelPerLap;
    lapsCompleted = lapsCompleted + 1;
end

% Display results header
fprintf('\n========================================\n');
fprintf('FUEL STRATEGY ANALYSIS\n');
fprintf('========================================\n\n');

% Determine if pit stop is needed and display results
if fuelRemaining < fuelPerLap
    fprintf('STATUS: Fuel will run out before the race ends!\n\n');
    lapsLeft = totalLaps - lapsCompleted;
    lapsCanComplete = lapsCompleted - currentLap;
    fprintf('You can complete %d more laps before pitting.\n', lapsCanComplete);
    fprintf('Laps remaining after fuel runs out: %d\n', lapsLeft);
    
    % Calculate fuel needed for pit stop
    fuelNeededForRemaining = lapsLeft * fuelPerLap;
    fprintf('\nFuel needed at pit stop: %.2f gallons\n', fuelNeededForRemaining);
    
    % Recommend pit stop lap
    recommendedPitLap = lapsCompleted;
    fprintf('Recommended pit stop lap: %d\n', recommendedPitLap);
else
    fprintf('STATUS: You can finish the race without pitting!\n\n');
    fprintf('Fuel left at finish: %.2f gallons\n', fuelRemaining);
    fprintf('Fuel margin: %.1f laps worth\n', fuelRemaining / fuelPerLap);
end

% Display comprehensive fuel strategy summary
fprintf('\n========================================\n');
fprintf('FUEL STRATEGY SUMMARY\n');
fprintf('========================================\n');
fprintf('Starting Lap:          %d\n', currentLap);
fprintf('Total Laps:            %d\n', totalLaps);
fprintf('Laps Remaining:        %d\n', lapsRemaining);
fprintf('Tank Capacity:         %.2f gallons\n', tankCapacity);
fprintf('Starting Fuel:         %.2f gallons\n', currentFuel);
fprintf('Fuel per Lap:          %.2f gallons\n', fuelPerLap);
fprintf('Fuel Remaining:        %.2f gallons\n', fuelRemaining);
fprintf('Max Laps on Tank:      %d laps\n', maxLapsWithCurrentFuel);
fprintf('Recommendation:        ');
if (fuelRemaining < fuelPerLap)
    fprintf('PIT REQUIRED\n');
else
    fprintf('NO PIT NEEDED\n');
end
fprintf('========================================\n');

