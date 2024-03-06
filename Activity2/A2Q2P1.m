% ELEC 326 Activity 2 Q2P1

% load RV data
load("RV1.mat");
load("RV2.mat");
load("RV3.mat");
%---------------------------------------------
%convert data from struct to double
%compress all the data into one variable for easy access
data_row = [RV1(1,:); RV2(1,:); RV3(1,:)];
%---------------------------------------------
% joint PMF of RV1 RV2 and RV1 RV3
jointPMF_12 = hist3(data_row([1,2],:)', 'Edges', {unique(data_row(1,:)), unique(data_row(2,:))}) / numel(data_row(1,:));
jointPMF_13 = hist3(data_row([1,3],:)', 'Edges', {unique(data_row(1,:)), unique(data_row(3,:))}) / numel(data_row(1,:));

%---------------------------------------------
%plots of the joint PMF fucntions

%RV1 and RV2
figure;
surf(unique(data_row(1,:)), unique(data_row(2,:)), jointPMF_12');
title('Joint PMF of RV1 and RV2');
xlabel('RV1');
ylabel('RV2');
zlabel('Probability');

%RV1 and RV3
figure;
surf(unique(data_row(1,:)), unique(data_row(3,:)), jointPMF_13');
title('Joint PMF of RV1 and RV3');
xlabel('RV1');
ylabel('RV3');
zlabel('Probability');