%% my_kmeans 함수 구현
% 매트랩 내부함수. 출력: mat_label: 그룹 할당 결과, mat_CP: 각 그룹의 중심 좌표
% 입력: 데이터셋, k값, 초기 중심(이번 구현에서는 미리 k에 맞춰 3개 값 준비)
function [mat_label, mat_CP, max_loop_n] = my_kmeans_202310828(data, grpk)
% 초기 중심점 배정
% 랜덤 배정을 위해 'randperm', 'size(data, 1)->행 갯수 반환' 사용
myCP = data(randperm(size(data, 1), grpk), :);
% 데이터의 랜덤 3개 행의 모든 열 데이터 사용 -> 3x2 행렬 반환
grpkclass = 1:grpk;

mylabel = [];
for kk=1:1:length(data)
    tmp_set = data(kk,:);

    % 각 중심좌표와 현재 검사중인 데이터 간의 유클리디안 거리를 계산
    udist = zeros(grpk, 1);
    for jj=1:1:grpk
        % udist 3개 행에 각 중심좌표와 거리 저장
        udist(jj,1) = norm(tmp_set - myCP(jj, :));
    end

    % 현재 데이터와 중심좌표들의 거리를 오름차순으로 정렬
    % sv = 정렬된 값 리스트 반환
    % si = sv 데이터들의 정렬 전 인덱스가 매핑된 리스트 = 원래 군집 번호
    % sv = udist[si]
    [sv, si] = sort(udist, 'ascend');

    % 제일 앞에 있는 것이 거리가 제일 짧은 것. 그것의 그룹 ID로 현재 데이터를 할당하라
    % 중심좌표 중 가장 가까운 것(정렬된 데이터
    % 리스트의 0번 원소)의 군집번호(si)
    % 이걸 data의 행 갯수만큼(전체 데이터에게) 반복
    mylabel(kk,1) = grpkclass(si(1));
end
resultlabel = [];
tf = 1;
loopcount = 0;

% 군집 중심좌표 산출 -> 객체 군집 배정을 수렴 조건에 수렴할 때까지. 
% 수렴조건의 만족은 for문으로 확인이 어려우므로 while문으로
while(tf) 
    loopcount = loopcount + 1;
    for kk=1:1:grpk
        idx = find(mylabel == grpkclass(kk)); % kk 그룹에 할당된 데이터 인덱스 가져오기
        tmp_data = data(idx,:);

        % kk 그룹에 할당된 데이터를 이용하여 중심 좌표를 계산, 중심좌표
        % 리스트에 할당
        myCP(kk,:) = mean(tmp_data);       
    end

    % 새로운 중심좌표를 이용하여, 데이터를 재할당
    % 매 순환마다 초기화
    mylabel_update = [];
    for kk=1:1:length(data)
        tmp_set = data(kk,:);

        udist = zeros(grpk, 1);
        for jj=1:1:grpk
            udist(jj,1) = norm(tmp_set - myCP(jj, :));
        end
        
        % sv는 정렬된 데이터의 리스트이기 때문에 굳이 사용X
        [sv, si] = sort(udist, 'ascend');

        mylabel_update(kk,1) = grpkclass(si(1));
    end

    % 1단계의 결과와 2단계의 결과가 같은지 평가
    % '~=' == '!=', mylabel_update ~= my_label 수식은 두 벡터를 원소별로
    % 비교해서 부울 벡터 반환 -> find()가 0이 아닌 원소의 인덱스를 반환해줌
    % -> 원소별 비교 결과가 모두 같으면 find()는 빈 배열 반환.
    idx = find(mylabel_update ~= mylabel);

    % 이전 할당 결과와 지금 할당 결과가 같으면 while문 종료
    % 빈 배열 반환시 idx의 길이는 0
    % 그렇지 않으면, 위 과정을 반복
    if length(idx) == 0
        tf = 0; 
        resultlabel = mylabel_update;
        break;
    else
        mylabel = mylabel_update;
    end
end
max_loop_n = loopcount;
mat_label = resultlabel;
mat_CP = myCP;

end