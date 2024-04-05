//
//  1806.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/5/2024.
//
//  3: 부분합 https://www.acmicpc.net/problem/1806
//

import Foundation

/// 부분합 https://www.acmicpc.net/problem/1806
func Q_1806() {
    let s = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    
    var (l, r) = (0, 0)
    var partialSum = numbers[0]
    var result = numbers.count + 1
    
    while l <= r, r < numbers.count {
        if partialSum < s {
            r += 1
            if r != numbers.count {
                partialSum += numbers[r]
            }
        } else {
            result = min(result, r - l + 1)
            partialSum -= numbers[l]
            l += 1
        }
    }
    
    print(result == numbers.count + 1 ? 0 : result)
}

/*
 [💥💥💥]
 - 문제에서 부분합과 S가 같은 게 아니라 '같거나 큰' 이라고 되어있다. (같은 게 아님)
   " ... 이 수열에서 연속된 수들의 부분합 중에 그 합이 S '이상'이 되는 것 중 ... "
 - 반례만 제시하고 답을 안알려주는 케이스가 있는데 거기에 적혀 있는 틀린 답을 보고 착각하면 안됨.
 
 [풀이] https://rightbellboy.tistory.com/82
 조건 1) 현재 부분합이 S 보다 작은 경우
 - high 를 오른쪽으로 한 칸 이동하고 sum 에 arr[r] 값을 더해준다.
 - Swift에는 ++연산자가 없으므로 high < n을 while 조건으로 건 상태에서
   다음과 같은 코드는 인덱스 에러가 발생한다.
         while l <= r, r < numbers.count {
             if partialSum < s {
                 // sum += arr[++high]; // in C
                 r += 1
                 partialSum += numbers[r] // 💥 r - 1 = numbers.count인 경우 인덱스 에러 발생
             }
   다음과 같이 변경해야 한다.
         while l <= r, r < numbers.count {
             if partialSum < s {
                 r += 1
                 if r != numbers.count {
                     partialSum += numbers[r]
                 }
 
   
 조건 2) 현재 부분합이 S 보다 크거나 같은 경우
 - 현재 len 값과 현재 부분합의 길이(high - low + 1)를 비교하여 작은 값을 len 에 기록한다.
 - 다음 탐색을 위해 sum 에서 arr[low] 값을 빼주고 low 를 오른쪽으로 한 칸 이동한다.
 
 [while 문의 조건]
 - 포인터들이 같은 곳에서 시작하는 경우
 
 반복 1) low 가 high 보다 작거나 같은 경우
  - 수열 중 1개의 숫자만으로 S 이상이 되면, 다음 반복 시 low 가 high 보다 커지게 됩니다.
  - low 가 더 커진 경우 최소 길이는 1이고 더 이상 탐색할 이유가 없으므로 반복하지 않습니다.

 반복 2) high 가 N 보다 작은 경우
  - high 가 N 에 도달했다는 것은 현재 sum 이 'S 보다 작은 상태로 끝까지 도달'한 것 입니다.
  - sum 을 더 크게 만들 수 있는 방법이 없으므로 더 이상 반복하지 않습니다.
 
 ---------
 
 문제
 10,000 이하의 자연수로 이루어진 길이 N짜리 수열이 주어진다. 이 수열에서 연속된 수들의 부분합 중에 그 합이 S 이상이 되는 것 중, 가장 짧은 것의 길이를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 N (10 ≤ N < 100,000)과 S (0 < S ≤ 100,000,000)가 주어진다. 둘째 줄에는 수열이 주어진다. 수열의 각 원소는 공백으로 구분되어져 있으며, 10,000이하의 자연수이다.

 출력
 첫째 줄에 구하고자 하는 최소의 길이를 출력한다. 만일 그러한 합을 만드는 것이 불가능하다면 0을 출력하면 된다.

 예제 입력 1
 10 15
 5 1 3 5 10 7 4 9 2 8
 예제 출력 1
 2
 
 [반례]
 
5 100
1 1 100 1 1
 ans: 1
 
10 11
1 1 1 1 1 1 1 1 1 1
 ans: 0
 
1 10
1 1
 ans: 0
 
1 1
1
 ans: 1
 
5 10
1 2 3 4 5
 ans: 3
 
10 10
3 3 3 3 3 3 3 3 3 3
 ans: 4

10 2
1 1 1 1 1 1 1 1 1 1
 ans: 2

4 5
1 2 2 3
 ans: 2

10 9
1 1 1 1 1 1 1 1 1 8
 ans: 2

5 5
1 1 1 1 3
 ans: 3
 
10 10
1 1 1 1 1 1 1 1 1 10
 ans: 1
 */
