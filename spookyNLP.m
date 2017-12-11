%% Testing file for NPL, will remove push soon.
% You'll want to have matlabNLP installed for later portions.

% read in file, set training data to td
filename = 'train.csv';
file = readtable(filename);
td = table2array(file);

% Shorten td to reasonable size, can remove later
% td = td(1:10000,:);

% From here juniors thing says to break up according to each auther, 

[n,m] = size(td);

eap_occurance = 0;
hpl_occurance = 0;
mws_occurance = 0;
for i = 1:n
    if strcmp(td(i,3),'EAP')
        eap_occurance = eap_occurance + 1;
    elseif strcmp(td(i,3),'HPL')
        hpl_occurance = hpl_occurance + 1;
    elseif strcmp(td(i,3),'MWS')
        mws_occurance = mws_occurance + 1;
    else
        fprinf('Didnt work on line %i\n', i);
    end
end

% This total should now equal n
if (n == (eap_occurance + hpl_occurance + mws_occurance))
    fprintf('number of names categorized correctly.\n');
end

%% Categorizing their text
% now that we have the size of each required array, we can enter each word
% into an array for the three authors, and then compare them directly that
% way.
% 
% Recall our end game is we want to calculate the weights, so w = X\y, and
% X will be a matrix of the given words/sentences, while y will be the
% estimate for each author.
% 
% Another way to write this is that X would be the number of times a word
% comes up in a sentence, so that times a weight would be the likelihood of
% it being a specific author.
% 
% <an author> = <freq of word per sentence> * <likelihood it's an author>
% 
% So we would see X as perhapse a large matrix, where each row is a
% different sentence, each column is the rate at which a word shows up, and
% each row in the w is the weight for the corrisponding word column in the
% X matrix. From here we produce a y matrix, this y matrix will be a column
% with a height equal to the number of sentences, where each sentence is a
% weight.
% 
% So to get X this will be the size of sentences I have, and each word will
% be placed in the following col, O(NM) time.
% 
% WORDS CHOSEN BELOW ARE LARGELY ARBITRARY, I HAVE NOT FOUND THE OPTIMAL
% WORDS YET, I'M NOT SURE HOW TO DO THIS YET HOwever I think a certain
% degree of it is intuitive, and the rest is I'll just grab a bunch of
% popular words, and I'll make a matrix that is easy to change size to calc
% the words. I will add that it was heavlily influenced by the .xlsx shhet
% from spooky.m
% 
% Through trial and error we've found that using things like nouns or names
% can skew sentence's significantly, even though some authors are knows to
% use certain names or things more frequently than others.

words = {'ascertain','lay','my','surcingle','hand','thus','to','nor','subject','suffer','and','love','pain','dark','the',';','you'};
% {} break it into strings or cells
[wn,wm] = size(words);

data = zeros(wm,n);
% Need to collect word data for 100 sentences
for i = 1:wm
    for j = 1:n
        wordLoc = strfind(td{j,2}, words{i});
        data(i,j) = length(wordLoc);
    end
end

% I accidentally built this upsidown, remove transpose later and fix algo
X = transpose(data);

% Now we must build the y matrix, it would be best to incorperate this in
% with the above algo later on, though the O(N^2) time complexity remains
% the same.
y = zeros(n,1);
for i = 1:n
    if (length(strfind(td{i,3}, 'EAP')) >= 1)
        y(i,1) = +1;
    else
        y(i,1) = -1;
    end
end

% So we can build the weight setup as 
w = X\y;

% And then we'll test it for EAP in the next 10 matricies

%% Testing on small sample set

test = table2array(file);
test = test(10000:10999,:);
n = length(test);

% We need to set up the environment by copying and pasting the code from
% above but with test
X_test = zeros(wm,n);
for i = 1:wm
    for j = 1:n
        wordLoc = strfind(test{j,2}, words{i});
        X_test(i,j) = length(wordLoc);
    end
end

X_test = transpose(X_test);

% So the predicted vector is 
y_hat = X_test*w;

% And we can compare this to the expected output, so 
y_expected = zeros(n,1);
for i = 1:n
    if (length(strfind(test{i,3}, 'EAP')) >= 1)
        y_expected(i) = +1;
    else
        y_expected(i) = -1;
    end
end

% and to test it to see easily how many were right
vals = zeros(20,2);
for i = 1:n
    vals(i,1) = y_hat(i);
    vals(i,2) = y_expected(i);
end

% sum up right answers 
sum = 0;
for i = 1:n
    if (sign(vals(i,1)) == sign(vals(i,2)))
        sum = sum + 1;
        vals(i,1);
        vals(i,2);
    end
end

fprintf('There were %i right answers out of %i\n', sum, n);

%% Lasso use

[B, FitInto] = lasso(X,y);

plot(B)



















%% References
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
