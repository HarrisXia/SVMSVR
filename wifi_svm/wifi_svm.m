clear all
clc
load 'wifi.txt';
%load 'data.txt';
%% parameter seting
%num of testset samples
n = 149;
%cross validation parts
cross_parts = 10;
%% data pretreatment
data_ori = wifi;
data = wifi;
%feature data normalization
for i = 1:4
    data_norm = data';
    data_norm= mapminmax(data_norm, 0, 1);
end
data = data_norm';
data(:,8) = data_ori(:,8);
%% dataset random spliting
accuracysum = 0;
idx=randperm(2000);
idx=idx(1:n);
%testset
testset=data(idx,:);
%trainset
trainset=data;
trainset(idx,:)=[];
train_y = trainset(:,8) ;
train_x = trainset(:,1:7);
%% cross-validation SVM
%Randomly dividing the data sample into determined parts
indices = crossvalind('Kfold', 2000 - n, cross_parts);
%train looping
for i = 1:cross_parts 
    val = (indices == i);
    train = ~val;
    train_Data = train_x(train, :);
    val_Data = train_x(val, :);
    train_target=train_y(train,:);
    val_target=train_y(val,:);
    m = svmtrain(train_target, train_Data, '-s 1 -t 0 -c 200');
    % nu-SVC multi-classification
    % linear kernel
    test_y = testset(:,8) ;
    test_x = testset(:,1:7);
    [predict_label, accuracy, prob_estimate] = svmpredict(test_y, test_x, m);
    accuracysum = accuracysum + accuracy(1,1);
end
accuracies = accuracysum/cross_parts; 
% show evaluation metrics
fprintf('Cross Mean Accuracy = %.2f%%.\n', accuracies); 
%% Visualization
labels = test_y;
no_dims = 2;
initial_dims = 8;
perplexity = 30;
% t-sne dimensionality reduction
ans_map = tsne(testset, predict_label, no_dims, initial_dims, perplexity);
gscatter(ans_map(:,1), ans_map(:,2), labels);
title('TestSet Classification by SVM Visualization');