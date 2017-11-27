filename='train.csv';
trainDataTable = readtable(filename);
trainDataArray = table2array(trainDataTable);

% 15 features composed of 3 different data types, each containing 5 entries
% counting the frequency for each data element
% 1.Want to find words that only each author uses (compare word to other 2
% authors)
% and words that they use 2.frequently and 3.infrequently

%split at whitespace
[length,~] = size(trainDataArray);
EAP = [];
HPL = [];
MWS = [];
for i = 1:length
    str = string(trainDataArray(i,2));
    disp('Huge Array Index' + length-i);
    %remove punctuation
    strn = regexprep(str,'[!@#$%^&*():;",.?<>/'']','');
    
    if(strcmp(trainDataArray(i,3), 'EAP') == 1)
        EAP = [EAP lower(strsplit(strn))];
    elseif(strcmp(trainDataArray(i,3), 'HPL') == 1)
        HPL = [HPL lower(strsplit(strn))];
    else
        MWS = [MWS lower(strsplit(strn))];
    end
end

[~,lengthEAP] = size(EAP);
[~,lengthHPL] = size(HPL);
[~,lengthMWS] = size(MWS);

%Create unique vector with no repreating words, frequency data to be added
%later on
EAP_Final = unique(EAP);
if(EAP_Final(1) == '' || EAP_Final == ' ')
   EAP_Final =  EAP_Final(2:end);
end
[~,lengthEAP_Final] = size(EAP_Final);
EAP_Final = [EAP_Final;zeros(1,lengthEAP_Final);zeros(1,lengthEAP_Final);zeros(1,lengthEAP_Final)];

EAP = [EAP;zeros(1,lengthEAP);zeros(1,lengthEAP);zeros(1,lengthEAP)];
cmpEAP = [HPL MWS];
disp('Calculations Begin');
for j = 1:lengthEAP
    EAP(2,j) = sum(EAP(1,:) == EAP(1,j))/lengthEAP;
    EAP(3,j) = sum(cmpEAP(1,:) == EAP(1,j))/(lengthHPL + lengthMWS);
    numer = str2double(EAP(2,j));
    denom = str2double(EAP(3,j));
    if(denom == 0)
        EAP(4,j) = -1;
    else
        EAP(4,j) = numer/denom;
    end
end
disp('Calculations End');

% Now that we have the frequency within it is time to look at the frequency
% of a word one author uses relative to the other two authors. 
% This fiqure is calculated by dividing the number of occurences of the word divided by
% the number of elements nthe other two authors
% Last figure is the frequency within divided by the frequency in others

disp('Formatting begins');
%format the lists
for i = 1:lengthEAP_Final
    disp('format-outer ' + lengthEAP_Final-i);
   for j = 1:lengthEAP
       disp('format-inner ' + lengthEAP-j);
       if(EAP_Final(1,i) == EAP(1,j))
           EAP_Final(2,i) = EAP(2,j);
           EAP_Final(3,i) = EAP(3,j);
           EAP_Final(4,i) = EAP(4,j);
           break
       end
   end
end
disp('Formatting Ends');
