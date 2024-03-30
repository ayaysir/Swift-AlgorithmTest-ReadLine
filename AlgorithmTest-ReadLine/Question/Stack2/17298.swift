//
//  17298.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/29/2024.
//
//  2: 오큰수 https://www.acmicpc.net/problem/17298
//

import Foundation

/// 오큰수 https://www.acmicpc.net/problem/17298
func Q_17298_() {
    let n = Int(readLine()!)!
    let numbers: [(i: Int, v: Int)] = readLine()!.split(separator: " ").enumerated().map { ($0.offset, Int($0.element)!) }
    var stack = [numbers.first!]
    var result = Array(repeating: 0, count: n)
    
    for i in 1..<n {
        while !stack.isEmpty, stack.last!.v < numbers[i].v {
            result[stack.last!.i] = numbers[i].v
            stack.removeLast()
        }
        
        stack.append(numbers[i])
    }
    
    // 남은 스택 정리
    while !stack.isEmpty {
        let last = stack.removeLast()
        result[last.i] = -1
    }
    
    print(result.map(String.init).joined(separator: " "))
}

/// 오큰수 https://www.acmicpc.net/problem/17298
func Q_17298() {
    let n = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var stack = [0]
    var result = Array(repeating: 0, count: n)
    
    for i in 1..<n {
        while !stack.isEmpty, numbers[stack.last!] < numbers[i] {
            result[stack.removeLast()] = numbers[i]
        }
        
        stack.append(i)
    }
    
    // 남은 스택 정리
    for s in stack {
        result[s] = -1
    }
    
    print(result.map(String.init).joined(separator: " "))
}

func Q_17298_SHORT() {
    // var n=Int(readLine()!)!,a=readLine()!.split{$0==" "}.map{Int($0)!},s=[a[0]]
    // (1..<n).map{i in while !s.isEmpty,a[s.last!]<a[i]{a[s.popLast()!]=a[i]};s+=[i]}
    // s.map{a[$0] = -1}
    // print(a.map{"\($0) "}.joined())
}

/*
 [풀이]
 스택 사용
  - 스택에서 값을 꺼내서 현재 숫자보다 작다면 해당 인덱스의 숫자를 오큰수로 바꾼다.
   - 현재 숫자보다 큰 숫자가 나올때까지 반복
   - 위 과정이 끝나면 현재 숫자(또는 인덱스)를 스택에 넣는다.
  - 스택에 남은 값에 해당하는 인덱스는 오큰수가 없으므로 -1로 대체
 참고
   - 입력받을 때 튜플 대신 값만 받고, 스택에 인덱스만 넣어도 됨. 꺼냈을 때 numbers[stack.last!]로 읽음.
   - 결과 배열을 따로 만드는 대신 numbers 배열에 덮어씌울 수 있음
 
 ---------
 
 크기가 N인 수열 A = A1, A2, ..., AN이 있다. 수열의 각 원소 Ai에 대해서 오큰수 NGE(i)를 구하려고 한다. Ai의 오큰수는 오른쪽에 있으면서 Ai보다 큰 수 중에서 가장 왼쪽에 있는 수를 의미한다. 그러한 수가 없는 경우에 오큰수는 -1이다.

 예를 들어, A = [3, 5, 2, 7]인 경우 NGE(1) = 5, NGE(2) = 7, NGE(3) = 7, NGE(4) = -1이다. A = [9, 5, 4, 8]인 경우에는 NGE(1) = -1, NGE(2) = 8, NGE(3) = 8, NGE(4) = -1이다.

 입력
 첫째 줄에 수열 A의 크기 N (1 ≤ N ≤ 1,000,000)이 주어진다. 둘째 줄에 수열 A의 원소 A1, A2, ..., AN (1 ≤ Ai ≤ 1,000,000)이 주어진다.

 출력
 총 N개의 수 NGE(1), NGE(2), ..., NGE(N)을 공백으로 구분해 출력한다.

 예제 입력 1
 4
 3 5 2 7
 예제 출력 1
 5 7 7 -1
 
 예제 입력 2
 4
 9 5 4 8
 예제 출력 2
 -1 8 8 -1
 */
