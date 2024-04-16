//
//  10886.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/14/24.
//

import Foundation

/// 0 = not cute / 1 = cute https://www.acmicpc.net/problem/10886
func Q_10886() {
    let n = Int(readLine()!)!
    var cuteCount = 0
    for _ in 0..<n {
        cuteCount += Int(readLine()!)! == 1 ? 1 : 0
    }
    
    let isCute = cuteCount > n - cuteCount
    print("Junhee is", isCute ? "cute!" : "not cute!")
}

/*
 [풀이
 => 선택지가 2개일 때 누가 더 많은 의견인지 구하는 방법: cuteCount와 n - cuteCount를 비교
 
 -----
 
 문제
 준희는 자기가 팀에서 귀여움을 담당하고 있다고 생각한다. 하지만 연수가 볼 때 그 의견은 뭔가 좀 잘못된 것 같았다. 그렇기에 설문조사를 하여 준희가 귀여운지 아닌지 알아보기로 했다.

 입력
 첫 번째 줄에 설문조사를 한 사람의 수 N (1 ≤ N ≤ 101, N은 홀수)가 주어진다.

 다음 N개의 줄에는 각 줄마다 각 사람이 설문 조사에 어떤 의견을 표명했는지를 나타내는 정수가 주어진다. 0은 준희가 귀엽지 않다고 했다는 뜻이고, 1은 준희가 귀엽다고 했다는 뜻이다.

 출력
 준희가 귀엽지 않다는 의견이 더 많을 경우 "Junhee is not cute!"를 출력하고 귀엽다는 의견이 많을 경우 "Junhee is cute!"를 출력하라.

 예제 입력 1
 3
 1
 0
 0
 
 예제 출력 1
 Junhee is not cute!
 */
