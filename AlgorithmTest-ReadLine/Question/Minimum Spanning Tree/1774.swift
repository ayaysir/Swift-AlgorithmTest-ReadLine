//
//  1774.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/20/2024.
//
//  4: 우주신과의 교감 https://www.acmicpc.net/problem/1774
//

import Foundation

/// 우주신과의 교감 https://www.acmicpc.net/problem/1774
/// - 크루스칼 알고리즘 109648KB    140ms
func Q_1774_() {
    // import Foundation
    
    typealias Coord = (x: Int, y: Int)
    typealias Edge = (weight: Double, from: Int, to: Int)
    
    func euclideanDistance(_ a: Coord, _ b: Coord) -> Double {
        let (aX, aY, bX, bY) = (Double(a.x), Double(a.y), Double(b.x), Double(b.y))
        return sqrt(pow(bX - aX, 2) + pow(bY - aY, 2))
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    let coords: [Coord] = (0..<n).map { _ in
        let values = readLine()!.split(separator: " ").map { Int($0)! }
        return (values[0], values[1])
    }
    
    let edges: [Edge] = {
        var array = [Edge]()
        
        for i in 0..<coords.count {
            for j in i + 1..<coords.count {
                let dist = euclideanDistance(coords[i], coords[j])
                array.append((dist, i, j))
            }
        }
        
        return array.sorted(by: { $0.weight < $1.weight })
    }()
    
    // 크루스칼
    
    func find(_ x: Int) -> Int {
        guard unf[x] != x else {
            return x
        }
        
        unf[x] = find(unf[x])
        return unf[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let (x, y) = (find(x), find(y))
        
        guard x != y else {
            return
        }
        
        unf[y] = x
    }
    
    func hasSameParent(edge: Edge) -> Bool {
        find(edge.from) == find(edge.to)
    }
    
    var unf = Array(0...n)
    
    // 이미 사용된 간선 연결시키기
    for _ in 0..<m {
        let r = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b) = (r[0] - 1, r[1] - 1)
        union(a, b)
    }
    
    var wSum: Double = 0.0
    
    for i in 0..<edges.count where !hasSameParent(edge: edges[i]) {
        union(edges[i].from, edges[i].to)
        wSum += edges[i].weight
    }
    
    let digit: Double = pow(10, 2)
    let result = round(wSum * digit) / digit
    print(String(format: "%.2f", result))
}

/// 우주신과의 교감 https://www.acmicpc.net/problem/1774
/// - 프림 알고리즘 137340KB    1364ms
func Q_1774() {
    // import Foundation
    
    typealias Coord = (x: Double, y: Double)
    typealias Node = (weight: Double, number: Int)
    
    func euclideanDistance(_ a: Coord, _ b: Coord) -> Double {
        let dx = b.x - a.x
        let dy = b.y - a.y
        return sqrt(dx * dx + dy * dy)
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (r[0], r[1])
    
    let coords: [Coord] = (0..<n).map { _ in
        let values = readLine()!.split(separator: " ").map { Double($0)! }
        return (values[0], values[1])
    }
    
    // 프림 알고리즘

    var edges: [[Double]] = {
        var array: [[Double]] = Array(repeating: Array(repeating: -1.0, count: n), count: n)
        
        for i in 0..<n {
            for j in 0..<n {
                array[i][j] = euclideanDistance(coords[i], coords[j])
            }
        }
        
        return array
    }()
    
    // 이미 사용된 간선 연결시키기
    for _ in 0..<m {
        let r = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (a, b) = (r[0] - 1, r[1] - 1)
        edges[a][b] = 0
        edges[b][a] = 0
    }
    
    var visited = Array(repeating: false, count: n + 1)
    var wSum: Double = 0.0
    var pq = Heap<Node>(compare: { $0.weight < $1.weight })
    pq.enqueue((0, 0))
    
    while !pq.isEmpty {
        let pop = pq.dequeue()!
        
        if !visited[pop.number] {
            visited[pop.number] = true
            wSum += pop.weight
        }
        
        for i in 0..<n where i != pop.number && !visited[i] {
            pq.enqueue((weight: edges[pop.number][i], number: i))
        }
    }
    
    print(String(format: "%.2f", wSum))
  
    struct Heap<T> {
        var arr:[T]
        var compare:(T, T) -> Bool
        
        var isEmpty: Bool {
            return arr.isEmpty
        }
        
        var count: Int {
            return arr.count
        }
        
        init(arr: [T] = [], compare: @escaping (T, T) -> Bool) {
            self.arr = arr
            self.compare = compare
        }
        
        mutating private func shiftUp(_ a: Int) {
            var i = a
            while i > 0 {
                let parent = (i-1)/2
                if compare(arr[i], arr[parent]) {
                    arr.swapAt(i, parent)
                    i = parent
                }
                else {
                    break
                }
            }
        }
        
        mutating private func shiftDown(_ a: Int) {
            var i = a
            var child = 2*i+1
            let count = arr.count
            while child < count {
                if child+1 < count && compare(arr[child+1], arr[child]) {
                    child += 1
                }
                if compare(arr[child], arr[i]) {
                    arr.swapAt(i, child)
                    i = child
                    child = 2*i+1
                }
                else {
                    break
                }
            }
        }
        
        mutating func enqueue(_ a: T) {
            arr.append(a)
            shiftUp(arr.count-1)
        }
        
        mutating func dequeue() -> T? {
            if arr.isEmpty {
                return nil
            } else {
                arr.swapAt(0, arr.count-1)
                let result = arr.popLast()
                shiftDown(0)
                return result
            }
        }
    }
}

/*
 [풀이]
 (1) 크루스칼 알고리즘인 경우
 - 최소 신장 트리를 찾되 이미 연결된 간선은 미리 Union 시킨다음 탐색한다.
 
 (2) 프림 알고리즘 https://www.acmicpc.net/source/28044934
 - 이미 방문한 노드간의 가중치를 0으로 만든다.
 
 ** 프림 알고리즘이 반드시 필요한 상황이 아니라면 크루스칼 알고리즘을 우선 사용한다. (시간 초과 이슈)
 
 [💥💥💥]
 예제 정답이 4.00으로 주어졌다면 숫자가 소수점 이하 2자리가 안되더라도 반드시 4.00 이런식으로 표시해야 됨
  - Formatted String으로 출력
 
 ---
 
 문제
 황선자씨는 우주신과 교감을 할수 있는 채널러 이다. 하지만 우주신은 하나만 있는 것이 아니기때문에 황선자 씨는 매번 여럿의 우주신과 교감하느라 힘이 든다. 이러던 와중에 새로운 우주신들이 황선자씨를 이용하게 되었다.

 하지만 위대한 우주신들은 바로 황선자씨와 연결될 필요가 없다. 이미 황선자씨와 혹은 이미 우주신끼리 교감할 수 있는 우주신들이 있기 때문에 새로운 우주신들은 그 우주신들을 거쳐서 황선자 씨와 교감을 할 수 있다.

 우주신들과의 교감은 우주신들과 황선자씨 혹은 우주신들 끼리 이어진 정신적인 통로를 통해 이루어 진다. 하지만 우주신들과 교감하는 것은 힘든 일이기 때문에 황선자씨는 이런 통로들이 긴 것을 좋아하지 않는다. 왜냐하면 통로들이 길 수록 더 힘이 들기 때문이다.

 또한 우리들은 3차원 좌표계로 나타낼 수 있는 세상에 살고 있지만 우주신들과 황선자씨는 2차원 좌표계로 나타낼 수 있는 세상에 살고 있다. 통로들의 길이는 2차원 좌표계상의 거리와 같다.

 이미 황선자씨와 연결된, 혹은 우주신들과 연결된 통로들이 존재한다. 우리는 황선자 씨를 도와 아직 연결이 되지 않은 우주신들을 연결해 드려야 한다. 새로 만들어야 할 정신적인 통로의 길이들이 합이 최소가 되게 통로를 만들어 “빵상”을 외칠수 있게 도와주자.
 
 입력
 첫째 줄에 우주신들의 개수 N(1 <= N <= 1000)  이미 연결된 신들과의 통로의 개수 M (1 <= M <= 1000) 가 주어진다.
 두 번째 줄부터 N개의 줄에는 황선자를 포함하여 우주신들의 좌표 X,Y (0 <= X, Y <= 1 000 000)가 주어진다.
 그 밑으로 M개의 줄에는 이미 연결된 통로가 주어진다. 번호는 위의 입력받은 좌표들의 순서라고 생각하면 된다. 좌표는 정수이다.

 출력
 첫째 줄에 만들어야 할 최소의 통로 길이를 소수점 둘째 자리까지 반올림하여 출력하라.

 예제 입력 1
4 1
1 1
3 1
2 3
4 3
1 4
 
 예제 출력 1
 4.00
 
 [반례]
15 3
5 1
1 1
9 17
5 2
1 9
9 5
1 14
13 11
1 11
5 14
15 9
11 17
9 9
11 1
18 4
9 15
1 2
5 4
 output:37.77
 */
