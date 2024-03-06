% ELEC 326 Activity 1 Q2P2


H1 = zeros(1, 101); 
H2 = zeros(1, 101);
H3 = zeros(1, 101);
%Creates the plots

i = 1;
while i <= length(RV1)

    H1(RV1(i) + 1) = H1(RV1(i) + 1) + 1; % Counts Repetetion of Each Value for RV1
   
    H2(RV2(i) + 1) = H2(RV2(i) + 1) + 1; % Counts Repetetion of Each Value for RV2
    
    H3(RV3(i) + 1) = H3(RV3(i) + 1) + 1; % Counts Repetetion of Each Value for RV2
    i = i + 1;
    
end

% Divides by the number of values (1000000)
H1 = H1 / 1000000; 
H2 = H2 / 1000000;
H3 = H3 / 1000000;

% Creates 3 subplots
figure;
subplot(3, 1, 1);
bar(0:100, H1, 'r');
title('Plot of RV1');
xlabel('Number');
ylabel('Probability');

subplot(3, 1, 2);
bar(0:100, H2, 'g');
title('Plot of RV2');
xlabel('Number');
ylabel('Probability');

subplot(3, 1, 3);
bar(0:100, H3, 'b');
title('Plot of RV3');
xlabel('Number');
ylabel('Probability');