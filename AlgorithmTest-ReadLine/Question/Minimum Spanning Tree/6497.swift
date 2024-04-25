//
//  6497.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/20/2024.
//
//  5: 전력난 https://www.acmicpc.net/problem/6497
//

import Foundation

/// 전력난 https://www.acmicpc.net/problem/6497
/// - 크루스칼 99892KB    372ms (빠른 입출력 사용, 일반 입출력 시간초과)
func Q_6497_() {
    // import Foundation
    
    typealias Edge = (weight: Int, from: Int, to: Int)
    let f = IO()
    
    while true {
        let houseCount = f.readInt()
        let roadCount = f.readInt()
        
        guard houseCount != 0, roadCount != 0 else {
            break
        }
        
        var totalRoadLength = 0
        let edges: [Edge] = (0..<roadCount).map { _ in
            let (a, b, w) = (f.readInt(), f.readInt(), f.readInt())
            totalRoadLength += w
            return (w, a, b)
        }.sorted(by: { $0.weight < $1.weight })
        
        // Kruskal's
        
        var unf = Array(0...houseCount + 1)
        var mstWeightSum = 0
        
        for i in 0..<edges.count where !hasSameParent(edge: edges[i], &unf) {
            union(edges[i].from, edges[i].to, &unf)
            mstWeightSum += edges[i].weight
        }
        
        print(totalRoadLength - mstWeightSum)
    }
    
    func find(_ x: Int, _ unf: inout [Int]) -> Int {
        guard unf[x] != x else {
            return x
        }
        
        unf[x] = find(unf[x], &unf)
        return unf[x]
    }
    
    func union(_ x: Int, _ y: Int, _ unf: inout [Int]) {
        let (x, y) = (find(x, &unf), find(y, &unf))
        
        guard x != y else {
            return
        }
        
        unf[y] = x
    }
    
    func hasSameParent(edge: Edge, _ unf: inout [Int]) -> Bool {
        find(edge.from, &unf) == find(edge.to, &unf)
    }
    
    final class IO{var b:Data,i=0;init(fh:FileHandle=FileHandle.standardInput){b=try!fh.readToEnd()!}
    @inline(__always)func read()->UInt8{defer{i+=1};guard i<b.count else{return 0};return b[i]}
    @inline(__always)func readInt()->Int{var s=0,n=read(),p=true;while n==10||n==32{n=read()}
    if n==45{p.toggle();n=read()};while n>=48,n<=57{s=s*10+Int(n-48);n=read()};return s*(p ?1:-1)}
    @inline(__always)func readString()->String{var t="",n=read();while n==10||n==32 {n=read()}
    while n != 10,n != 32,n != 0{t+=String(bytes:[n],encoding:.ascii)!;n=read()};return t}}
}

/// 전력난 https://www.acmicpc.net/problem/6497
/// - 프림 (시간 초과)
func Q_6497() {
    // import Foundation
    
    typealias Node = (weight: Int, number: Int)
    let f = IO()
    var result = ""
    
    while true {
        let houseCount = f.readInt()
        let roadCount = f.readInt()
        
        guard houseCount != 0, roadCount != 0 else {
            break
        }

        var totalRoadLength = 0
        var edges: [[Int]] = Array(repeating: Array(repeating: -1, count: houseCount), count: houseCount)
        
        for _ in 0..<roadCount {
            let (a, b, w) = (f.readInt(), f.readInt(), f.readInt())
            edges[a][b] = w
            edges[b][a] = w
            totalRoadLength += w
        }
        
        var visited = Array(repeating: false, count: houseCount)
        var wSum: Int = 0
        var pq = Heap<Node>(compare: { $0.weight < $1.weight })
        pq.enqueue((0, 0))
        
        while !pq.isEmpty {
            let pop = pq.dequeue()!
            
            if !visited[pop.number] {
                visited[pop.number] = true
                wSum += pop.weight
            }
            
            for i in 0..<houseCount where i != pop.number && !visited[i] && edges[pop.number][i] != -1 {
                pq.enqueue((weight: edges[pop.number][i], number: i))
            }
        }
        
        result.write("\(totalRoadLength - wSum)\n")
    }
    
    print(result)

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
    
    final class IO{var b:Data,i=0;init(fh:FileHandle=FileHandle.standardInput){b=try!fh.readToEnd()!}
    @inline(__always)func read()->UInt8{defer{i+=1};guard i<b.count else{return 0};return b[i]}
    @inline(__always)func readInt()->Int{var s=0,n=read(),p=true;while n==10||n==32{n=read()}
    if n==45{p.toggle();n=read()};while n>=48,n<=57{s=s*10+Int(n-48);n=read()};return s*(p ?1:-1)}
    @inline(__always)func readString()->String{var t="",n=read();while n==10||n==32 {n=read()}
    while n != 10,n != 32,n != 0{t+=String(bytes:[n],encoding:.ascii)!;n=read()};return t}}
}

/*
 [풀이]
 - 전체 거리 길이의 합에서 MST의 길이(가중치의 합)를 뺸 값이 정답
 - 크루스칼 알고리즘 사용
 
 [주의]
 - 크루스칼: 일반 입력 사용시 시간 초과 발생 => 빠른 입출력 사용
 - 프림: 일반, 빠른 입출력 모두 시간 초과로 확인 불가
 
 -------
 
 문제
 성진이는 한 도시의 시장인데 거지라서 전력난에 끙끙댄다. 그래서 모든 길마다 원래 켜져 있던 가로등 중 일부를 소등하기로 하였다. 길의 가로등을 켜 두면 하루에 길의 미터 수만큼 돈이 들어가는데, 일부를 소등하여 그만큼의 돈을 절약할 수 있다.

 그러나 만약 어떤 두 집을 왕래할 때, 불이 켜져 있지 않은 길을 반드시 지나야 한다면 위험하다. 그래서 도시에 있는 모든 두 집 쌍에 대해, 불이 켜진 길만으로 서로를 왕래할 수 있어야 한다.

 위 조건을 지키면서 절약할 수 있는 최대 액수를 구하시오.

 입력
 입력은 여러 개의 테스트 케이스로 구분되어 있다.

 각 테스트 케이스의 첫째 줄에는 집의 수 m과 길의 수 n이 주어진다. (1 ≤ m ≤ 200000, m-1 ≤ n ≤ 200000)

 이어서 n개의 줄에 각 길에 대한 정보 x, y, z가 주어지는데, 이는 x번 집과 y번 집 사이에 양방향 도로가 있으며 그 거리가 z미터라는 뜻이다. (0 ≤ x, y < m, x ≠ y)

 도시는 항상 연결 그래프의 형태이고(즉, 어떤 두 집을 골라도 서로 왕래할 수 있는 경로가 있다), 도시상의 모든 길의 거리 합은 231미터보다 작다.

 입력의 끝에서는 첫 줄에 0이 2개 주어진다.

 출력
 각 테스트 케이스마다 한 줄에 걸쳐 절약할 수 있는 최대 비용을 출력한다.

 예제 입력 1
 7 11
 0 1 7
 0 3 5
 1 2 8
 1 3 9
 1 4 7
 2 4 5
 3 4 15
 3 5 6
 4 5 8
 4 6 9
 5 6 11
 0 0
 
 예제 출력 1
 51
 */
