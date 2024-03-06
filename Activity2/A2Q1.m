% ELEC 326 Activity 2 Q1

% ---- Plot of PMF and CDF of xy - Q1PART1 ----

% Initialize x and y values in respective range
x = [0, 1];
y = [0, 1];

% Initialize a two dimensional matrix for PMF
% first index -> y=0, second index -> y=1
PMF_joint = [0.25, 0.125; 0.5, 0.125];

% Plot Specifications
fig = figure('Name', 'Joint PMF of xy');
stem3(x, y, PMF_joint, 'b', 'LineWidth', 1.5);
title('Joint Probability Mass Function of xy');
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'X';
ax.XLim = [0, 1];
ax.YLabel.String = 'Y';
ax.YLim = [0, 1];
ax.ZLabel.String = 'P(x,y)';
ax.ZLim = [0, 1];

% Given smaller size of matrix, find CDF with cumsum
CDF_joint = cumsum(cumsum(PMF_joint, 1), 2);

% Plot Specifications
fig = figure('Name', 'Joint CDF of xy');
stem3(x, y, CDF_joint, 'b', 'LineWidth', 1.5);
title('Joint Cumulative Distribution Function of xy');
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'X';
ax.XLim = [0, 1];
ax.YLabel.String = 'Y';
ax.YLim = [0, 1];
ax.ZLabel.String = 'F(x,y)';
ax.ZLim = [0, 1];

% ---- Generating N = 100000 realizations of xy - Q1PART2 ----

% Define value of N
N = 100000;

% Initialize matrix XY 2x10000 for xy
XY = zeros(2, N);

% Generate N times the values for x y assignment across interval {0, 1}
randomNumber = rand(1,N);

% Assign respective xy values to XY

for n = 1:N
    % X=0 Y=0 -> PMF=0.25 [0, 0.25]
    if randomNumber(n) <= 0.25
        XY(:, n) = [0; 0];
    % X=0 Y=1 -> PMF=0.50 (0.25, 0.75] -> 0.75=0.25+0.50  
    elseif randomNumber(n) > 0.25 && randomNumber(n) <= 0.75 
        XY(:, n) = [0; 1];
    % X=1 Y=0 -> PMF=0.125 (0.75, 0.875] -> 0.875=0.75+0.125
    elseif randomNum(n) > 0.75 && randomNum(n) <= 0.875 
        XY(:, n) = [1; 0];
    % X=1 Y=1 -> PMF=0.125 (0.875, 1]
    elseif randomNum(n) >= 0.875 
        XY(:, n) = [1; 1];
    end
end

% ---- Plot PMF of xy with N = 100000 - Q1PART2 ----

% Initialize a 2 dimensional matrix
H = zeros(2, 2);

% Use the sum functionality to filter XY into H
H(1,1) = sum(XY(1, :) == 0 & XY(2, :) == 0);
H(1,2) = sum(XY(1, :) == 0 & XY(2, :) == 1);
H(2,1) = sum(XY(1, :) == 1 & XY(2, :) == 0);
H(2,2) = sum(XY(1, :) == 1 & XY(2, :) == 1);

% Divide by number of trials to bring it back to an averaged trial space
PMF_joint = H / N;

% To use for in assignment writeup when comparing values
disp('PMF Joint for N realizations:')
disp(PMF_joint);

% Plot Specifications
fig = figure('Name', ['Joint PMF of xy - N=', num2str(N)]);
stem3([0,1], [0,1], PMF_joint, 'b', 'LineWidth', 1.5);
title(['Joint Probability Mass Function of xy - N=' num2str(N)]);
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'X';
ax.XLim = [0, 1];
ax.YLabel.String = 'Y';
ax.YLim = [0, 1];
ax.ZLabel.String = 'P(x,y)';
ax.ZLim = [0, 1];

% PMF Data from an execution (x,y): 
% (0,0): 0.2497    (0,1): 0.5001
% (1,0): 0.1246    (1,1): 0.1256

% PMF Data provided from assignment (x,y): 
% (0,0): 0.25    (0,1): 0.5
% (1,0): 0.125    (1,1): 0.125

% What is seen is a very close resultant outcome in comparison to the
% provided data, moreover being a sucessful validation of the overall PMF,
% what can be seen is minor difference often in the magnitude of the
% thousandths which is very much expected. To remediate the difference, a larger N should be used.

% ---- Marginal PMF's of xy with N = 100000 - Q1PART4 ----

% Isolate via the sum of each row in PMF matrix for x
PMF_x = sum(PMF_joint, 2)';

% Isolate via the sum of each column in PMF matrix for y
PMF_y = sum(PMF_joint, 1);

% To use for in assignment writeup when comparing values
disp('Marginal PMFs for N realizations:')
disp(PMF_x);
disp(PMF_y);

% Marginal PMF Data from an execution:
% PMF_x:
% (x=0): 0.7511    (x=1): 0.2489
% PMF_y:
% (y=0): 0.3729    (y=1): 0.6271

% What can be seen is the probabilities of each event regardless of the
% other in other words the individual respective events in comaprison to
% the provided PMF of the group events. The probabilities are relatively
% varying in regards to the individual events as the individual values
% occur across many permutations but are considered individually in the
% context.




