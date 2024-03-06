% ELEC 326 Activity 1 Q2P1

load('RV1_1.mat');
r1=RV1(1,:); %load RV1
sum1=0;
for i1=1:length(r1)
  sum1=sum1+r1(i1);
end
mean1=sum1/length(r1); %the mean for RV1
%---------------------------------------------
sumV1=0;
for i=1:length(r1)
    sumV1=sumV1+ (r1(i)-mean1)^2;
end
V1=sumV1/length(r1); %variance for RV1
%---------------------------------------------
load('RV2.mat');
r2=RV2(1,:);
sum2=0;
for i2=1:length(r2)
  sum2=sum2+r2(i2);
end
mean2=sum2/length(r2); %the mean for RV2
%---------------------------------------------
sumV2=0;
for i=1:length(r2)
    sumV2=sumV2+ (r2(i)-mean2)^2;
end
V2=sumV2/length(r2); %variance for RV2
%---------------------------------------------
load('RV3.mat');
r3 = RV3(1,:);
sum3=0;
for i3=1:length(r3)
  sum3=sum3+r3(i3);
end
mean3=sum3/length(r3); %the mean for RV3
%---------------------------------------------
sumV3=0;
for i=1:length(r3)
    sumV3=sumV3+ (r3(i)-mean3)^2;
end
V3=sumV3/length(r3); %variance for RV3