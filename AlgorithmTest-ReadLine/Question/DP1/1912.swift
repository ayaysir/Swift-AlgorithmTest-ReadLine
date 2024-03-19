//
//  1912.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/11/01.
//

import Foundation

func Q_1912() {
    _ = readLine()
    let sequence = readLine()!.split(separator: " ").map { Int($0)! }
    
    if sequence.count == 1 {
        print(sequence.first!)
    } else {
        var dp = Array(repeating: 0, count: sequence.count)
        dp[0] = sequence[0]
        
        for i in 1..<sequence.count {
            dp[i] = max(0, dp[i-1]) + sequence[i]
        }
        
        print(dp.max()!)
    }
}

func Q_1912_OLD() {
    let n = Int(readLine()!)!
    let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var result: Int = array[0]
    var total: Int = 0
    
    for i in 0..<n {
        result = max(result, total + array[i])
        total += array[i]
        total = max(0, total)
    }
    
    print(result)
}


/*
 연속합
 
 n개의 정수로 이루어진 임의의 수열이 주어진다. 우리는 이 중 연속된 몇 개의 수를 선택해서 구할 수 있는 합 중 가장 큰 합을 구하려고 한다. 단, 수는 한 개 이상 선택해야 한다.

 예를 들어서 10, -4, 3, 1, 5, 6, -35, 12, 21, -1 이라는 수열이 주어졌다고 하자. 여기서 정답은 12+21인 33이 정답이 된다.

 입력
 첫째 줄에 정수 n(1 ≤ n ≤ 100,000)이 주어지고 둘째 줄에는 n개의 정수로 이루어진 수열이 주어진다. 수는 -1,000보다 크거나 같고, 1,000보다 작거나 같은 정수이다.

 출력
 첫째 줄에 답을 출력한다.

 예제 입력 1
 10
 10 -4 3 1 5 6 -35 12 21 -1
 
 예제 출력 1
 33
 
 예제 입력 2
 10
 2 1 -4 3 4 -4 6 5 -5 1
 
 예제 출력 2
 14
 
 예제 입력 3
 5
 -1 -2 -3 -4 -5
 
 예제 출력 3
 -1
 
 [10, -4, 3, 1, 5, 6, -35, 12, 21, -1]
 [6, -1, 4, 6, 11, -29, -23, 33, 20]
 [9, 0, 9, 12, -24, -17, -2, 32]
 [10, 5, 15, -23, -12, 4, -3]
 [15, 11, -20, -11, 9, 3]
 [21, -24, -8, 10, 8]
 [-14, -12, 13, 9]
 [-2, 9, 12]
 [19, 8]
 [18]
 
 https://black-hair.tistory.com/107
 총합이 음수로 되는 경우에는 처음부터 새로 시작하는 것이
 더 큰 숫자를 만들 수 있기 때문에 총 합을 0으로 초기화하고 새로 시작하면 된다.

 이렇게 구현하는 경우에는 단순합 연산만 이용하여 구할수 있게 된다.
 
 */
