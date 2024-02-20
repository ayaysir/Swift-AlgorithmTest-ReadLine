//
//  1018.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/20/24.
//

import Foundation

func Q_1018() {
    /// 원래 보드를 생성
    func correctBoard(_ isWhite: Bool) -> [[String]] {
        var isWhite = isWhite
        var board: [[String]] = .init(repeating: .init(repeating: "", count: 8), count: 8)
        
        for i in 0..<8 {
            for j in 0..<8 {
                board[i][j] = isWhite ? "W" : "B"
                
                if j != 7 {
                    isWhite.toggle()
                }
            }
        }
        
        return board
    }
    
    /// 입력한 보드와 original을 비교해서 틀린 개수 반환
    func compareBoards(_ n: Int, _ m: Int, to original: [[String]]) -> Int {
        var replaced = 0
        
        for i in 0..<8 {
            for j in 0..<8 {
                if original[i][j] != board[n + i][m + j] {
                    replaced += 1
                }
            }
        }
        
        return replaced
    }
    
    // 문제풀이
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (N, M) = (r[0], r[1])
    var board: [[String]] = .init(repeating: [], count: N + 1)
    
    let whiteStart8x8 = correctBoard(true)
    let blackStart8x8 = correctBoard(false)
    
    for i in 1...N {
        board[i] = [""] + readLine()!.map(String.init)
    }
    
    var minReplaced = Int.max // 최소 교체 회수
    for n in 1...(N - 7) {
        for m in 1...(M - 7) {
            let whiteReplaced = compareBoards(n, m, to: whiteStart8x8)
            let blackReplaced = compareBoards(n, m, to: blackStart8x8)
            minReplaced = min(minReplaced, whiteReplaced, blackReplaced)
        }
    }
    
    print(minReplaced)
}


/*
체스판 다시 칠하기 https://www.acmicpc.net/problem/1018

문제
지민이는 자신의 저택에서 MN개의 단위 정사각형으로 나누어져 있는 M×N 크기의 보드를 찾았다. 어떤 정사각형은 검은색으로 칠해져 있고, 나머지는 흰색으로 칠해져 있다. 지민이는 이 보드를 잘라서 8×8 크기의 체스판으로 만들려고 한다.

체스판은 검은색과 흰색이 번갈아서 칠해져 있어야 한다. 구체적으로, 각 칸이 검은색과 흰색 중 하나로 색칠되어 있고, 변을 공유하는 두 개의 사각형은 다른 색으로 칠해져 있어야 한다. 따라서 이 정의를 따르면 체스판을 색칠하는 경우는 두 가지뿐이다. 하나는 맨 왼쪽 위 칸이 흰색인 경우, 하나는 검은색인 경우이다.

보드가 체스판처럼 칠해져 있다는 보장이 없어서, 지민이는 8×8 크기의 체스판으로 잘라낸 후에 몇 개의 정사각형을 다시 칠해야겠다고 생각했다. 당연히 8*8 크기는 아무데서나 골라도 된다. 지민이가 다시 칠해야 하는 정사각형의 최소 개수를 구하는 프로그램을 작성하시오.

입력
첫째 줄에 N과 M이 주어진다. N과 M은 8보다 크거나 같고, 50보다 작거나 같은 자연수이다. 둘째 줄부터 N개의 줄에는 보드의 각 행의 상태가 주어진다. B는 검은색이며, W는 흰색이다.

출력
첫째 줄에 지민이가 다시 칠해야 하는 정사각형 개수의 최솟값을 출력한다.

예제 입력 1
8 8
WBWBWBWB
BWBWBWBW
WBWBWBWB
BWBBBWBW
WBWBWBWB
BWBWBWBW
WBWBWBWB
BWBWBWBW

예제 출력 1
1

예제 입력 2
10 13
BBBBBBBBWBWBW
BBBBBBBBBWBWB
BBBBBBBBWBWBW
BBBBBBBBBWBWB
BBBBBBBBWBWBW
BBBBBBBBBWBWB
BBBBBBBBWBWBW
BBBBBBBBBWBWB
WWWWWWWWWWBWB
WWWWWWWWWWBWB

예제 출력 2
12
=======================>
BBBBB       BwBWBWBW
BBBBB       wBwBWBWB
BBBBB       BwBWBWBW
BBBBB       wBwBWBWB
BBBBB       BwBWBWBW
BBBBB       wBwBWBWB
BBBBB       BwBWBWBW
BBBBB       wBwBWBWB
WWWWWWWWWWBWB
WWWWWWWWWWBWB
=======================>

예제 입력 3
8 8
BWBWBWBW
WBWBWBWB
BWBWBWBW
WBWBWBWB
BWBWBWBW
WBWBWBWB
BWBWBWBW
WBWBWBWB
 
예제 출력 3
0

예제 입력 4
9 23
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBB
BBBBBBBBBBBBBBBBBBBBBBW

예제 출력 4
31

예제 입력 5
10 10
BBBBBBBBBB
BBWBWBWBWB
BWBWBWBWBB
BBWBWBWBWB
BWBWBWBWBB
BBWBWBWBWB
BWBWBWBWBB
BBWBWBWBWB
BWBWBWBWBB
BBBBBBBBBB

예제 출력 5
0

예제 입력 6
8 8
WBWBWBWB
BWBWBWBW
WBWBWBWB
BWBBBWBW
WBWBWBWB
BWBWBWBW
WBWBWWWB
BWBWBWBW
 
예제 출력 6
2

예제 입력 7
11 12
BWWBWWBWWBWW
BWWBWBBWWBWW
WBWWBWBBWWBW
BWWBWBBWWBWW
WBWWBWBBWWBW
BWWBWBBWWBWW
WBWWBWBBWWBW
BWWBWBWWWBWW
WBWWBWBBWWBW
BWWBWBBWWBWW
WBWWBWBBWWBW
예제 출력 7
15

*/
