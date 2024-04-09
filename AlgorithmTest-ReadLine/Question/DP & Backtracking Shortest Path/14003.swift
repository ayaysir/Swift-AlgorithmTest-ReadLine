//
//  14003.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  3: 가장 긴 증가하는 부분 수열 5 https://www.acmicpc.net/problem/14003
//

import Foundation

/// 가장 긴 증가하는 부분 수열 5 https://www.acmicpc.net/problem/14003
func Q_14003() {
    let n = Int(readLine()!)!
    let numbers = [.min] + readLine()!.split(separator: " ").map { Int($0)! }
    var lis = [Int]()
    var indices = Array(repeating: 0, count: numbers.count + 1)
    
    for i in 1...n {
        if lis.isEmpty || !lis.isEmpty && (lis.last! < numbers[i]) {
            lis.append(numbers[i])
            indices[i] = lis.count - 1
        } else {
            var (l, r) = (0, lis.count - 1)
            while l < r {
                let mid = (l + r) / 2
                
                if lis[mid] >= numbers[i] {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            
            lis[l] = numbers[i]
            indices[i] = l
        }
    }
    var findIndex = lis.count - 1, paths = [Int]()
    for i in stride(from: n, to: 0, by: -1) where findIndex == indices[i] {
        findIndex -= 1
        paths.append(numbers[i])
    }
    
    // print(numbers, lis, paths.reversed(), indices)
    
    print(lis.count)
    print(paths.reversed().map(String.init).joined(separator: " "))
}

/*
 [참고]
 - 이론상으로는 12015(가장 긴 증가하는 부분 수열 2) 문제에 인덱스 추적 부분만 추가하면 된다고 하지만
   생각보다 그렇게 간단하지 않다.
 
 [풀이] https://yabmoons.tistory.com/561
 - 12015에서 사용하는 LIS 배열은 길이는 알려줄 수 있지만 안의 내용은 정확하지 않다.
 - indices[] = 이번 문제에서 추가된, "데이터가 들어가는 Index의 위치를 저장" 하는 배열.
 - indices[A] = B : "원본 데이터에서 A번째에 있는 숫자는, LIS배열에서 B번째에 위치합니다."
 
 * numbers 배열 순회: 편의상 모든 배열에 1-based 인덱스를 사용
  (1) LIS 배열이 비어있거나, LIS 배열의 마지막 원소보다 numbers[i]가 더 클 때
   - LIS 배열에 numbers[i]를 넣는다.
   - 🆕 indices[i] 의 값으로 LIS 인덱스 (=> lis.count - 1)을 넣는다.
  (2) 그 외의 경우
   - 이분 탐색을 돌린다. (코드 참조)
   - 이분 탐색을 마치면 l 이 LIS 가 replace할 대상의 인덱스가 되며, lis[l] = numbers[i]를 배정한다.
   - 🆕 indices[i] 의 값으로 LIS 인덱스 (=> l)을 넣는다.
 
 위의 과정을 마치면 numbers 배열, lis 배열과 indices 배열은 다음과 같다.
 입력 예) 
 
 16
 -60 -41 -100 8 -8 -52 -62 -61 -76 -52 -52 14 -11 -2 -54 46
 
 +--------+------+-----+-----+-----+-----+----+----+
 | LIS(假) ║ -100 | -76 | -61 | -54 | -11 | -2 | 46 |
 +--------+------+-----+-----+-----+-----+----+----+
 
 +---------+-----+-----+------+----+-----+-----+-----+-----+
 |    i    ║  1  |  2  |   3  |  4 |  5  |  6  |  7  |  8  |
 +=========+=====+=====+======+====+=====+=====+=====+=====+
 | indices ║  0  |  1  |   0  |  2 |  2  |  1  |  1  |  2  |
 +---------+-----+-----+------+----+-----+-----+-----+-----+
 | numbers ║ -60 | -41 | -100 |  8 |  -8 | -52 | -62 | -61 |
 +---------+-----+-----+------+----+-----+-----+-----+-----+
 
 +=========+=====+=====+======+====+=====+=====+=====+=====+
 |    i    ║  9  |  10 |  11  | 12 |  13 |  14 |  15 |  16 |
 +=========+=====+=====+======+====+=====+=====+=====+=====+
 | indices ║  1  |  3  |   3  |  4 |  4  |  5  |  3  |  6  |
 +---------+-----+-----+------+----+-----+-----+-----+-----+
 | numbers ║ -76 | -52 |  -52 | 14 | -11 |  -2 | -54 |  46 |
 +---------+-----+-----+------+----+-----+-----+-----+-----+
 
 - indices[i]의 값이 가장 큰 것부터 -1씩 역으로 내려오면서 정답 배열에 추가
 - indices[A] = B : "원본 데이터에서 A번째에 있는 숫자는, LIS배열에서 B번째에 위치합니다."
   예) indices[16] = 6 => numbers[16]의 숫자 46은, LIS 배열에서 6번째에 위치합니다.
       indices[14] = 5 => numbers[14]의 숫자 -2은, LIS 배열에서 5번째에 위치합니다.
       (...)
       indices[11] = 3 => numbers[11]의 숫자 -52은, LIS 배열에서 3번째에 위치합니다.
     => LIS 배열의 3번째 위치는 -54로 기록되어 있다. 하지만 이 배열은 길이만을 구하기 위한 배열로
        계산 과정상 실제 내용물은 다르게 나올수 있다. 따라서 indices배열이 알려주는 대로 LIS 배열의 3번째 위치는
        -54 대신 -52를 넣어야 하며 이를 정답 배열에 반영한다.
       (...)
 
 이러한 과정을 통해 새롭게 나온 眞 LIS 배열은 다음과 같다. 괄호친 부분이 假 리스 배열이랑 다른 부분이다.
 [46, -2, -11, (-52), -61, (-62), -100]
 
 첫 줄에는 LIS의 길이를 출력하고, 다음 줄에 위 배열(paths)을 역순으로 변환하면 정답이다.
 
 ---------
 
 문제
 수열 A가 주어졌을 때, 가장 긴 증가하는 부분 수열을 구하는 프로그램을 작성하시오.

 예를 들어, 수열 A = {10, 20, 10, 30, 20, 50} 인 경우에 가장 긴 증가하는 부분 수열은 A = {10, 20, 10, 30, 20, 50} 이고, 길이는 4이다.

 입력
 첫째 줄에 수열 A의 크기 N (1 ≤ N ≤ 1,000,000)이 주어진다.

 둘째 줄에는 수열 A를 이루고 있는 Ai가 주어진다. (-1,000,000,000 ≤ Ai ≤ 1,000,000,000)

 출력
 첫째 줄에 수열 A의 가장 긴 증가하는 부분 수열의 길이를 출력한다.

 둘째 줄에는 정답이 될 수 있는 가장 긴 증가하는 부분 수열을 출력한다.

 예제 입력 1
 6
 10 20 10 30 20 50
 
 예제 출력 1
 4
 10 20 30 50
 
 [반례]
16
-60 -41 -100 8 -8 -52 -62 -61 -76 -52 -52 14 -11 -2 -54 46
 
 answer:
 7
 -100 -62 -61 -52 -11 -2 46
 */
