//
//  9935.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/29/2024.
//
//  1: 문자열 폭발 https://www.acmicpc.net/problem/9935
//

import Foundation

/// 문자열 폭발 https://www.acmicpc.net/problem/9935
/// - 스택1 : 109360KB    964ms
func Q_9935() {
    let textArr = readLine()!.map(String.init)
    let ignitionText = readLine()!.map(String.init)
    let popCount = ignitionText.count - 1
    var stack = [String]()
    
    func peekText(_ count: Int) -> [String] {
        guard stack.count - count <= stack.count - 1 else {
            return []
        }
        
        return Array(stack[(stack.count - count)...(stack.count - 1)])
    }
    
    if textArr.count == 1 {
        print(textArr == ignitionText ? "FRULA" : textArr.joined())
    } else {
        for char in textArr {
            if stack.count >= popCount, ignitionText == peekText(popCount) + [char] {
                stack.removeLast(popCount)
            } else {
                stack.append(char)
            }
        }
        
        print(stack.isEmpty ? "FRULA" : stack.joined())
    }
}

/// 문자열 폭발 https://www.acmicpc.net/problem/9935
/// - 스택2 : 109360KB    160ms
func Q_9935_______() {
    let textArr = readLine()!.map(String.init)
    let ignitionText = readLine()!.map(String.init)
    var stack = [String]()
    
    for char in textArr {
        stack.append(char)
        
        if stack.count >= ignitionText.count {
            var isExplosive = true
            
            let indexViaStack = stack.count - ignitionText.count
            for j in 0..<ignitionText.count where stack[indexViaStack + j] != ignitionText[j] {
                isExplosive = false
                break
            }
            
            if isExplosive {
                for _ in 0..<ignitionText.count {
                    stack.removeLast()
                }
            }
        }
    }
    
    print(stack.isEmpty ? "FRULA" : stack.joined())
}

/// 문자열 폭발 https://www.acmicpc.net/problem/9935
/// - 브루트포스 : 시간 초과
func Q_9935_() {
    var text = readLine()!
    let ignitionText = readLine()!
    
    while text.contains(ignitionText) {
        text = text.replacingOccurrences(of: ignitionText, with: "")
    }
    
    print(text.isEmpty ? "FRULA" : text)
}

/*
 [풀이]
 스택 1:
 - 문장 텍스트를 한 글자씩 순회하면서 폭발 텍스트의 마지막을 만났다면
 - (스택의 글자들 + 마지막 글자)가 폭발 텍스트인지 여부 확인
 - 폭발 텍스트이면 폭발시키고 아니면 스택에 넣음
 
 스택 2:
 - 문장 텍스트를 순회하면서 스택에 한 글자씩 넣음
 - stack.count >= ignitionText.count인 경우 폭발 가능성이 있으므로
   - (스택의 글자들 + 마지막 글자)가 폭발 텍스트인지 여부 확인 (for문 사용하면 시간단축됨)
   - 폭발 텍스트와 모든 글자가 동일하다면 폭파시키고, 한 글자라도 다르면 폭발 가능성 없음 처리하고 중단
 
 ----------
 
 문제
 상근이는 문자열에 폭발 문자열을 심어 놓았다. 폭발 문자열이 폭발하면 그 문자는 문자열에서 사라지며, 남은 문자열은 합쳐지게 된다.

 폭발은 다음과 같은 과정으로 진행된다.

 문자열이 폭발 문자열을 포함하고 있는 경우에, 모든 폭발 문자열이 폭발하게 된다. 남은 문자열을 순서대로 이어 붙여 새로운 문자열을 만든다.
 새로 생긴 문자열에 폭발 문자열이 포함되어 있을 수도 있다.
 폭발은 폭발 문자열이 문자열에 없을 때까지 계속된다.
 상근이는 모든 폭발이 끝난 후에 어떤 문자열이 남는지 구해보려고 한다. 남아있는 문자가 없는 경우가 있다. 이때는 "FRULA"를 출력한다.

 폭발 문자열은 같은 문자를 두 개 이상 포함하지 않는다.

 입력
 첫째 줄에 문자열이 주어진다. 문자열의 길이는 1보다 크거나 같고, 1,000,000보다 작거나 같다.

 둘째 줄에 폭발 문자열이 주어진다. 길이는 1보다 크거나 같고, 36보다 작거나 같다.

 두 문자열은 모두 알파벳 소문자와 대문자, 숫자 0, 1, ..., 9로만 이루어져 있다.

 출력
 첫째 줄에 모든 폭발이 끝난 후 남은 문자열을 출력한다.

 예제 입력 1
 mirkovC4nizCC44
 C4
 
 예제 출력 1
 mirkovniz
 
 예제 입력 2
 12ab112ab2ab
 12ab
 
 예제 출력 2
 FRULA
 
 
 [반례]
 
 a
 a
 answer: FRULA
 
 a
 b
 a
 
 ab
 ac
 ab
 
 ab
 a
 b
 
 abc
 bc
 a
 
 abc
 d
 abc
 */
