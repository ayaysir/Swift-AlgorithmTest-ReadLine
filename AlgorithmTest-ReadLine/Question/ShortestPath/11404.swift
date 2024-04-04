//
//  11404.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/3/2024.
//
//  6: 플로이드 https://www.acmicpc.net/problem/11404
//

import Foundation

/// 플로이드 https://www.acmicpc.net/problem/11404
func Q_11404() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var dists = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
    
    for i in 1...n {
        dists[i][i] = 0
    }
    
    for _ in 0..<m {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        
        if dists[r[0]][r[1]] > r[2] {
            dists[r[0]][r[1]] = r[2]
        }
    }
    
    for h in 1...n {
        for i in 1...n {
            for j in 1...n where dists[i][j] > sum(dists[i][h], dists[h][j]) {
                dists[i][j] = sum(dists[i][h], dists[h][j])
            }
        }
    }
    
    var result = ""
    for i in 1...n {
        for j in 1...n {
            result.write(dists[i][j] == .max ? "0 " : "\(dists[i][j]) ")
        }
        result.write("\n")
    }
    
    print(result)
    
    func sum(_ args: Int...) -> Int {
        args.max() == .max ? .max : args.reduce(0, +)
    }
}

/*
 [풀이] https://rujang.tistory.com/entry/백준-11404번-플로이드-CC
  - n <= 100이므로 O(100^3)이라는 시간복잡도는 시간안에 돌아간다.
  - arr[i][i]와 같이 자기자신은 0으로 초기화 해준다.
  - 같은 a,b값이 여러번 나올 수 있으므로 if(arr[a][b]>c)일 때 arr[a][b] = c를 입력받음
  - 3중첩 반복문을 돌면서 arr[i][j] > arr[i][k] + arr[k][j]일 때 arr[i][j]의 값을 바꾸어준다.
   - arr[i][j]의 의미는 i에서 j로 가는 비용이라는 뜻
   - arr[i][k] + arr[k][j]의 의미는 i에서 k로 가는 비용과 k에서 j로가는 비용의 합
   - i에서 k를 거쳐서 j로 가는 비용이 원래 입력받았던 i에서 j로 가는 비용보다 작을 수 있으므로 이 때는 arr[i][j]값을 arr[i][k] + arr[k][j]로 바꿔준다.
   (예) k = 2, i = 1, j = 3인 경우
 +---+---+--------+--------+---+
 |i\j║ 1 |    2   |    3   | 4 |
 +===+===+========+========+===+
 | 1 ║   |        | (i, j) |   |
 +---+---+--------+--------+---+
 | 2 ║   | (i, k) |        |   |
 +---+---+--------+--------+---+
 | 3 ║   | (k, j) |        |   |
 +---+---+--------+--------+---+
 | 4 ║   |        |        |   |
 +---+---+--------+--------+---+
    
  - 무한대로 초기화한 값을 0으로 출력한다.
 
 플로이드-워셜 알고리즘(Floyd-Warshall Algorithm)은 변의 가중치가 음이거나 양인 (음수 사이클은 없는) 가중 그래프에서 최단 경로들을 찾는 알고리즘이다.[1][2] 알고리즘을 한 번 수행하면 모든 꼭짓점 쌍 간의 최단 경로의 길이(가중치의 합)을 찾는다.
 https://ko.wikipedia.org/wiki/플로이드-워셜_알고리즘
 
 ----------
 
 문제
 n(2 ≤ n ≤ 100)개의 도시가 있다. 그리고 한 도시에서 출발하여 다른 도시에 도착하는 m(1 ≤ m ≤ 100,000)개의 버스가 있다. 각 버스는 한 번 사용할 때 필요한 비용이 있다.

 모든 도시의 쌍 (A, B)에 대해서 도시 A에서 B로 가는데 필요한 비용의 최솟값을 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 도시의 개수 n이 주어지고 둘째 줄에는 버스의 개수 m이 주어진다. 그리고 셋째 줄부터 m+2줄까지 다음과 같은 버스의 정보가 주어진다. 먼저 처음에는 그 버스의 출발 도시의 번호가 주어진다. 버스의 정보는 버스의 시작 도시 a, 도착 도시 b, 한 번 타는데 필요한 비용 c로 이루어져 있다. 시작 도시와 도착 도시가 같은 경우는 없다. 비용은 100,000보다 작거나 같은 자연수이다.

 시작 도시와 도착 도시를 연결하는 노선은 하나가 아닐 수 있다.

 출력
 n개의 줄을 출력해야 한다. i번째 줄에 출력하는 j번째 숫자는 도시 i에서 j로 가는데 필요한 최소 비용이다. 만약, i에서 j로 갈 수 없는 경우에는 그 자리에 0을 출력한다.

 예제 입력 1
 5
 14
 1 2 2
 1 3 3
 1 4 1
 1 5 10
 2 4 2
 3 4 1
 3 5 1
 4 5 3
 3 5 10
 3 1 8
 1 4 2
 5 1 7
 3 4 2
 5 2 4
 
 예제 출력 1
 0 2 3 1 4
 12 0 15 2 5
 8 5 0 1 1
 10 7 13 0 3
 7 4 10 6 0
 */
