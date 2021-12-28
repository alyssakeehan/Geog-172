%{
Question 1
%}
usedata = readtable('ithaca.dat');
help who, whos
help size
size(ithaca)
%{
In my Workspace, I currently have just two variables and its the table ithaca 
and the variable usedata that I assigned to the ithaca dataset. The dimensions 
of the ithaca data matrix is 31x4. There are 4 variables and 31 observations
in the data set.
%}

%{
Question 2
%}
oldprecip = ithaca(:,2);
precip = table2array(oldprecip); % convert the table to an array
numel(precip)
%{
There are 31 elements in the array precip. 
%}
jan_1 = precip(1,1); % the first element corresponds to the first day
jan_1 % The precipitation from January 1 is 0 inches.
jan_11 = precip(11,1);
jan_11 % The precitipation from January 11 is 0.34 inches
jan_10_15 = precip(10:15,1);
jan_10_15 % The precipitation from January 10 - 15 are [0.05,0.34,0.06,0.18,0.02,0.02] inches.
first_five_min = min(precip(1:5,1));
first_five_min % The minimum precipitation of the first 5 days of the period is 0 inches.
first_five_max = max(precip(1:5,1));
first_five_max % The maximum precipitation of the first 5 days of the period is 1.11 inches.
last_five_min = min(precip(length(precip)-4:length(precip),1));
last_five_min % The minimum precipitation of the last 5 days of the period is 0 inches.
last_five_max = max(precip(length(precip)-4:length(precip),1));
last_five_max % The maximum precipitation of the last 5 days of the period is 0.05 inches.
%{
Create a variable to represent the value of the highest preciptation
%}
max_precip = max(precip);
%{
retrieve the position of the max precipitation which is also the date
%}
[max_row, max_col] = find(precip == max_precip);
max_row % The day with the maximum precitipation value is January 3rd with the value of 1.11 inches.

%{
Question 3
%}
ithaca.wet = precip > 0; % Create a new variable that displays wetness
wet_days = find(ithaca.wet > 0);
wet_days % The days of this time period that are wet are 2,3,8,9,10,11,12,13,14,15,20,23,29,30,31.
[num_wet_days, one] = size(wet_days);
num_wet_days % There are 15 wet days over the time period.
prop_wet = mean(ithaca.wet);
prop_wet % The probability of a wet day occurence is 0.4839.

%{
Question 4
%}
% i. mean
sum(precip)/length(precip) % The mean precipitation is 0.1016 inches.
mean(precip) % We get the same value of 0.1016 inches when using the Matlab-derived function.
% ii. variance
(sum((precip - mean(precip)).*(precip - mean(precip))))/(length(precip) - 1) % The variance of precitipation is 0.0590 inches squared.
var(precip) % Using the Matlab-derived function, we get the same value of 0.0590 inches squared.
% iii. standard deviation
sqrt((sum((precip - mean(precip)).*(precip - mean(precip))))/(length(precip) - 1)) % The standard deviation of precitipation is 0.2429 inches.
std(precip) % We get the same value of a precitipation of 0.2429 with the matlab derived function.
% iv. coefficient of variation
cov = std(precip)/mean(precip);
cov % Our coefficient of variation is 2.390314.
% v. mean absolute deviation from the mean
sum(abs(precip - mean(precip)))/length(precip) % Our Mean Absolute Deviation from the mean is 0.1466.
mad(precip) % With the matlab-derived function we got the same answer of 0.1466.

%{
Question 5
%}
tmax = table2array(ithaca(:,"tmax")); % Assigning tmax to a variable
sorted_tmax = sort(tmax);
first_sorted_max = sorted_tmax(1,1);
first_sorted_max % The minimum value of the max temperatures is 9 degrees Farenheit.
min(tmax) % With the matlab-derived function, we get the same value of 9 degrees Farenheit.
last_sorted_max = sorted_tmax(length(sorted_tmax),1);
first_sorted_max % The maximum value of the max temperatures is 53 degrees Farenheit.
max(tmax) % With the matlab-derived function, we get the same value of 53 degrees Farenheit.

%{
Question 6
%}
% already sorted the data in question 5 with sorted_tmax
sorted_tmax(round(length(tmax)*0.5),1) % The median max temperature of this time period is 30 degrees Farenheit.
median(tmax) % We get the same answer  of 30 degrees Farenheit with the matlab-derived function.

%{
Question 7
%}
tmin = table2array(ithaca(:,"tmin")); % create a new variable of the min temperatures
neg_tmin = find(tmin < 0); % filters out the non negative temp days
neg_tmin %  The days where tmin is negative are 4,24,25,26,27,28,29. 
pos_tmin_ten_precip = find(tmin > 0 & precip > 0.10);
pos_tmin_ten_precip % The days where tmin is positive and the precitipation is greater than 0.10 are 3,11,13,20,23. 




