# FFT (Iterative 방식)

`fftIterative`는 **고속 푸리에 변환(FFT)** 알고리즘을 **재귀 없이 반복문**으로 구현한 함수입니다.
이는 시간 효율과 메모리 효율 모두에서 재귀 방식보다 뛰어나며, 대규모 입력에도 강합니다.

---

## ✅ 함수 구조 미리 보기

```swift
func fftIterative(_ a: inout [Complex], invert: Bool)
```

* `a`: 입력 및 출력 배열 (in-place 연산)
* `invert`: `false`면 정방향 FFT, `true`면 역 FFT

---

## ✅ 전체 흐름 설명

### 1. 🧩 **비트 반전(bit reversal)**

FFT 알고리즘은 입력을 재배열한 후 계산하는 것이 핵심인데,
이때 필요한 순서가 **비트 반전된 인덱스 순서**입니다.

```swift
for i in 1..<n {
  var bit = n >> 1
  while j & bit != 0 {
    j ^= bit
    bit >>= 1
  }
  j |= bit
  if i < j {
    a.swapAt(i, j)
  }
}
```

* 인덱스 `i`에 대해 **비트 반전된 위치** `j`를 계산
* `i < j`인 경우, `a[i]`와 `a[j]`를 교환 (중복 방지)
* 예: `i = 3 (011)` → bit reversal → `j = 6 (110)`

### ❗ 왜 필요한가?

* FFT의 합병 순서를 반복적으로 잘 정의하려면,
  미리 비트 반전된 순서로 정렬하면 **한 줄의 반복문으로 완전 합병** 가능

---

### 2. 🔁 **반복 기반 FFT 단계 실행**

```swift
var len = 2
while len <= n {
  ...
  for i in stride(from: 0, to: n, by: len) {
    ...
    for j in 0..<(len/2) {
      ...
    }
  }
  len <<= 1
}
```

* `len`: 현재 처리할 **서브 배열의 크기**
* 한 단계마다 크기 `len`인 구간을 나누어, 그 안에서 **버터플라이 연산(Butterfly Operation)** 수행

---

### 3. 🔁 **버터플라이 연산 (Butterfly Operation)**

```swift
let u = a[i + j]
let v = a[i + j + len/2] * w
a[i + j] = u + v
a[i + j + len/2] = u - v
w *= wlen
```

* 두 개의 복소수 값을 조합하여 새로운 주파수 성분을 만듦
* `w`: 회전 인자
* `wlen`: 단계별로 사용하는 회전 인자의 기본값
  → $wlen = \cos(\theta) + i \cdot \sin(\theta)$

---

### 4. 🔁 **역 FFT 보정 (스케일 조정)**

```swift
if invert {
  for i in 0..<n {
    a[i] /= Double(n)
  }
}
```

* 역 FFT는 푸리에 계수들을 다시 시간 영역으로 되돌리는 과정
* 각 성분을 `n`으로 나누어 원래 신호로 복원함

---

## ✅ 예시

입력:

```swift
a = [1, 0, 0, 0]
```

FFT 결과:

```swift
→ [1, 1, 1, 1]
```

(왜냐하면 단위 임펄스의 FFT는 전 주파수 성분이 동일하게 1)

---

## 📦 정리표

| 단계       | 설명                            |
| -------- | ----------------------------- |
| 비트 반전    | 계산 순서에 맞게 인덱스를 미리 재정렬         |
| 반복 합병    | 크기 2, 4, 8...씩 키워가며 주파수 성분 계산 |
| 회전 인자    | 복소수 원을 따라 각도를 곱해서 회전          |
| 버터플라이 연산 | 두 항의 합/차를 계산해 병합              |
| 역변환 시 보정 | 전체 결과를 `n`으로 나눠 복원            |

---

## ✅ 정리

* `fftIterative`는 \*\*시간 복잡도 $O(n \log n)$\*\*으로 동작
* 재귀 대신 **in-place 반복 방식**을 사용해 **스택 오버헤드 제거**
* Swift, C++, Rust 등에서 대규모 FFT 구현 시 가장 추천되는 방식

