clear
clc
load('train_lbp.mat');
load('train_lbp_target.mat');


M1 = svmtrain(traintarget,trainlbp, '-s 0 -t 2 -c 450 -g 0.5 ');




load('test_lbp.mat');
load('test_lbp_target.mat');



[predicted_label] = svmpredict(testlbptarget, testlbp, M1, 'libsvm_options');

PRED=predicted_label;
fig = figure;
cm = confusionchart(testlbptarget,PRED,'RowSummary','row-normalized');
fig_Position = fig.Position;
fig_Position(3) = fig_Position(3)*2;
fig.Position = fig_Position;



