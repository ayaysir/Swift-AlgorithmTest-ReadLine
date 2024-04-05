//
//  1450.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/5/2024.
//
//  5: 냅색문제 https://www.acmicpc.net/problem/1450
//

import Foundation

/// 냅색문제 https://www.acmicpc.net/problem/1450
func Q_1450() {
    let c = readLine()!.split(separator: " ").map { Int($0)! }[1]
    let weights = readLine()!.split(separator: " ").map { Int($0)! }
    
    var setA = [Int]()
    var setB = [Int]()
    
    func findUpperBound(of sortedArray: [Int], value: Int) -> Int {
        var (l, r) = (0, sortedArray.count - 1)
        
        while l <= r {
            let mid = (l + r) / 2
            
            if sortedArray[mid] > value {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        
        return l
    }
    
    func dfs(_ l: Int, _ r: Int, _ set: inout [Int], _ sum: Int = 0) {
        if sum > c {
            return
        }
        
        if l == r {
            set.append(sum)
            return
        }
        
        dfs(l + 1, r, &set, sum)
        dfs(l + 1, r, &set, sum + weights[l])
    }
    
    let midIndex = weights.count / 2
    dfs(0, midIndex, &setA)
    dfs(midIndex, weights.count, &setB)
    // setA.sort()
    setB.sort()
    print(setA, setB)
    
    var result = 0
    
    // for weight in setB {
    //     print(findUpperBound(of: setA, value: c - weight), c, weight, c-weight)
    //     result += findUpperBound(of: setA, value: c - weight)
    // }
    
    for weight in setA {
        result += findUpperBound(of: setB, value: c - weight)
    }
    
    print(result)
}

/*
 [풀이] https://dev-mandos.tistory.com/279
 - 중간에서 만나기 (Meet in the Middle) 알고리즘
 - 예) [1, 2, 3, 4] 인 경우
   - 반으로 배열을 나눔: [1, 2] / [3, 4]
     - DFS로 처리
   - 주 접근 배열의 상대 배열은 오름차순 정렬
   - 각각의 경우의 수: 4개 / 4개 (=>[0, 1, 2, 3] / [0, 3, 4](정렬됨))
 - 가방에 최대 5만큼 넣을 수 있다고 가정
   - [1, 2]에 대해 구한 무게로 접근
    (1) 가방에 0을 넣으면 [3, 4]에서는 => 5 - 0 = 5 => [0, 3, 4] upperBoundIndex = 3
    (2) 가방에 1을 넣으면 [3, 4]에서는 => 5 - 1 = 4 => [0, 3, 4] upperBoundIndex = 3
    (3) 가방에 2를 넣으면 [3, 4]에서는 => 5 - 2 = 3 => [0, 3, 4] upperBoundIndex = 2
    (3) 가방에 3를 넣으면 [3, 4]에서는 => 5 - 3 = 2 => [0, 3, 4] upperBoundIndex = 1
    => 3 + 3 + 2 + 1 = 9
 
   - 반대로 접근: [3, 4]에 대해 구한 무게로 접근
     +------------+------------+------------+------------+
     | upperBound |      C     |   weight   | C - weight |
     +============+============+============+============+
     |      4     |      5     |      0     |      5     |
     +------------+------------+------------+------------+
     |      3     |      5     |      3     |      2     |
     +------------+------------+------------+------------+
     |      2     |      5     |      4     |      1     |
     +------------+------------+------------+------------+
     => 4 + 3 + 2 = 9
 
     ** 경우의 수 = [가방에 최대 넣을 수 있는 무게] - [setB/A의 무게에 대해서 setA/B의 무게의 upperboundIndex]
 
 ------
 
 문제
 세준이는 N개의 물건을 가지고 있고, 최대 C만큼의 무게를 넣을 수 있는 가방을 하나 가지고 있다.

 N개의 물건을 가방에 넣는 방법의 수를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 N과 C가 주어진다. N은 30보다 작거나 같은 자연수, C는 109보다 작거나 같은 음이 아닌 정수이다. 둘째 줄에 물건의 무게가 주어진다. 무게도 109보다 작거나 같은 자연수이다.

 출력
 첫째 줄에 가방에 넣는 방법의 수를 출력한다.
 
 [예제]
4 5
1 2 3 4
 ans: 9

 예제 입력 1
 2 1
 1 1
 
 예제 출력 1
 3
 
 예제 입력 2
 1 1
 1
 
 예제 출력 2
 2
 
 예제 입력 3
 1 2
 1
 
 예제 출력 3
 2
 
 예제 입력 4
 2 1
 2 2
 
 예제 출력 4
 1
 
 예제 입력 5
 2 2
 1 1
 
 예제 출력 5
 4
 
 예제 입력 6
 30 30
 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 
 예제 출력 6
 1073741824
 */
