//
//  17609.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2024/01/18.
//

import Foundation

func Q_17609() {
    /// 유사회문 찾기: https://newdeal123.tistory.com/13
    func canPalindrome(_ wordArr: [String], _ left: Int, _ right: Int, _ canSkip: Bool) -> Bool {
        if left > right {
            return true
        }
        
        if wordArr[left] == wordArr[right] {
            return canPalindrome(wordArr, left + 1, right - 1, canSkip)
        } else if canSkip {
            return canPalindrome(wordArr, left + 1, right, false) || canPalindrome(wordArr, left, right - 1, false)
        } else {
            return false
        }
    }
    
    let T = Int(readLine()!)!
    // **스트링을 배열화하려면 .map(String.init) 사용**
    // split(seperator:)는 제출시 에러
    let wordArrs = (0..<T).map { _ in readLine()!.map(String.init) }
    
    for wordArr in wordArrs {
        let mid = wordArr.count / 2
        let left = wordArr[0..<mid].joined()
        let isOdd = wordArr.count % 2 != 0
        let rightReversed = wordArr[(isOdd ? mid + 1 : mid)...].reversed().joined() // reversed: O(1)
        
        // 확실한 회문이면 넘어가기
        if left == rightReversed {
            print(0)
            continue
        }
        
        // 1(유사회문): summuus, xabba, comwwtmoc
        // 2(X): xabbay, comcom // xavcFcvay, xababy, suasdfrevvds
        print(canPalindrome(wordArr, 0, wordArr.count - 1, true) ? "1" : "2")
    }
}

/*
 문제
 회문(回文) 또는 팰린드롬(palindrome)은 앞 뒤 방향으로 볼 때 같은 순서의 문자로 구성된 문자열을 말한다. 예를 들어 ‘abba’ ‘kayak’, ‘reviver’, ‘madam’은 모두 회문이다. 만일 그 자체는 회문이 아니지만 한 문자를 삭제하여 회문으로 만들 수 있는 문자열이라면 우리는 이런 문자열을 “유사회문”(pseudo palindrome)이라고 부른다. 예를 들어 ‘summuus’는 5번째나 혹은 6번째 문자 ‘u’를 제거하여 ‘summus’인 회문이 되므로 유사회문이다.

 여러분은 제시된 문자열을 분석하여 그것이 그 자체로 회문인지, 또는 한 문자를 삭제하면 회문이 되는 “유사회문”인지, 아니면 회문이나 유사회문도 아닌 일반 문자열인지를 판단해야 한다. 만일 문자열 그 자체로 회문이면 0, 유사회문이면 1, 그 외는 2를 출력해야 한다.

 입력
 입력의 첫 줄에는 주어지는 문자열의 개수를 나타내는 정수 T(1 ≤ T ≤ 30)가 주어진다. 다음 줄부터 T개의 줄에 걸쳐 한 줄에 하나의 문자열이 입력으로 주어진다. 주어지는 문자열의 길이는 3 이상 100,000 이하이고, 영문 알파벳 소문자로만 이루어져 있다.

 출력
 각 문자열이 회문인지, 유사 회문인지, 둘 모두 해당되지 않는지를 판단하여 회문이면 0, 유사 회문이면 1, 둘 모두 아니면 2를 순서대로 한 줄에 하나씩 출력한다.

 예제 입력 1
7
abba
summuus
xabba
xabbay
comcom
comwwmoc
comwwtmoc
 
 예제 출력 1
 0
 1
 1
 2
 2
 0
 1
 
 https://newdeal123.tistory.com/13
 
 canPalindrome 동작방식
 1. left(포인터)가 right(포인터) 값보다 작을 때 진행
  - right가 같거나 큰 경우 유사회문
 2. 양 포인터가 가리키는 값이 같으면 left + 1, right - 1
  - canSkip 변경안함
 3. canSkip이 아직 true인경우(한글자 제거안함)
  - left + 1과 right - 1 나눠서 재귀
  - 두 갈래서 도출된 값 중 하나라도 true라면 그거 반환 (or)
 4. 나머지 경우 유사회문 될수 없으므로 false
 
 
 예) xabba
 1. x, a 다름
 2. canSkip 아직 남아있으므로 동작방식 (3)번 실행
  - left 이동: abba => a == a
                        => bb => b == b (true)
  - right 이동: xabb => x != b
                        canSkip true (사용)
                        => x != b (false)
                        => a != b (false)
  - true || false = true
 
 예) summuus
 1. s, s 똑같음
 2. u, u 똑같음
 3. m != u => canSkip 아직 남아있으므로 동작방식 (3)번 실행
  - left 이동: mu => m != u (false)
  - right 이동: mm => m == m
             left = 2 + 1 = 3, right = 3 - 1 = 2 => 포인터 위치 역전되었으므로 true
 */
