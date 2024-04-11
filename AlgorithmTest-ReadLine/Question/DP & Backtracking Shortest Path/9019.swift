//
//  9019.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/8/2024.
//
//  7: DSLR https://www.acmicpc.net/problem/9019
//

import Foundation

/// DSLR https://www.acmicpc.net/problem/9019
func Q_9019() {
    let registerCmd = ["", "D", "S", "L", "R"]
    
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (r[0], r[1])
        
        var visited = [Bool](repeating: false, count: 10001)
        var q = [(n: a, cmd: 0)], sIdx = 0
        
        visited[a] = true
        
        while sIdx < q.count {
            let pop = q[sIdx]; sIdx += 1
            
            visited[pop.n] = true
            
            if pop.n == b {
                var answer = ""
                for s in String(pop.cmd) {
                    let index = Int(String(s))!
                    answer.write(registerCmd[index])
                }
                
                print(answer)
                break
            }
            
            let num = pop.n
            let dslrValues = [
                num * 2 % 10000,
                num - 1 < 0 ? 9999 : num - 1,
                num / 1000 + (num % 1000) * 10,
                num / 10 + (num % 10) * 1000,
            ]
            
            for (i, v) in dslrValues.enumerated() where !visited[v] {
                visited[v] = true
                q.append((v, pop.cmd * 10 + i + 1))
            }
        }
    }
}

/// DSLR https://www.acmicpc.net/problem/9019
/// - 길이만 찾기
func Q_9019_FindDistOnly() {
    let registers: [(Int) -> Int] = [
        { $0 * 2 % 10000 },
        { $0 - 1 < 0 ? 9999 : $0 - 1 },
        { ($0 / 1000) + ($0 % 1000) * 10 },
        { ($0 / 10) + ($0 % 10) * 1000 },
    ]
    
    for _ in 0..<Int(readLine()!)! {
        let cmd = readLine()!.split(separator: " ").map { Int($0)! }
        
        // 1. bfs로 최소길이 찾기
        var visited = Array(repeating: false, count: 10001)
        var q = [(n: cmd[0], d: 0)], sIdx = 0
        var result = 0
        
        while sIdx < q.count {
            let pop = q[sIdx]
            sIdx += 1
            
            if pop.n == cmd[1] {
                result = pop.d
                break
            }
            
            for register in registers {
                let next = register(pop.n)
                
                if 0...10000 ~= next && !visited[next] {
                    visited[next] = true
                    q.append((next, pop.d + 1))
                }
            }
        }
        
        print(result)
    }
}

/*
 [주의]
 - 인터넷에 pop.cmd를 스트링 이어붙이기로 처리한 코드가 많으나 Swift에서는 시간 초과 발생
   - 풀이 출처에서는 숫자로 연산해서 더한다음에 결과 표시할 때 숫자를 캐릭터 배열로 재분해해서 표시
 - Swift에서는 마이너스의 나머지 연산결과가 다른 프로그래밍 언어(파이썬)와 다르므로 주의
 - 풀이방법 자체는 다른 BFS 문제 풀이와 비슷하지만 여러 군데에 Swift와는 맞지 않는 함정이 있었음
 
 [풀이] https://dev-mandos.tistory.com/287
 "BFS를 수행하면서, queue에 명령어를 String으로 넣어줬는데 시간초과 판정을 받았습니다."
 
 "String 값을 더해주는 것도 O(1)이지만, 일반적으로 정수 덧셈 연산 보다는 느리기 때문에 시간초과 판정을 받은 것 같습니다."
 "정수를 더하는 방식으로 변경하므로써 해결할 수 있었습니다."
 
 - registerCmd 배열이 1부터 시작하는 이유
  => pop.cmd의 연산 과정에서 Int값에 0을 더하면 변화가 없기 때문에 나중에 명령 목록을 파악할 수 없음
 
 -----
 
 문제
 네 개의 명령어 D, S, L, R 을 이용하는 간단한 계산기가 있다. 이 계산기에는 레지스터가 하나 있는데, 이 레지스터에는 0 이상 10,000 미만의 십진수를 저장할 수 있다. 각 명령어는 이 레지스터에 저장된 n을 다음과 같이 변환한다. n의 네 자릿수를 d1, d2, d3, d4라고 하자(즉 n = ((d1 × 10 + d2) × 10 + d3) × 10 + d4라고 하자)

 D: D 는 n을 두 배로 바꾼다. 결과 값이 9999 보다 큰 경우에는 10000 으로 나눈 나머지를 취한다. 그 결과 값(2n mod 10000)을 레지스터에 저장한다.
 S: S 는 n에서 1 을 뺀 결과 n-1을 레지스터에 저장한다. n이 0 이라면 9999 가 대신 레지스터에 저장된다.
 L: L 은 n의 각 자릿수를 왼편으로 회전시켜 그 결과를 레지스터에 저장한다. 이 연산이 끝나면 레지스터에 저장된 네 자릿수는 왼편부터 d2, d3, d4, d1이 된다.
 R: R 은 n의 각 자릿수를 오른편으로 회전시켜 그 결과를 레지스터에 저장한다. 이 연산이 끝나면 레지스터에 저장된 네 자릿수는 왼편부터 d4, d1, d2, d3이 된다.
 위에서 언급한 것처럼, L 과 R 명령어는 십진 자릿수를 가정하고 연산을 수행한다. 예를 들어서 n = 1234 라면 여기에 L 을 적용하면 2341 이 되고 R 을 적용하면 4123 이 된다.

 여러분이 작성할 프로그램은 주어진 서로 다른 두 정수 A와 B(A ≠ B)에 대하여 A를 B로 바꾸는 최소한의 명령어를 생성하는 프로그램이다. 예를 들어서 A = 1234, B = 3412 라면 다음과 같이 두 개의 명령어를 적용하면 A를 B로 변환할 수 있다.

 1234 →L 2341 →L 3412
 1234 →R 4123 →R 3412

 따라서 여러분의 프로그램은 이 경우에 LL 이나 RR 을 출력해야 한다.

 n의 자릿수로 0 이 포함된 경우에 주의해야 한다. 예를 들어서 1000 에 L 을 적용하면 0001 이 되므로 결과는 1 이 된다. 그러나 R 을 적용하면 0100 이 되므로 결과는 100 이 된다.

 입력
 프로그램 입력은 T 개의 테스트 케이스로 구성된다. 테스트 케이스 개수 T 는 입력의 첫 줄에 주어진다. 각 테스트 케이스로는 두 개의 정수 A와 B(A ≠ B)가 공백으로 분리되어 차례로 주어지는데 A는 레지스터의 초기 값을 나타내고 B는 최종 값을 나타낸다. A 와 B는 모두 0 이상 10,000 미만이다.

 출력
 A에서 B로 변환하기 위해 필요한 최소한의 명령어 나열을 출력한다. 가능한 명령어 나열이 여러가지면, 아무거나 출력한다.

 예제 입력 1
 3
 1234 3412
 1000 1
 1 16
 
 예제 출력 1
 LL
 L
 DDDD
 
 [반례]
 
1
0 9999
 ans: S
 
1
5001 2
 ans: D
 
 
 */
