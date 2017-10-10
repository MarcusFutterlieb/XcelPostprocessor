clear all;
close all;
clc;

%loop variables
loop_counter    = 0;
result_counter  = 0;
element_name    = '';



%% Import the data
[~, ~, raw] = xlsread('test.xlsx','Sheet2');
results = raw(:,7);
ordno   = raw(:,1);
element = raw(:,5);


%% control vector
check = {'Inorganic Carbon (IC)';'Total Carbon (TC)';'und so weiter'};

%% build unique result matrix
unique_elements{1,1} = element{1};
for (i=2:1:size(element,1))
    detection_flag = false;
    for(j=1:1:size(unique_elements,1))
        if(strcmp(unique_elements{j,1},element{i})==true)
            detection_flag = true;
        end%if
    end%for  
    if (detection_flag ==false)
        unique_elements{end+1,1} = element{i};
    end%if
end%for



%% find mean of results and save them
for (i=1:1:size(check,1))
    loop_counter    = 0;
    result_counter  = 0;
    index_element = strfind(element, check{i});%search (where,what)
    for(j=1:1:size(index_element,1))
        if(isempty(index_element{j})==false)
            display(j);
            display(i);
            if(loop_counter==0)
                result_counter = results{j};
                loop_counter = 1;
                element_name = element{j};
            else
                result_counter(end+1) = results{j};
                loop_counter = loop_counter + 1;
            end%if
        else
            %continue because string was not found
        end%if
    end%for
    if (loop_counter>0)
        for(h=1:1:size(unique_elements,1));
            if(strcmp(unique_elements{h,1},element_name))
                unique_elements{h,2} = mean(result_counter);
                %etc
                %unique_elements{h,3} = somethingElse(result_counter);
            end%if
        end%for
    end%if
end%for

