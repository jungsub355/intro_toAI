clear all; close all; clc;

load fisheriris.mat;

% sepal length, width  이용
setdata = [];
setdata = meas(:,1:2);

% 매트랩 내부함수. 출력: mat_label: 그룹 할당 결과, mat_Cnt: 각 그룹의 중심 좌표
[mat_label, mat_CP] = kmeans(setdata, 3, 'Start', setdata(1:3,:));

%%
grp = 3; % k = 3;
class = [1 2 3];

my_CP = setdata(1:grp,:); 

% [출력 변수] = my_kmeans_학번(입력변수);

figure;
subplot(311); plot(mat_label); axis tight;
subplot(312); plot(Final_label); axis tight;
subplot(313); plot(mat_label-Final_label); axis tight;

my_CP
mat_CP
    
