filename='train.csv';
trainDataTable = readtable(filename);
trainDataArray = table2array(trainDataTable);

% find features by taking the top 5 or 10 words each author uses and
% counting the frequency for each data element
