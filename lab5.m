% Question 1
sse = 2000;
msg = 116.3;
df_g = 4;
df_e = 45;
% msg = ssg/df_g
ssg = msg*df_g; % 465.2
% mse = sse/df_e
mse = sse / df_e; % 44.44
F = msg/mse; % 2.6168

% Question 2
fifty = [-0.4, 0.34, 0.19, 0.05, -0.14];
hundred = [0.01, -0.39, -0.08, -0.09, -0.31];
one_fif = [0.65, 0.53, 0.39, -0.15, 0.46];
two_hun = [0.24, 0.44, 0.13, 1.03, 0.05];
groups = {'50 ppm','100 ppm','150 ppm','200 ppm'};
two_anova = anova1([fifty.' hundred.' one_fif.' two_hun.'], groups);
two_anova;

% b
mean(fifty) % 0.0080
mean(hundred) % -0.1720
mean(one_fif) % 0.3760
mean(two_hun) % 0.3780
std(fifty) % 0.2887
std(hundred) % 0.1695
std(one_fif) % 0.3093
std(two_hun) % 0.3928

% e
grandmean = (mean(fifty)*5 + mean(hundred)*5 + mean(one_fif)*5 + mean(two_hun)*5)/20;

sserror = (std(fifty)^2*4)+(std(hundred)^2*4)+(std(one_fif)^2*4)+(std(two_hun)^2*4);
% c
mserror = sserror/16; % 0.09051

% f
ssgroups = ((mean(fifty) - grandmean)^2)*5 + ((mean(hundred) - grandmean)^2)*5 + ((mean(one_fif) - grandmean)^2)*5 + ((mean(two_hun) - grandmean)^2)*5; % 1.13442
%g
msegroups = ssgroups/3; % 0.37814
%h
F = msegroups/mserror; % 4.18

% Question 3
age = [2,2,2,6,9,10,13,10,14,14,12,7,11,11,14,20];
hz = [840,670,580,470,540,660,510,520,500,480,400,650,460,500,580,500];

% a
hold on;
scatter(age, hz); % negative
title('Fundamental Frequency as a Function of Age');
xlabel('Age (in years)');
ylabel('Fundamental Frequency (Hz)');
hold off;

% b
ssa = sum((age - mean(age)).^2); % 380.4375

% c 
ssf = sum((hz - mean(hz)).^2); % 174175

% d
ssp = sum((hz - mean(hz)).*(age - mean(age))); % -4.89875e+03

% e
r = ssp/(sqrt(ssf)*sqrt(ssa)); % -0.601797954619960

% f
z = 0.5*log((1+r)/(1-r)); % -0.695961235390619

% g
sdz = sqrt(1/(16-3)); % 0.277350098112615

% h
z_crit = 1.96;

% i
lower_untrans = z - 1.96*sdz; % -1.239567427691344
upper_untrans = z + 1.96*sdz; % -0.152355043089895

% j
lower_r = (exp(2*lower_untrans) - 1)/(exp(2*lower_untrans) + 1); % -0.845332178884088
upper_r = (exp(2*upper_untrans) - 1)/(exp(2*upper_untrans) + 1); % -0.151187061636697

% Question 4
% a
sat_meanb = mean(Q4Boston(:,2)); % 2.9567
sun_meanb = mean(Q4Boston(:,3)); % 3.9517
mon_meanb = mean(Q4Boston(:,4)); % 3.26
tue_meanb = mean(Q4Boston(:,5)); % 2.3783
wed_meanb = mean(Q4Boston(:,6)); % 3.0233
thu_meanb = mean(Q4Boston(:,7)); % 3.5627
fri_meanb = mean(Q4Boston(:,8)); % 3.345
sat_stdb = std(Q4Boston(:,2)); % 1.295
sun_stdb = std(Q4Boston(:,3)); % 0.9726
mon_stdb = std(Q4Boston(:,4)); % 1.0068
tue_stdb = std(Q4Boston(:,5)); % 0.9203
wed_stdb = std(Q4Boston(:,6)); % 1.2214
thu_stdb = std(Q4Boston(:,7)); % 1.067
fri_stdb = std(Q4Boston(:,8)); % 1.1513

% b
groups = {'Sat','Sun','Mon','Tues','Wed','Thurs','Fri'};
four_anova1 = anova1(Q4Boston(:,2:8), groups);
four_anova1;

% c
sat_meanp = mean(Q4Pittsburg(:,2)); % 2.905
sun_meanp = mean(Q4Pittsburg(:,3)); % 3.435
mon_meanp = mean(Q4Pittsburg(:,4)); % 2.4817
tue_meanp = mean(Q4Pittsburg(:,5)); % 2.3783
wed_meanp = mean(Q4Pittsburg(:,6)); % 2.7233
thu_meanp = mean(Q4Pittsburg(:,7)); % 3.2117
fri_meanp = mean(Q4Pittsburg(:,8)); % 2.465
sat_stdp = std(Q4Pittsburg(:,2)); % 1.2128
sun_stdp = std(Q4Pittsburg(:,3)); % 1.3397
mon_stdp = std(Q4Pittsburg(:,4)); % 1.0773
tue_stdp = std(Q4Pittsburg(:,5)); % 0.6018
wed_stdp = std(Q4Pittsburg(:,6)); % 1.1076
thu_stdp = std(Q4Pittsburg(:,7)); % 1.5411
fri_stdp = std(Q4Pittsburg(:,8)); % 1.0178

four_anova2 = anova1(Q4Pittsburg(:,2:8), groups);
four_anova2;

% Question 5
face = [1.59,1.67,1.65,1.72,1.79,1.77,1.74,1.74,1.77,1.78,1.76,1.81,1.83,1.83,1.84,1.87,1.92,1.95,1.98,1.99,2.07];
penalty = [0.44,1.43,1.57,0.14,0.27,0.35,0.85,1.13,1.47,1.51,1.99,1.06,1.2,1.23,0.8,2.53,1.23,1.1,1.61,1.95,2.95];

% a 
hold on;
scatter(face,penalty);
xlabel('Face Width:Height ratio');
ylabel('Penalty Minutes per Game');
title('Penalty against Face Width:Height Ratio');
hold off;

% b
%{
based on the plot above, the plot looks like it is positive and semi
linear. Pretty weak
%}

% c
mean(face); % 1.8129
mean(penalty); % 1.2767

% d 
b = sum((face - mean(face)).*(penalty - mean(penalty)))/sum((face - mean(face)).^2); % 3.189 

% e
a = mean(penalty) - b*mean(face); % -4.5045

% f
% y = 3.189x - 4.5045
x = 1.5:0.05:2.1;
y = 3.189*x - 4.5045;
hold on;
scatter(face,penalty);
xlabel('Face Width:Height ratio');
ylabel('Penalty Minutes per Game');
title('Penalty against Face Width:Height Ratio');
plot(x,y);
hold off;

