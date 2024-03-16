//
//  2580.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/16/24.
//

import Foundation

func Q_2580() {
    var sudoku = (0..<9).map { _ in readLine()!.split(separator: " ").map { Int($0)! }}
    var explored: [(y: Int, x: Int)] = [], isFinished = false
    
    for y in 0..<9 {
        for x in 0..<9 {
            if sudoku[y][x] == 0 {
                explored.append((y: y, x: x))
            }
        }
    }
    
    /*
     앞으로 이차원 배열은 전부
     
     for y in yRange {
        for x in xRange {
            blahblah = matrix[y][x]
        }
     }
     
     이런 식으로 생각:
     
     0️⃣⬜️⬜️⬜️⬜️⬜️⬜️
     1️⃣⬜️⬜️⬜️⬜️🅰️⬜️
     2️⃣⬜️⬜️⬜️⬜️⬜️⬜️
     3️⃣⬜️⬜️🅱️⬜️⬜️⬜️
     4️⃣⬜️⬜️⬜️⬜️⬜️🆘
     5️⃣🅾️⬜️⬜️⬜️⬜️⬜️
     ⏹️0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣
     
     - 🅰️는 4행 1열에 있으므로 일반적으로 생각하는 좌표는 (4, 1)이나
     - 상단의 for문을 돌려보면 A가 나오려면 세로(y)가 1인 상태에서 가로(x)가 4여야 되므로
       matrix[1][4] => matrix[y][x]로 접근해야 한다.
     - 마찬가지로 통념과 달리 B는 matrix[3][2], O = matrix[5][0], SOS = matrix[4][5]이다.
     - row, col / i, j 같은 이름 대신 y, x를 쓰면 역전관계가 잘 드러나기 때문에 앞으로 이걸 쓰는 것이 좋을듯
     */
    
    func check(_ y: Int, _ x: Int, value: Int) -> Bool {
        for i in 0..<9 {
            if sudoku[y][i] == value || sudoku[i][x] == value {
                return false
            }
            
            // if sudoku[y][i] == value {
            //     return false
            // }
            // 
            // if sudoku[i][x] == value {
            //     return false
            // }
        }
        
        let squareY = (y / 3) * 3
        let squareX = (x / 3) * 3
        
        for i in squareY..<squareY + 3 {
            for j in squareX..<squareX + 3 {
                if sudoku[i][j] == value {
                    return false
                }
            }
        }
        
        return true
    }
    
    func backtracking(_ n: Int) {
        if isFinished {
            return
        }
        
        if n == explored.count {
            print(sudoku.map{ $0.map(String.init).joined(separator: " " ) }.joined(separator: "\n"))
            isFinished = true // [💥💥💥] 여기서 함수 중단, exit(0)
            return
        }
        
        for i in 1...9 {
            let (ny, nx) = explored[n]
            
            if check(ny, nx, value: i) {
                sudoku[ny][nx] = i
                backtracking(n + 1)
                sudoku[ny][nx] = 0
            }
        }
    }
    
    backtracking(0)
}

/*
 [풀이] https://edder773.tistory.com/255
 - 스도쿠 조건을 만족하는 지 검사하는 함수 생성
   - 스도쿠 조건: 가로 9칸에 숫자가 겹치면 안 되고, 세로 9칸에도 숫자가 겹치면 안 되며, 해당 3*3칸에서도 숫자가 겹치면 안 된다.
        => 이러한 조건들은 1~9까지 있는지까지 볼 필요는 없고, 해당 영역에 현재 숫자(value)와 같은 숫자가 있는지만 검사하면 된다.
           프로그램이 진행되면서 저절로 1~9까지 중복없이 채워져서 조건이 자동으로 만족하게 된다.
   (1) 행 또는 열에 같은 숫자가 있으면 안된다.
   (2) 3*3 영역에 같은 숫자가 있으면 안된다.
 - explored: 빈 숫자(0)인 경우 이 목록에서 찾을 것이라고 알려주기 위해 [(y: Int, x: Int)]의 생성한다.
 - 백트래킹(DFS) 함수
   - n은 explore의 인덱스를 가리키키 위한 변수이며, 재귀될떄마다 1 증가시킨다.
   - n == explored.count 라면 여기서 결과를 출력하고 시스템을 종료시킨다.
     - 백트래킹이기 때문에 최후에 출력하게 되면 다시 0으로 돌아간 원래 배열이 출력된다.
     - exit(0)을 사용하지 않을거라면 isFinished 플래그를 만들고 해당 플래그가 켜지면 백트래킹 함수를 진행하지 않도록 한다.
   
 
 스도쿠 https://www.acmicpc.net/problem/2580
  - 문제 요약: 9*9 스도쿠에서 빈칸(0)을 알맞은 숫자로 채우기
 
 예제 입력 1
0 3 5 4 6 9 2 7 8
7 8 2 1 0 5 6 0 9
0 6 0 2 7 8 1 3 5
3 2 1 0 4 6 8 9 7
8 0 4 9 1 3 5 0 6
5 9 6 8 2 0 4 1 3
9 1 7 6 5 2 0 8 0
6 0 3 7 0 1 9 5 2
2 5 8 3 9 4 7 6 0
 
 예제 출력 1
 1 3 5 4 6 9 2 7 8
 7 8 2 1 3 5 6 4 9
 4 6 9 2 7 8 1 3 5
 3 2 1 5 4 6 8 9 7
 8 7 4 9 1 3 5 2 6
 5 9 6 8 2 7 4 1 3
 9 1 7 6 5 2 3 8 4
 6 4 3 7 8 1 9 5 2
 2 5 8 3 9 4 7 6 1
 
 예제 입력 2
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0
 
 예제 출력 2
 1 2 3 4 5 6 7 8 9
 4 5 6 7 8 9 1 2 3
 7 8 9 1 2 3 4 5 6
 2 1 4 3 6 5 8 9 7
 3 6 5 8 9 7 2 1 4
 8 9 7 2 1 4 3 6 5
 5 3 1 6 4 2 9 7 8
 6 4 2 9 7 8 5 3 1
 9 7 8 5 3 1 6 4 2
 
 */
