//
//  11659.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/2024.
//
//  1: 구간 합 구하기 4 https://www.acmicpc.net/problem/11659
//

import Foundation

/// 구간 합 구하기 4 https://www.acmicpc.net/problem/11659
func Q_11659() {
    let m = readLine()!.split(separator: " ").map { Int($0)! }[1]
    var numbers = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    
    // 슬라이딩 윈도우
    for i in 2..<numbers.count {
        numbers[i] += numbers[i - 1]
    }
    
    var result = ""
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (start, end) = (input[0], input[1])
        result.write("\(numbers[end] - numbers[start - 1])\n")
    }
    
    print(result)
}

/// 구간 합 구하기 4 https://www.acmicpc.net/problem/11659
func Q_11659_시간초과() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (_, m) = (input[0], input[1])
    let numbers = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    
    var result = ""
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (start, end) = (input[0], input[1])
        result.write("\(numbers[start...end].reduce(0, +))\n")
    }
    
    print(result)
}

/*
 [풀이]
 구간합 구하기 https://rujang.tistory.com/entry/백준-11659번-구간-합-구하기-4-CC
  
 1. 슬라이딩 윈도우
 - 각 원소가 누적합(=> 그 원소까지의 총합)을 담은 배열을 만든 뒤
   a[끝자리] - a[시작자리 - 1]을 하면 원하는 결과가 나옴
 
 ---------
 
 문제 (시간 제한: 1초)
 수 N개가 주어졌을 때, i번째 수부터 j번째 수까지 합을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 수의 개수 N과 합을 구해야 하는 횟수 M이 주어진다. 둘째 줄에는 N개의 수가 주어진다. 수는 1,000보다 작거나 같은 자연수이다. 셋째 줄부터 M개의 줄에는 합을 구해야 하는 구간 i와 j가 주어진다.

 출력
 총 M개의 줄에 입력으로 주어진 i번째 수부터 j번째 수까지 합을 출력한다.

 제한
 1 ≤ N ≤ 100,000
 1 ≤ M ≤ 100,000
 1 ≤ i ≤ j ≤ N
 
 예제 입력 1
 5 3
 5 4 3 2 1
 1 3
 2 4
 5 5
 
 예제 출력 1
 12
 9
 1
 */
