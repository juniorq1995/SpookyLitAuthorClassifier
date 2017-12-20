function percentage = isAuthors(sentences, words, w, y_expected)
    sizen = length(sentences)
    tmp = zeros(1,sizen);
    
%     tmp_cell = sentences';
%     sentences = cell(50,3);
%     sentences(:,2) = tmp_cell;
    size(sentences)
%     
%     sentences{1:5,2};
    
    for i = 1:sizen
       % we run the function on each sentence
%        i
%        sentences{i,:}
       tmp(i) = isAuthor(words, cell2mat(sentences{i,2}), w);
    end
    
    tmp(1:5)
    
    newSum = 0;
    denom = 0;
    for i = 1:sizen;
        denom = denom + 1;
        if (sign(y_expected(i)) == sign(tmp(1,i)))
            newSum = newSum + 1;
        end
    end
    
    percentage = newSum/denom;

%     sizen = length(sentences);
%     tmp = zeros(1,sizen);
%     for i = 1:sizen
%        % we run the function on each sentence
%        tmp(i) = isAuthor(words, sentences(i,:), w);
%     end
% 
%     newSum = 0;
%     denom = 0;
%     for i = 1:sizen;
%         denom = denom + 1;
%         if (sign(y_expected(i)) == sign(tmp(1,i)))
%             newSum = newSum + 1;
%         end
%     end
%     
%     percentage = newSum/denom;
end