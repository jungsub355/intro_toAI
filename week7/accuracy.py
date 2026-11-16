# 이진 분류 성능평가

print("혼동행렬 값 입력")
tp = int(input("True Positive 값: "))
fp = int(input("False Positive 값: "))
fn = int(input("False Negative 값: "))
tn = int(input("True Negative 값: "))

# 전체 데이터 N
n = tp + fp + fn + tn

# 정확도
accuracy = (tp + tn) / n

# 민감도
sensitivity = tp / (tp + fn)

# 특이도
specificity = tn / (tn + fp)

# 정밀도
precision = tp / (tp + fp)

# 음성예측도
npv = tn / (tn + fn)

# f1-score
f1_score = 2 * precision * sensitivity / (precision + sensitivity)

# 오분류율
error_rate = (fp + fn) / n

# 출력단계
print("========== 혼동행렬 ==========")
print("            실제 +    실제 -")
print(f"예측 +     {tp:5d}     {fp:5d}")
print(f"예측 -     {fn:5d}     {tn:5d}")

print("\n========== 성능 평가 ==========")

print(f"정확도 Accuracy      : {accuracy:.2%}")
print(f"민감도 Sensitivity   : {sensitivity:.2%}")
print(f"특이도 Specificity   : {specificity:.2%}")
print(f"정밀도 Precision     : {precision:.2%}")
print(f"음성예측도 NPV       : {npv:.2%}")
print(f"F1-score             : {f1_score:.2%}")
print(f"오분류율 Error Rate  : {error_rate:.2%}")

print("\n========== 오류 해석 ==========")

print(f"FP(False Positive) = {fp}")
print("→ 실제 음성을 양성으로 잘못 판단")
print("→ 불필요한 검사나 처치 등 '비용' 발생 가능\n")

print(f"FN(False Negative) = {fn}")
print("→ 실제 양성을 음성으로 잘못 판단")
print("→ 질병이나 이상을 놓치는 '위험' 발생 가능")