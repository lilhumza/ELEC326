% ELEC 326 Activity 2 Q2P2

% Load RV data
load("RV1.mat");
load("RV2.mat");
load("RV3.mat");
%------------------------------------------
% Convert data from struct to double and compress into one variable
data_row = [RV1(1, :); RV2(1, :); RV3(1, :)];
%------------------------------------------
% Calculate correlation coefficients
corr_RV1_RV2 = corrcoef(data_row(1, :), data_row(2, :));
corr_RV1_RV3 = corrcoef(data_row(1, :), data_row(3, :));
%------------------------------------------
% Display correlation coefficients
disp(['Correlation between RV1 and RV2: ', num2str(corr_RV1_RV2(1, 2))]);
disp(['Correlation between RV1 and RV3: ', num2str(corr_RV1_RV3(1, 2))]);