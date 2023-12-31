//
//  10844.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/11/15.
//

import Foundation

func Q_10844() {
    let N = Int(readLine()!)!
    
    if N == 1 {
        print(9)
        return
    }
    
    var dp: [[UInt64]] = .init(repeating: .init(repeating: 0, count: 10), count: N + 1)
    
    for i in 1...9 {
        dp[1][i] = 1 // // 0을 제외한 한자리 숫자는 모두 계단 수
    }
    
    let mod: UInt64 = 1000000000
    for i in 2...N {
        for j in 0...9 {
            switch j {
            case 0:
                // 각각 % mod를 하는 이유: 안하면 산술 오버플로 발생
                dp[i][j] = dp[i - 1][1] % mod
            case 9:
                dp[i][j] = dp[i - 1][j - 1] % mod
            default:
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % mod
            }
        }
    }
    
    let sum = dp[N].reduce(0, { $0 + $1 })
    print(sum % mod)
}

/*
 https://www.acmicpc.net/problem/10844
 쉬운 계단 수
 
 45656이란 수를 보자.

 이 수는 인접한 모든 자리의 차이가 1이다. 이런 수를 계단 수라고 한다.

 N이 주어질 때, 길이가 N인 계단 수가 총 몇 개 있는지 구해보자. 0으로 시작하는 수는 계단수가 아니다.

 입력
 첫째 줄에 N이 주어진다. N은 1보다 크거나 같고, 100보다 작거나 같은 자연수이다.

 출력
 첫째 줄에 정답을 1,000,000,000으로 나눈 나머지를 출력한다.

 예제 입력 1
 1
 예제 출력 1
 9
 
 예제 입력 2
 2
 예제 출력 2
 17
 
 https://cotak.tistory.com/12
 풀이
 
 0을 제외한 모든 숫자는 앞에 올 수 있다.
 이때 1~8은 뒤에 올 수 있는 숫자가 총 2종류이다(숫자±1).
 하지만 9 뒤엔 오직 숫자 8만이 올 수 있다.
  
 이를 그림으로 표현하면 다음과 같다.
 dp테이블은 이차원 리스트이며 dp[자리 수][앞에 오는 숫자]=경우의 수이다.

 정리하면 다음과 같다.
  
 앞에 오는 숫자 = 0 >>
 dp[자리 수][0] = dp[자리 수 - 1][1]
 ※ dp[1][0] = 0이기 때문에 어차피 결과엔 영향을 미치지 않는다.
 ex) 0, 01, 012 -> 안 셈!
  
 앞에 오는 숫자 = 1~8 >>
 dp[자리 수][앞에 오는 숫자] = dp[자리 수 - 1][앞에 오는 숫자 -1] + dp[자리 수 - 1][앞에 오는 숫자 + 1]
 dp[n][i] = dp[n][i-1] + dp
  
 앞에 오는 숫자 = 9 >>
 dp[자리 수][9] = dp[자리 수 - 1][8]
 
 // =================
 여기서 마지막 print(sum % mod)에서 % mod를 왜 해야하는지 설명좀

 ChatGPT
 마지막 print(sum % mod)에서 % mod 연산은 결과 값을 모듈로 연산하여 나머지만을 취하는 것입니다. 이렇게 하는 이유는 대부분의 경우에서 중간 단계에서의 연산 결과가 매우 큰 수가 될 수 있기 때문입니다. 특히, 동적 프로그래밍(Dynamic Programming) 문제에서는 많은 중간 결과가 누적되기 때문에 이를 통제하기 위해 모듈로 연산이 자주 사용됩니다.

 여기서는 mod 값을 1,000,000,000으로 설정하였는데, 이는 결과 값이 이 값으로 나누어질 때마다 나머지만을 취하라는 의미입니다. 이는 정수 오버플로우를 방지하고 결과 값을 원하는 범위로 유지하기 위한 안전장치로 작용합니다.

 만약 % mod를 사용하지 않고 누적된 결과를 그대로 출력한다면, 중간에 발생한 큰 수로 인해 정수 오버플로우가 발생할 수 있습니다. 따라서 % mod를 사용하여 결과를 적절한 범위로 제한함으로써 정확한 결과를 얻을 수 있습니다.
 
 -----
 
 중간에 mod를 했는데 마지막에 또하는이유가?
 
 ChatGPT
 코드에서 중간 단계에서 각 계산에서 % mod를 수행하는 것은 중간 결과가 UInt64의 범위를 초과하지 않도록 하기 위함입니다. 이것은 중간 계산 중에 오버플로우를 방지하고 정수의 표현 범위 내에서 결과를 유지하는 데 도움이 됩니다.

 마지막 print(sum % mod)에서의 % mod는 최종 결과를 출력하기 전에 한 번 더 수행되는 것입니다. 이것은 최종 결과도 UInt64의 범위를 초과하지 않도록 하기 위함입니다. 중간 계산에서 % mod를 수행했더라도 누적된 결과가 여전히 크게 증가할 수 있으며, 최종 결과를 출력하기 전에 한 번 더 % mod를 수행하여 최종 결과를 원하는 범위로 제한합니다.

 최종 결과를 출력하기 전에도 % mod를 수행함으로써, 정수 오버플로우나 큰 수로 인한 문제를 방지하고 안전하게 결과를 출력할 수 있습니다.
 */
