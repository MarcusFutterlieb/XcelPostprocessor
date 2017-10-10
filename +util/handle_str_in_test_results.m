clear all;
close all;
clc;

pair_j = 0;
pair_jPlus1 = 1;
current_id = 0;


%% Import the data
[~, ~, raw] = xlsread('Test_Matlab.xlsx','Sheet1');
results = raw(:,8);
ordno   = raw(:,2);
element = raw(:,7);

%what is my first pair
tmp         = ordno{2};
tmp         = tmp(end-1:end);
pair_j      = str2num(tmp);
pair_jPlus1 = pair_j + 1;
current_id  = 2;

% loop through ordno
for (i=3:1:size(ordno,1))
    tmp = ordno{i};
    tmp = tmp(end-1:end);
    if(str2num(tmp) == pair_jPlus1)
        if(strcmp(element(current_id),element(i)))
            % found the same element
            % check if resaults is a number 
            % reset----*--start
            display(i);
            i = 3;
            current_id = current_id + 1;
            
            % reset----*--finished
            
        else
            %continue search
        end%if
    else
    end%if
    
    
end%for

