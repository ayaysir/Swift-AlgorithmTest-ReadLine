//
//  2293.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/27/2024.
//
//  5: 동전 1 https://www.acmicpc.net/problem/2293
//

// import Foundation

/// 동전 1 https://www.acmicpc.net/problem/2293
func Q_2293_예외처리() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (nk[0], nk[1])
    let coins = (0..<n).map { _ in Int(readLine()!)! }

    var dp = Array(repeating: 0, count: k + 1)
    dp[0] = 1
    
    for coin in coins {
        for i in stride(from: coin, through: k, by: 1) where i - coin >= 0 {
            dp[i] += dp[i - coin]
            // 런타임 에러 1: 2^31(=2147483648) 을 넘어가면 (Int.max = 9223372036854775807가 아님) 에러발생
            if dp[i] >= 2147483648 {
                dp[i] = 0
            }
        }
    }
    
    print(dp[k])
}

/// 동전 1 https://www.acmicpc.net/problem/2293
func Q_2293() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (nk[0], nk[1])
    let coins = (0..<n).map { _ in Int(readLine()!)! }

    var dp: [Int32] = Array(repeating: 0, count: k + 1)
    dp[0] = 1
    
    for coin in coins {
        for i in stride(from: coin, through: k, by: 1) where i - coin >= 0 {
            dp[i] &+= dp[i - coin]
        }
    }
    
    print(dp[k])
}

/*
 [💥💥💥]
 - 런타임 에러가 발생하는 이유
   - 문제의 출력 조건에 "경우의 수는 2^31보다 작다."라는 말이 있는데
   - 이 말의 진짜 의미는 '나올 수 있는 답이 2^31보다 작다'는 의미가 아니라 '더 큰값이 나오면 니가 알아서 컷하라'는 의미이다.
   - Swift Int는 옛날 기기가 아닌 한 64비트이기 때문에 이것보다 더 큰 값들을 계속 계산한다.
   - 32비트 Int + 산술 오버플로가 컴파일 에러가 아닌 언어에서는 초과 오류가 날 일이 없다.
     - 인터넷에서 2^31 처리가 안되었는데 정답인 C++, Python 3 코드들은 32비트 Int로 이런 처리를 해준다.
   - Swift에서는 Int32로 비트수를 제한하고 overflow operator를 사용하면 동일한 효과가 생긴다..
   - https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators/#Overflow-Operators
 
 [풀이] https://zu-techlog.tistory.com/48
 - dp[i]는 i라는 수를 만들 수 있는 경우의 수를 의미한다.
 - 1, 2, 5라는 동전의 가치가 담긴 coin 리스트에 대한 반복문은
   - 동전을 1원만 사용했을 때,
   - 2원을 추가하여 1원과 2원을 사용했을 때,
   - 5원을 추가하여 1원, 2원, 5원을 사용했을 때를 의미한다.
   - 추가되는 동전(c)에 따라 dp[i]는 i가 c보다 크다는 가정 하에 (i - coin >= 0)
     - i-c의 경우의 수(dp[i-c])를 누적해 주면된다.
     - i-c을 만들기 위한 동전의 조합들에 c를 더해주면 i가 되기 때문이다.
   - 점화식은 dp[i] = dp[i] + dp[i-c] 이다.
 --------
 
 문제
 n가지 종류의 동전이 있다. 각각의 동전이 나타내는 가치는 다르다. 이 동전을 적당히 사용해서, 그 가치의 합이 k원이 되도록 하고 싶다. 그 경우의 수를 구하시오. 각각의 동전은 몇 개라도 사용할 수 있다.

 사용한 동전의 구성이 같은데, 순서만 다른 것은 같은 경우이다.

 입력
 첫째 줄에 n, k가 주어진다. (1 ≤ n ≤ 100, 1 ≤ k ≤ 10,000) 다음 n개의 줄에는 각각의 동전의 가치가 주어진다. 동전의 가치는 100,000보다 작거나 같은 자연수이다.

 출력
 첫째 줄에 경우의 수를 출력한다. 경우의 수는 2^31보다 작다.

 예제 입력 1
 3 10
 1
 2
 5
 
 예제 출력 1
 10
 
 
 */
