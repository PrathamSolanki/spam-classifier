path = 'Emails/Non-Spam/easy_ham/';

count = 1;

for i = 1:1000
	filename = strcat(path,num2str(i),'.txt');
	file_contents = readFile(filename);
	word_indices  = processEmail(file_contents);
	X(:,count)        = emailFeatures(word_indices);
	y(count,:)	      = 0;
	count++;
end

path = 'Emails/Spam/spam/';
for j = 1:500
	filename = strcat(path,num2str(j),'.txt');
	file_contents = readFile(filename);
	word_indices  = processEmail(file_contents);
	X(:,count)      = emailFeatures(word_indices);
	y(count,:)      = 1;
	count++;
end

path = 'Emails/Spam/spam (2)/';
for k = 1:500
	filename = strcat(path,num2str(k),'.txt');
	file_contents = readFile(filename);
	word_indices  = processEmail(file_contents);
	X(:,count)      = emailFeatures(word_indices);
	y(count,:)      = 1;
	count++;
end

X = X';
save 'train.mat' [X, y];

clear path count i j k ans filename file_contents word_indices 
	
