path = '../../Data/Emails/Non-Spam/non-spam-';

count = 1;

for i = 1:6952
	filename      = strcat(path,num2str(i),'.txt');
	file_contents = readFile(filename);
	word_indices  = processEmail(file_contents);
	X(:,count)    = emailFeatures(word_indices);
	y(count,:)    = 0;
	count++;
end

path = '../../Data/Emails/Spam/spam-';
for j = 1:3796
	filename      = strcat(path,num2str(j),'.txt');
	file_contents = readFile(filename);
	word_indices  = processEmail(file_contents);
	X(:,count)    = emailFeatures(word_indices);
	y(count,:)    = 1;
	count++;
end

X = X';
save '../../Data/newSpamTrain.mat' [X, y];

clear path count i j ans filename file_contents word_indices 
	
