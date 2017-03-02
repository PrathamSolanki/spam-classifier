clear all; clc; history -c

%% ================== Train Linear SVM for Spam Classification ================

% Train only if the already trained model file is not present 
if (fopen('model.mat') == -1)
	load('../../Data/spamTrain.mat');

	fprintf('\nTraining Linear SVM (Spam Classification)\n')
	fprintf('(this may take 1 to 2 minutes) ...\n')

	C = 0.1;
	model = svmTrain(X, y, C, @linearKernel);
	save model.mat model

	p = svmPredict(model, X);
	fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

% Else load the trained model
else
	load('model.mat')
endif

%% =================== Predicting========================= =====================

[filename, filepath, ~] = uigetfile ({'*.txt', 'Supported Picture Formats'});
file_contents = readFile(strcat(filepath,filename));
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');
clear all;
