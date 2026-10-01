clear all; close all; clc;

% 붓꽃 데이터 불러오기
%meas 1열: sepal length
%meas 2열: sepal width
%meas 3열: petal length
%meas 4열: petal length
%species: 꽃 종류

load fisheriris;

%% 특징그리기
% 그냥 특징에 따라 뿌리기만 함
figure;
plot(meas(:, 1), meas(:, 2), 'k.');
xlabel('sepal length');
ylabel('sepal width');

%% 각 종의 숫자표현 
spcs2num = [];
for k=1:1:length(species) % species의 문자를 확인해서 숫자로 인코딩
    if strcmp(species(k), 'setosa') == 1
        spcs2num(k, 1) = 3;
    elseif strcmp(species(k), 'versicolor') == 1
        spcs2num(k, 1) = 1;
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k, 1) = 2;
    end
end

%% 종별 색 구분해보기
idx1 = find(spcs2num == 3); %setosa 찾기
idx2 = find(spcs2num == 1); %versicolor 찾기
idx3 = find(spcs2num == 2); %virginica 찾기

figure;
plot(meas(idx1, 1), meas(idx1, 2), 'r.'); hold on; % setosa Red Dot 
plot(meas(idx2, 1), meas(idx2, 2), 'go'); hold on; % versicolor Green O(원)
plot(meas(idx3, 1), meas(idx3, 2), 'bx'); hold on; % virginica Blue X
xlabel('sepal length')
ylabel('sepal width')

figure;
plot(meas(idx1, 3), meas(idx1, 4), 'r.'); hold on; % setosa Red 점 
plot(meas(idx2, 3), meas(idx2, 4), 'go'); hold on; % versicolor Green O(원)
plot(meas(idx3, 3), meas(idx3, 4), 'bx'); hold on; % virginica Blue X
xlabel('petal length')
ylabel('petal width')

%% 학습/평가 데이터 분할
% versicolor와 virginica 레이블 데이터셋 분할해보기
% 연습 편의를 위해
% 1~50: setosa, 51~100: versicolor, 101~150: virginica
% 학습 데이터와 평가 데이터의 비율은 6:4

tr_id = [71:1:100, 121:1:150]; % 학습용으로 쓸 데이터의 인덱스 범위 지정
training_data = meas(tr_id,1:2); % 본 데이터셋에서 training 데이터의 인덱스를 기반으로 트레이닝 데이터셋 가져오기
training_label = spcs2num(tr_id,:); % train dataset의 정답 레이블 가져오기

ts_id = [51:1:70, 101:1:120];
test_data = meas(ts_id,1:2);
test_label = spcs2num(ts_id, :);

%% 모델 시작
%% 매트랩 내부 함수로 KNN 모델 만들기 (결정해야 할 건 K의 값, 거리 계산방식을 어떻게 할지)
k = 3; % 인접한 3개 이웃
md1 = fitcknn(training_data, training_label, 'NumNeighbors', k, 'Distance', 'euclidean');
% md1 = fitcknn(training_data, training_label, 'NumNeighbors', k);
% fitcknn이 어떻게 돌아가는지 알고리즘 찾아봐야댐
% knn의 디폴트 거리 계산 방식은 유클리디안. 따라서 이렇게 작성해도 무방함.

%% 평가 #1
% test의 데이터 첫 줄 넣어보기
%result = predict(md1, test_data(1, :))

%% 평가 #2 한번에 해보기
result = predict(md1, test_data);

%% figure
figure;
subplot(211); bar(test_label); axis tight;
subplot(212); bar(result); axis tight;

figure;
subplot(311); bar(test_label); axis tight;
subplot(312); bar(result); axis tight;
subplot(313); bar(test_label- result); axis tight;