//
//  16139.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/2024.
//
//  3: 인간-컴퓨터 상호작용 https://www.acmicpc.net/problem/16139
//

// import Foundation

/// 인간-컴퓨터 상호작용 https://www.acmicpc.net/problem/16139
/// - 126372KB    476ms (100점)
func Q_16139() {
    let text = [""] + readLine()!.map(String.init)
    var freqs = Array(repeating: Array(repeating: 0, count: 26), count: text.count)
    
    for i in 1..<text.count {
        freqs[i] = freqs[i-1]
        let letterCode = Int(UnicodeScalar(text[i])!.value) - 97
        freqs[i][letterCode] += 1
    }
    
    var result = ""
    for _ in 0..<Int(readLine()!)! {
        let command = readLine()!.split(separator: " ")
        let letterCode = Int(UnicodeScalar(String(command[0]))!.value) - 97
        let (startIndex, endIndex) = (Int(command[1])! + 1, Int(command[2])! + 1)
        result.write("\(freqs[endIndex][letterCode] - freqs[startIndex - 1][letterCode])\n")
    }
    
    print(result)
}

/*
 [풀이]
 - 구간합 구하기(11659) 슬라이딩 윈도우 기법 응용
 - 알파벳별로 26개 칸을 가지는 배열을 만들어서 26개마다 슬라이딩 윈도우 기법으로 누적시키면 됨
 - 알파벳 배열 인덱스 = 아스키코드 - 97(a) 로 사용
   - 다른 풀이에서 알파벳 저장용으로 사전을 썼는데 500ms대 나온거 봐선 별 차이 없는듯
 
 -----------------

 [예제 입력 1]
seungjaehwang
4
a 0 5
a 0 6
a 6 10
a 7 10
 
 [예제 출력 1]
 0
 1
 2
 1
 */
