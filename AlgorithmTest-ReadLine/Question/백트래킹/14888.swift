//
//  14888.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/16/24.
//

// import Foundation

func Q_14888_() {
    _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    let operators = readLine()!.split(separator: " ").map { Int($0)! }.enumerated().map { index, count in
        Array(repeating: ["+", "-", "*", "/"][index], count: count)
    }.flatMap { $0 }
    
    var usedArr = Array(repeating: false, count: operators.count)
    var prevCombi: [String] = []
    var combi = Array(repeating: "", count: operators.count)
    var maxValue = Int.min, minValue = Int.max
    
    func operate(operatorCombi: [String]) {
        var result = numbers.first!
        
        for i in 1..<numbers.count {
            switch operatorCombi[i - 1] {
            case "+":
                result += numbers[i]
            case "-":
                result -= numbers[i]
            case "*":
                result *= numbers[i]
            case "/":
                result /= numbers[i]
            default:
                break
            }
        }
        
        maxValue = max(maxValue, result)
        minValue = min(minValue, result)
    }
    
    
    func backtracking(_ x: Int = 0) {
        if prevCombi == combi {
            return
        }
        
        if x == operators.count {
            prevCombi = combi
            // 값 계산
            operate(operatorCombi: combi)
            return
        }
        
        for i in 0..<operators.count where !usedArr[i] {
            combi[x] = operators[i]
            usedArr[i] = true
            backtracking(x + 1)
            usedArr[i] = false
        }
    }
    
    // 연산자 조합 생성
    backtracking()
    print("\(maxValue)\n\(minValue)")
}

func Q_14888() {
    _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var operators = readLine()!.split(separator: " ").map { Int($0)! }
    let operates: [(Int, Int) -> Int] = [
        { $0 + $1 }, { $0 - $1 }, { $0 * $1 }, { $0 / $1 },
    ]
    
    var maxValue = Int.min, minValue = Int.max
    
    func backtracking(index: Int = 1, sum: Int = numbers.first!) {
        if index >= numbers.count {
            maxValue = max(maxValue, sum)
            minValue = min(minValue, sum)
            return
        }
        
        for i in operates.indices where operators[i] >= 1 {
            operators[i] -= 1
            backtracking(index: index + 1, sum: operates[i](sum, numbers[index]))
            operators[i] += 1
        }
    }
    
    backtracking()
    print("\(maxValue)\n\(minValue)")
}

/*
[풀이]
 - 상단: N과 M (9)번과 유사
   - 연산자 구하기는 백트래킹, 계산 및 최소최대 도출은 완전탐색
 
연산자 끼워넣기 https://www.acmicpc.net/problem/14888

N개의 수로 이루어진 수열 A1, A2, ..., AN이 주어진다. 또, 수와 수 사이에 끼워넣을 수 있는 N-1개의 연산자가 주어진다. 연산자는 덧셈(+), 뺄셈(-), 곱셈(×), 나눗셈(÷)으로만 이루어져 있다.

우리는 수와 수 사이에 연산자를 하나씩 넣어서, 수식을 하나 만들 수 있다. 이때, 주어진 수의 순서를 바꾸면 안 된다.

예를 들어, 6개의 수로 이루어진 수열이 1, 2, 3, 4, 5, 6이고, 주어진 연산자가 덧셈(+) 2개, 뺄셈(-) 1개, 곱셈(×) 1개, 나눗셈(÷) 1개인 경우에는 총 60가지의 식을 만들 수 있다. 예를 들어, 아래와 같은 식을 만들 수 있다.

1+2+3-4×5÷6
1÷2+3+4-5×6
1+2÷3×4-5+6
1÷2×3-4+5+6

식의 계산은 연산자 우선 순위를 무시하고 앞에서부터 진행해야 한다. 또, 나눗셈은 정수 나눗셈으로 몫만 취한다. 음수를 양수로 나눌 때는 C++14의 기준을 따른다. 즉, 양수로 바꾼 뒤 몫을 취하고, 그 몫을 음수로 바꾼 것과 같다. 이에 따라서, 위의 식 4개의 결과를 계산해보면 아래와 같다.

1+2+3-4×5÷6 = 1
1÷2+3+4-5×6 = 12
1+2÷3×4-5+6 = 5
1÷2×3-4+5+6 = 7

N개의 수와 N-1개의 연산자가 주어졌을 때, 만들 수 있는 식의 결과가 최대인 것과 최소인 것을 구하는 프로그램을 작성하시오.

입력
첫째 줄에 수의 개수 N(2 ≤ N ≤ 11)가 주어진다. 둘째 줄에는 A1, A2, ..., AN이 주어진다. (1 ≤ Ai ≤ 100) 셋째 줄에는 합이 N-1인 4개의 정수가 주어지는데, 차례대로 덧셈(+)의 개수, 뺄셈(-)의 개수, 곱셈(×)의 개수, 나눗셈(÷)의 개수이다.

출력
첫째 줄에 만들 수 있는 식의 결과의 최댓값을, 둘째 줄에는 최솟값을 출력한다. 연산자를 어떻게 끼워넣어도 항상 -10억보다 크거나 같고, 10억보다 작거나 같은 결과가 나오는 입력만 주어진다. 또한, 앞에서부터 계산했을 때, 중간에 계산되는 식의 결과도 항상 -10억보다 크거나 같고, 10억보다 작거나 같다.

예제 입력 1
2
5 6
0 0 1 0
예제 출력 1
30
30

예제 입력 2
3
3 4 5
1 0 1 0
예제 출력 2
35
17

예제 입력 3
6
1 2 3 4 5 6
2 1 1 1
예제 출력 3
54
-24

힌트
세 번째 예제의 경우에 다음과 같은 식이 최댓값/최솟값이 나온다.
최댓값: 1-2÷3+4+5×6
최솟값: 1+2+3÷4-5×6
*/
