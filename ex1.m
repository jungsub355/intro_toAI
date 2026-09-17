%%
data = [1 2 3; 
        4 5 6; 
        7 8 9];
% 세미콜론은 행바꿈.

% 2행 3열 데이터 (6)
data(2, 3)
% 2행의 모든 데이터
data(2, :)
% 3열의 모든 데이터
data(:, 3)
% 2행의 2열 ~ 3열. (:, 2:)처럼 숫자 뒤를 열어두고 끝낼수는 없는듯?
data(2, 2:3)
% 모든 행의 2~3열
data(:, 2:3)

data(:, :)

%%
% 변수컨트롤

% 1 ~ 10 , 1씩 증가하는 함수
% a = 시작값:증가값:종결값
a = 1:2:10;
b = 9:-3:0;

length(a)
length(b)
%%
% 주석 여러줄은
% 열고 닫을 수 있는듯
% 아마도

% 0이 10개 포함된 변수
% 1행 10열 배열
k = zeros(1, 10);
% 10행 1열
k = zeros(10, 1);

% 1이 10개
m = ones(1, 10);
m = ones(10, 1);

p = ones(3, 3);

%%
x = 0:1:20;
y = 2*x + 1;

figure; plot(x, y);
figure; stem(x, y);
figure; bar(x, y);

figure; plot(y);
figure; stem(y);
figure; bar(y);
%%
% 한 화면에 그리기
% subplot(공간분할 행, 공간분할 열, 순서)
figure;
subplot(3, 1, 1); plot(x, y);
subplot(3, 1, 2); stem(x, y);
subplot(3, 1, 3); bar(x, y);

figure;
subplot(1, 3, 1); plot(x, y);
subplot(1, 3, 2); stem(x, y);
subplot(1, 3, 3); bar(x, y);

%% 조건에 맞는 데이터 찾기
x = 1:2:10;
i = find(x>5)
y = x(i)

%% 행렬 만들기 & 연산
clear all; close all; clc;
% A(2*3), B(3*2), C(3*3) 만들기
A = [1 2 3; 4 5 6];
B = [1 2; 4 5; 7 8];
C = [1 2 3; 4 5 6; 7 8 9];

% 행별, 열별 데이터 삽입도 가능
D(1, :) = [1 2 3];
D(2, :) = [4 5 6];
D(3, :) = [7 8 9];
E(:, 1) = [1 3 5];
E(:, 2) = [7 9 11];

%% 행렬 연산
A * B %A(2,3) * B(3,2)
A + transpose(B) %B의 전치행렬은 B인버스(2,3)
A + B' % 굳이 transpose 함수 안쓰고 B' 프라임 표시만으로도 전치행렬 표현됨

%% 행렬식
%det(A) %아마 이 행은 오류가 표시될 것.
det(C) %3*3 정방행렬인 C만 행렬식이 계산됨.

%% 역행렬
%inv(A) %역행렬은 정방행렬 & det(array) 가 0이 아닐때만 존재. 고로 얘도 에러
inv(C)
C^-1

%% 행렬곱의 특성 C*D != D*C
C*D
D*C

%% 행렬 특성(역행렬의 분배) -> inv(C*D) = inv(C) * inv(D)
inv(C*D)
inv(C) * inv(D)

%% for/if
clear all; close all; clc;
% x 데이터의 합, 평균 구하기
x = 1:1:10;
out1 = 0;
out2 = 0;

for k=1:1:length(x)
    out1 = out1 + x(k);
    out2 = out2 + x(k)/length(x);
end 
out1
out2

%내장함수
out11 = sum(x)
out22 = mean(x)

out33 = std(x) %표준편차

%% 정규분포 구하기
clear all; close all; clc;

%x 범위
x = 0:0.1:10;

m1 = 5;
s1 = 1;

y = (1/(s1*sqrt(2*pi))) * exp((-(x-m1).^2)/(2*(s1.^2)));
y = y/sum(y);

figure;
plot(x, y);