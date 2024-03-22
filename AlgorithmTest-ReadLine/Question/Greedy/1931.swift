//
//  1931.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/2024.
//
//  2: 회의실 배정 https://www.acmicpc.net/problem/1931
//

import Foundation

/// 회의실 배정 https://www.acmicpc.net/problem/1931
func Q_1931() {
    let n = Int(readLine()!)!
    let times = (0..<n)
        .map { _ in readLine()!.split(separator: " ").map { Int($0)! } }
        .sorted { a, b in
            if a[1] == b[1] {
                return a[0] < b[0]
            }
            
            return a[1] < b[1]
        }
    
    var endTime = times[0][1], answer = 1
    
    for i in 1..<n {
        let startTime = times[i][0]
        if startTime >= endTime {
            endTime = times[i][1]
            answer += 1
        }
    }
    
    print(answer)
}

/*
 [풀이] https://wikidocs.net/206266
 "활동 선택 문제 (Activity-Selection Problem)"
 - 여러가지 활동이 있을 때 어떤 사람이 수행할 수 있는 활동의 최대 갯수를 구하는 문제
 - 한 사람이 할 수 있는 활동의 최대 갯수와, 여러 회의를 한 회의실에 배정하는 문제는 같은 형태
 
 "최대한 많은 시간을 확보한다"
 - 최대한 빨리 회의가 종료 되어야
 - 가장 빨리 끝나는 회의를 기준으로 이 회의와 겹치는 회의는 모두 제거
 - 다음으로 겹치지 않는 가장 빨리 끝나는 회의를 찾습니다
 
 ⏺️0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 1️⃣⬜️🟩🟩🟩🟩          <= (1, 4)
 2️⃣⬜️⬜️⬜️🟥🟥🟥        <= (3, 5) 회의 1의 끝나는 시간과 겹치므로 제거
 3️⃣🟥🟥🟥🟥🟥🟥🟥      <= (0, 6) 회의 1의 끝나는 시간과 겹치므로 제거
 4️⃣⬜️⬜️⬜️⬜️⬜️🟩🟩🟩    <= (5, 7) 겹치지 않으므로 추가

 */
