clear all; close all; clc;

load fisheriris.mat;

% sepal length, width  이용
setdata = [];
setdata = meas(:,1:2);
% meas는 [받침 길이, 너비, 잎 길이, 너비] 열이 종별로 50행씩 들어있음
% setdata는 받침(sepal) 길이와 너비만 이용(1~2열)
% species에는 50행씩 끊어서 종별 이름이 들어있음. 순서는 meas와 같음

% 종별 번호할당
spcs2num = [];
for k=1:1:length(species)
    if strcmp(species(k), 'setosa') == 1
        spcs2num(k,1) = 1;
    elseif strcmp(species(k), 'versicolor') == 1
        spcs2num(k,1) = 2;
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k,1) = 3;
    end
end

% 매트랩 내부함수. 출력: mat_label: 그룹 할당 결과, mat_Cnt: 각 그룹의 중심 좌표
[mat_label, mat_CP] = kmeans(setdata, 3, 'Start', setdata(1:3,:));
% Start 파라미터를 주면 k값을 무작위 3개 점으로 초기화


%%
grp = 3; % k = 3;
class = [1 2 3];

my_CP = setdata(1:grp,:); 

% [출력 변수] = my_kmeans_학번(입력변수);
[my_label, my_CP] = my_kmeans_202310828(setdata, 3);

figure;
subplot(311); bar(mat_label); axis tight; title('내장함수')
subplot(312); bar(my_label); axis tight; title('개인함수')
subplot(313); bar(mat_label-my_label); axis tight; ('두 결과 편차')

my_CP
mat_CP
    
