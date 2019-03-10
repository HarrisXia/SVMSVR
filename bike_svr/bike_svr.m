clear all;
clc
load 'data.csv';
%% parameter seting
%num of testset samples
n = 35;
%cross validation parts
cross_parts = 10;

%% data pretreatment
%[data_m,data_n]=size(data);
%weights = zeros(13,1);
for i = 1:13
    %R = data(:,i);
    %weights(i,1) = entropy_weight(R);
    outlier_feature =  find_outliers(data(:,i));
    [outs,~]=size(outlier_feature);
    [outlier_feature,I] = sort(outlier_feature);
    outlier_feature = flipud(outlier_feature);
    %delete strange datas
    for k =1: outs
        outsample = outlier_feature(k,1);
        data(outsample,:)=[];
    end
    data_ori = data;
    data_norm = data';
    %feature data normalization
    data_norm= mapminmax(data_norm, 0, 1);
end
data = data_norm';
data(:,14) = data_ori(:,14);
%delete redundant features
del_features = {2,6};
for i = 1:length(del_features)
    feature = del_features{i};
    data(:,feature)=[];
end

%% dataset random spliting
[data_m,data_n]=size(data);
MSEsum = 0;
SCCsum = 0;
idx=randperm(data_m);
idx=idx(1:n);
%testset selecting
testset=data(idx,:);
%trainset selecting
trainset=data;
trainset(idx,:)=[];
train_y = trainset(:,14-length(del_features)) ;
train_x = trainset(:,1:13-length(del_features));
test_y = testset(:,14-length(del_features)) ;
test_x = testset(:,1:13-length(del_features));

%% cross-validation SVR
%Randomly dividing the data sample into determined parts
indices = crossvalind('Kfold', data_m - n, cross_parts);
 %train looping
for i = 1:cross_parts
    val = (indices == i);
    train = ~val;
    train_Data = train_x(train, :);
    val_Data = train_x(val, :);
    train_target=train_y(train,:);
    val_target=train_y(val,:);
    % nu-SVR regression
    % linear kernel
    m = svmtrain(train_target, train_Data, '-s 4 -t 0 -c 80');
    [predict_label, accuracy, prob_estimate] = svmpredict(test_y, test_x, m);
    MSEsum = MSEsum + accuracy(2,1);
    SCCsum = SCCsum + accuracy(3,1);
end
MSE = MSEsum/cross_parts; 
SCC = SCCsum/cross_parts; 
% show evaluation metrics
fprintf('Cross MSE = %.2f.\n', MSE); 
fprintf('Cross SCC = %.2f.\n', SCC); 

%% Visualization
plot(test_y,'-d','LineWidth',2);
hold on
plot(predict_label,'r-*','LineWidth',2);
legend('label bikes','predict bikes');
title('TestSet Regression Predict by SVR');
grid on;