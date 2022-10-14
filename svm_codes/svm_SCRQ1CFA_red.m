clear
clc
load('TRAINING_FET_ALL.mat');
load('TR_label.mat');
TR_1=s3_minmax22c_q1;
TR_2=s3_minmax34hvc_q1;
%TR_3=s1_minmax22c_q1;
%TR_4=s1_minmax34hvc_q1;
TR_5=s2_minmax24c_q1;
%TR_7=s3_minmax48c_q1;
TR_8=s3x3_minmax22c_q1;

TR_FET=[TR_1 TR_2 TR_5 TR_8];

TR_label=TR_label(:,1); % 1 for model 2 for device
M1 = svmtrain(TR_label,TR_FET, '-s 0 -t 2 -c 300 -g 0.9 -v 5'); 

load('TESTING_FEATURE_ALL.mat');
load('TESTING_LABEL.mat');
TS_1=s3_minmax22c_q1;
TS_2=s3_minmax34hvc_q1;
%TS_3=s1_minmax22c_q1;
%TS_4=s1_minmax34hvc_q1;
TS_5=s2_minmax24c_q1;
%TS_7=s3_minmax48c_q1;
TS_8=s3x3_minmax22c_q1;


TEST_FET=[TS_1 TS_2 TS_5 TS_8];

TEST_label=TEST_label(:,1);% 1 for model 2 for device

[predicted_label] = svmpredict(TEST_label, TEST_FET, M1, 'libsvm_options');

PRED=predicted_label;
fig = figure;
cm = confusionchart(TEST_label,PRED,'RowSummary','row-normalized');
fig_Position = fig.Position;
fig_Position(3) = fig_Position(3)*2;
fig.Position = fig_Position;



