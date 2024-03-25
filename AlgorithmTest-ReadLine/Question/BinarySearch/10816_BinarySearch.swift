//
//  10816_BinarySearch.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/25/24.
//

import Foundation

///  숫자 카드 2 https://www.acmicpc.net/problem/10816 - 이분 탐색
func Q_10816() {
    _ = readLine()
    let refs = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    var result = "", _ = readLine()
    
    readLine()!.split(separator: " ").map { Int($0)! }.forEach { number in
        result.write("\(bound(to: .upper, number) - bound(to: .lower, number)) ")
    }
    
    print(result)
    
    enum Bound { case lower, upper }
    
    func bound(to bound: Bound, _ number: Int) -> Int {
        var start = 0, end = refs.count
        
        while start < end {
            let mid = (start + end) / 2
            
            let firstCondition = bound == .lower ? number <= refs[mid] : number < refs[mid]
            if firstCondition {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        return start
    }
}

/*
 [풀이] https://st-lab.tistory.com/267
 중복 원소가 있는 경우의 이분 탐색
  - lowerBound: 중복된 원소를 포함한 곳의 가장 왼쪽 인덱스
   => x '이상'의 값을 가진 인덱스(의 처음)
  - upperBound: 중복된 원소의 가장 오른쪽에서 1 초과한 곳의 인덱스
   => x '초과'의 값을 가진 인덱스(의 처음)
 
 (예) element = 4, lowerBound = 3, upperBound = 6
    element = 5(없음), lowerBound = 6, upperBound = 6
  element: 1 2 2 4 4 4 6 7 7 9
      idx: 0 1 2 3 4 5 6 7 8 9
 
  중복 원소에 대한 길이 = (상한 - 하한)
  - 상한/하한을 구하는 함수의 차이는 단 한곳이다. (29번라인) 뭔 차이인가?
  - lowerBound는 같은 값을 찾았다 하더라도 mid를 계속 내린다.
  - upperBound는 같은 값은 start + 1을 하고 초과했을 때만 mid를 내린다.
 
 */
