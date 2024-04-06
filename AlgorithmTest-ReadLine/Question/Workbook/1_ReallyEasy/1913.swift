//
//  1913.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/6/24.
//

// import Foundation

/// 달팽이 https://www.acmicpc.net/problem/1913
func Q_1913() {
    let dirs: [(y: Int, x: Int)] = [(1, 0), (0, 1), (-1, 0), (0, -1)]
    var curDir = 0
    
    let n = Int(readLine()!)!
    let findNumber = Int(readLine()!)!
    var snail = Array(repeating: Array(repeating: "0", count: n), count: n)
    let center = n / 2
    
    var (i, j) = (0, 0)
    var number = n * n
    var findPos = (y: 0, x: 0)
    
    while snail[center][center] != "1" {
        if number == findNumber {
            findPos = (i + 1, j + 1)
        }
        
        snail[i][j] = "\(number)"
        number -= 1
        
        let next = (i + dirs[curDir].y, j + dirs[curDir].x)
        
        if 0..<n ~= next.0, 0..<n ~= next.1, snail[next.0][next.1] == "0" {
            (i, j) = next
        } else {
            curDir = (curDir + 1) % 4
            (i, j) = (i + dirs[curDir].y, j + dirs[curDir].x)
        }
    }
    
    print(snail.map { $0.joined(separator: " ") }.joined(separator: "\n"))
    print(findPos.y, findPos.x)
}

/*
 [풀이]
 (0,0) 부터 시작해서 안쪽으로 들어감
 => 좌표가 영역 안에 있고, 다음 턴이 0이라면(아직 채워지지 않았다면) 채우고
    그 외의 경우 (좌표가 영역 밖에 있거나 다음 턴이 채워져 있는 상태)라면 방향을 바꿈
 
 --------------
 
 문제
 홀수인 자연수 N이 주어지면, 다음과 같이 1부터 N2까지의 자연수를 달팽이 모양으로 N×N의 표에 채울 수 있다.

 9    2    3
 8    1    4
 7    6    5
 
 +----+----+----+----+----+
 | 25 | 10 | 11 | 12 | 13 |
 +----+----+----+----+----+
 | 24 |  9 |  2 |  3 | 14 |
 +----+----+----+----+----+
 | 23 |  8 |  1 |  4 | 15 |
 +----+----+----+----+----+
 | 22 |  7 |  6 |  5 | 16 |
 +----+----+----+----+----+
 | 21 | 20 | 19 | 18 | 17 |
 +----+----+----+----+----+
 
 N이 주어졌을 때, 이러한 표를 출력하는 프로그램을 작성하시오. 또한 N2 이하의 자연수가 하나 주어졌을 때, 그 좌표도 함께 출력하시오. 예를 들어 N=5인 경우 6의 좌표는 (4,3)이다.

 입력
 첫째 줄에 홀수인 자연수 N(3 ≤ N ≤ 999)이 주어진다. 둘째 줄에는 위치를 찾고자 하는 N2 이하의 자연수가 하나 주어진다.

 출력
 N개의 줄에 걸쳐 표를 출력한다. 각 줄에 N개의 자연수를 한 칸씩 띄어서 출력하면 되며, 자릿수를 맞출 필요가 없다. N+1번째 줄에는 입력받은 자연수의 좌표를 나타내는 두 정수를 한 칸 띄어서 출력한다.
 
 분류
 - 구현

 예제 입력 1
 7
 35
 
 예제 출력 1
 49 26 27 28 29 30 31
 48 25 10 11 12 13 32
 47 24 9 2 3 14 33
 46 23 8 1 4 15 34
 45 22 7 6 5 16 35
 44 21 20 19 18 17 36
 43 42 41 40 39 38 37
 5 7
 */
