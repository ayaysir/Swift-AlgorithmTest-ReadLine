//
//  1697.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/09/20.
//

import Foundation

/// 숨바꼭질 https://www.acmicpc.net/problem/1697
func Q_1697() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, k) = (r[0], r[1])
    var visited = Array(repeating: false, count: 100001)
    
    var result = 0
    func bfs() {
        let dirs = [{ $0 + 1 }, { $0 - 1 }, { $0 * 2 }]
        var q = [(p: n, d: 0)]
        var sIdx = 0
        
        while sIdx < q.count {
            let pop = q[sIdx]
            sIdx += 1
            
            if pop.p == k {
                result = pop.d
                break
            }
            
            for dir in dirs {
                let nx = dir(pop.p)
                
                // 10만까지 맵이 있으므로 10만1부터 불가처리해야됨
                if !(nx < 0 || nx > 100000 || visited[nx])  {
                    visited[nx] = true
                    q.append((nx, pop.d + 1))
                }
            }
        }
    }
    
    bfs()
    print(result)
}

func Q_1697_OLD() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let start = input[0]
    let end = input[1]
    
    if start == end {
        print(0)
        return
    } else if start > end {
        // 뒤로 가는 경우도 있음: -1로만 이동
        print(start - end)
        return
    }
    
    var queue: [(Int, Int)] = []
    var visited: [Bool] = .init(repeating: false, count: 100001)
    var result: Int = 0
    
    // 해당 위치가 유효한지 (방문했거나, 유효성 어겼으면 false)
    func valid(_ n: Int) -> Bool {
        return !(n < 0 || n > 100000 || visited[n])
    }
    
    func bfs(_ n: Int) {
        while !queue.isEmpty {
            // 큐에서 꺼내기
            let dequeued = queue.removeFirst()
            let position = dequeued.0
            let distance = dequeued.1
            
            // end와 같으면 바로 그 때의 distance를 담고 종료
            if position == end {
                result = distance
                break
            }
            
            // 갈 수 있는 3갈래의 좌표 유효성을 판단하고 큐에 push
            let availableDirections = [position - 1, position + 1, position * 2]
            for direction in availableDirections {
                if valid(direction) {
                    visited[direction] = true
                    queue.append((direction, distance + 1))
                }
            }
        }
    }
    
    queue.append((start, 0))
    visited[start] = true
    bfs(start)
    
    print(result)
}

/*
 [풀이]
 BFS를 사용하는 이유 https://www.acmicpc.net/board/view/115948
 - dfs는 조건에 해당하는 값을 찾았을 때 그게 최단 루트일수도 아닐수도 있습니다. 그래서 다른 가능한 모든 값과 비교하여 최소값을 선정해야 합니다.
 - bfs는 가장 먼저 찾는 값이 최단 루트이므로 가장 처음 목표에 도달하면 리턴하는 식으로 불필요한 탐색을 줄일 수 있습니다.
 
 숨바꼭질
 https://www.acmicpc.net/problem/1697
 
 https://chanhuiseok.github.io/posts/baek-14/
 https://forward-gradually.tistory.com/53
 
 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 1초 후에 2*X의 위치로 이동하게 된다.
 
 수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.
 
 입력
 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.
 
 출력
 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.
 
 예제 입력 1
 5 17
 예제 출력 1
 4
 
 반례모음
6 11
 2

0 1
 1
 
1 15
 5
 
1 100000
 21
 
10 40
 2
 
0 0
 0
 
5 0
 5
 
10007 98767
 2343
 
15964 89498
 4781
 
5 35
 5
 
3482 45592
 637
 */
