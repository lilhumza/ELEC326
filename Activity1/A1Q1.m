% ELEC 326 Activity 1 Q1

% Initialize a matrix of dice values with range 1-6
x = 1:6;

% Initialize a count for number of rolls for a die
N = 1000000;

% Initialize a count for number of dice
NUM_DICE = 3;

% ---- Plot of baseline PMF of x - Q1PART1 ----

% Baseline PMF for a fair Dice Roll - 1/6 for Die
PMF_x = 1 / length(x) * ones(1, length(x));

% Plot Specifications
fig = figure('Name', 'PMF of x');
stem(x, PMF_x, 'b', 'LineWidth', 1.5);
title('Probability Mass Function of x');
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'x';
ax.XLim = [0, numel(x)+1];
ax.YLabel.String = 'P(x)';

% ---- Plot of baseline PMF of y - Q1PART1 ----

% Use combvec to get all combinations for 3 dice and sum of combinations
y = sum(combvec(x, x, x));

% Sort the results so they are ordered 3-18
y = sort(y);

% Count the number of times a unique number is in y
[y, ~, counts] = unique(y);
counts = accumarray(counts, 1);

% Calculate PMF_y by dividing the counts for each index by the sum
PMF_y = counts / sum(counts);
PMF_y = reshape(PMF_y, 1, []); % Reposition the data such that the row is occupied not column

% Plot Specifications
fig = figure('Name', 'PMF of y');
stem(y, PMF_y, 'b', 'LineWidth', 1.5);
title('Probability Mass Function of y');
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'y';
ax.XLim = [0, 21];
ax.YLabel.String = 'P(y)';

% ---- Plot of CDF of x - Q1PART2 ----

% Determine CDF_ using cumulative sum of PMF_x at correpsonding index
CDF_x = cumsum(PMF_x);

% Plot Specifications
fig = figure('Name', 'CDF of x');
stairs([0, x numel(x)+1], [0 CDF_x 1], 'b', 'LineWidth', 1.5);
title('Cumulative Distribution Function of x');
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'x';
ax.XLim = [0, numel(x)+1];
ax.YLabel.String = 'F(x)';

% ---- Plot of CDF of y - Q1PART2 ----

% Determine CDF_y using cumulative sum of PMF_y at correpsonding index
CDF_y = cumsum(PMF_y);

% Plot Specifications
fig = figure('Name', 'CDF of y');
stairs([0 y 20], [0 CDF_y 1], 'r', 'LineWidth', 1.5);
title('Cumulative Distribution Function of y');
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'y';
ax.XLim = [0, 20];
ax.YLabel.String = 'F(y)';


% ---- Roll dice N times and store - Q1PART3 ----

% Initialize 3 Dice to retrieve Random Num from "Roll" via rand_gen
x1 = rand_gen(x, PMF_x, N);
x2 = rand_gen(x, PMF_x, N);
x3 = rand_gen(x, PMF_x, N);

% Store sum in y
y = x1 + x2 + x3;

% ---- Plot of count for each time a unique roll occurs in x - Q1PART4 ----

% Count the number of  times each unique number occurrs in each die
H1 = histcounts(x1, [x, x(end) + 1]);
H2 = histcounts(x2, [x, x(end) + 1]);
H3 = histcounts(x3, [x, x(end) + 1]);

% Plot Specifications
fig = figure('Name', ['Cumulative Sum of Unique Dice Rolls from ', num2str(N), ' rolls']);
stem(x, H1, 'b', 'LineWidth', 1.5);
hold on;
stem(x, H2, 'r', 'LineWidth', 1.5);
stem(x, H3, 'g', 'LineWidth', 1.5);
hold off;

title(['Sum of Unique Dice Rolls - N=', num2str(N)]);
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'Number Rolled';
ax.XLim = [0, numel(x)+1];
ax.YLabel.String = 'Aggregate Count';
legend('H1', 'H2', 'H3', 'FontSize', 12, 'Location', 'SouthEast');

% If we divide H1 H2 H3 by N, the probability of the vent occuring is what is determined.

% ---- Plot of count for each time a unique roll occurs in y - Q1PART5 ----
H = histcounts(y, 1:19);

% Plot Specifications
fig = figure('Name', ['Unique Combinations from ', num2str(N), ' rolls']);
stem(H, 'b', 'LineWidth', 1.5);

title(['Sum of Unique Combinations - N=', num2str(N)]);
set(gca, 'FontSize', 12);
ax = gca;
ax.XLabel.String = 'Dice Combinations';
ax.XLim = [0, 20];
ax.YLabel.String = 'Aggregate Count';




