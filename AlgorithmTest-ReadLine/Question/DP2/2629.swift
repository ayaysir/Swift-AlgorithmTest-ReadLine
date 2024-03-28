//
//  2629.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/27/2024.
//
//  4: 양팔저울 https://www.acmicpc.net/problem/2629
//

import Foundation

/// 양팔저울 https://www.acmicpc.net/problem/2629
/// - 2차원 DP 배열: 70212KB    12ms
func Q_2629_() {
        let n = Int(readLine()!)!
        let weights = readLine()!.split(separator: " ").map { Int($0)! }
        let m = Int(readLine()!)!
        let finds = readLine()!.split(separator: " ").map { Int($0)! }
        var dp = Array(repeating: Array(repeating: false, count: 40001), count: 31)
        
        /// count번째 추를 추가했을 때 목표 target를 만들 수 있는가?
        func recursive(_ count: Int, _ target: Int) {
            if dp[count][target] {
                return
            }
            
            dp[count][target] = true
            
            if count == n {
                return
            }
            
            recursive(count + 1, target)
            recursive(count + 1, target + weights[count])
            recursive(count + 1, abs(target - weights[count]))
        }
        
        recursive(0, 0)
        
        var result = ""
        for i in 0..<m {
            // n: 추의 개수
            // finds[i]: 구슬의 무게 확인 => 추의 무게 차이 확인
            result.write(dp[n][finds[i]] ? "Y " : "N ")
        }
        
        print(result)
}

/// 양팔저울 https://www.acmicpc.net/problem/2629
/// - 1차원 DP 배열: 69108KB    8ms
func Q_2629() {
    let n = Int(readLine()!)!
    let weights = readLine()!.split(separator: " ").map { Int($0)! }
    let weightsMax = weights.reduce(0, +)
    let m = Int(readLine()!)!
    let finds = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = [true] + Array(repeating: false, count: 40001)
    
    for i in stride(from: 0, to: n, by: 1) {
        for j in stride(from: weightsMax, through: 0, by: -1) where dp[j] {
            dp[j + weights[i]] = true
        }
        
        for j in stride(from: 0, through: weightsMax, by: 1) where dp[j] {
            dp[abs(j - weights[i])] = true
        }
    }
    
    var result = ""
    for i in 0..<m {
        // n: 추의 개수
        // finds[i]: 구슬의 무게 확인 => 추의 무게 차이 확인
        result.write(dp[finds[i]] ? "Y " : "N ")
    }
    
    print(result)
}


/*
 [풀이] https://cobokjang.tistory.com/18
 배낭 알고리즘
 - 구슬을 무조건 왼쪽에 둔다고 치면,
  (1) 추를 올리지 않는다.
  (2) 추를 왼쪽에 올린다.
  (3) 추를 오른쪽에 올린다. (저울의 반대쪽에 놓는 추의 무게 계산은 abs함수를 이용해서 절댓값계산을 했다.)
 - 10 20 30 40 50 의 추가 있다고 생각해보자
   - 추 20 | 40 이 있는 경우는 양쪽의 차이가 20이다. -> 무게 20인 구슬의 무게 구할 수 있음
   - 추 10 | 30 이 있는 경우는 역시 양쪽의 차이가 20이다. -> 무게 20인 구슬의 무게 구할 수 있음
   => 양쪽 저울의 무게차이가 같고, 추의 리스트에서 탐색한 index의 수가 같으면 중복된 경우이다.
        -> 남은 추의 무게를 저장한 list는 같고 양쪽 무게 차이도 같기 때문이다.
        -> 이 부분은 진행을 안해도 된다.
   => dp[사용한 추의 개수][추의 무게 차이]
        -> 사용한 추의 개수는 문제에서 주어진 n이다.
 
 [심화] 1차원 DP 배열로 줄이기 https://dingcoding.tistory.com/71
 
 --------------------
 
 문제
 양팔 저울과 몇 개의 추가 주어졌을 때, 이를 이용하여 입력으로 주어진 구슬의 무게를 확인할 수 있는지를 결정하려고 한다.

 무게가 각각 1g과 4g인 두 개의 추가 있을 경우, 주어진 구슬과 1g 추 하나를 양팔 저울의 양쪽에 각각 올려놓아 수평을 이루면 구슬의 무게는 1g이다. 또 다른 구슬이 4g인지를 확인하려면 1g 추 대신 4g 추를 올려놓으면 된다.

 구슬이 3g인 경우 아래 <그림 1>과 같이 구슬과 추를 올려놓으면 양팔 저울이 수평을 이루게 된다. 따라서 각각 1g과 4g인 추가 하나씩 있을 경우 주어진 구슬이 3g인지도 확인해 볼 수 있다.
 
 🟠1️⃣ | 4️⃣
 <그림 1> 구슬이 3g인지 확인하는 방법 (1)은 1g인 추, (4)는 4g인 추, ●은 무게를 확인할 구슬)
 
 <그림 2>와 같은 방법을 사용하면 구슬이 5g인지도 확인할 수 있다. 구슬이 2g이면 주어진 추를 가지고는 확인할 수 없다.

 추들의 무게와 확인할 구슬들의 무게가 입력되었을 때, 주어진 추만을 사용하여 구슬의 무게를 확인 할 수 있는지를 결정하는 프로그램을 작성하시오.
 
 🟠 | 1️⃣ 4️⃣
 <그림 2> 구슬이 5g인지 확인하는 방법
 
 입력
 첫째 줄에는 추의 개수가 자연수로 주어진다. 추의 개수는 30 이하이다. 둘째 줄에는 추의 무게들이 자연수로 가벼운 것부터 차례로 주어진다. 같은 무게의 추가 여러 개 있을 수도 있다. 추의 무게는 500g이하이며, 입력되는 무게들 사이에는 빈칸이 하나씩 있다. 세 번째 줄에는 무게를 확인하고자 하는 구슬들의 개수가 주어진다. 확인할 구슬의 개수는 7이하이다. 네 번째 줄에는 확인하고자 하는 구슬들의 무게가 자연수로 주어지며, 입력되는 무게들 사이에는 빈 칸이 하나씩 있다. 확인하고자 하는 구슬의 무게는 40,000보다 작거나 같은 자연수이다.

 출력
 주어진 각 구슬의 무게에 대하여 확인이 가능하면 Y, 아니면 N 을 차례로 출력한다. 출력은 한 개의 줄로 이루어지며, 각 구슬에 대한 답 사이에는 빈칸을 하나씩 둔다.

 예제 입력 1
 2
 1 4
 2
 3 2
 예제 출력 1
 Y N
 
 예제 입력 2
 4
 2 3 3 3
 3
 1 4 10
 예제 출력 2
 Y Y N
 
 */
