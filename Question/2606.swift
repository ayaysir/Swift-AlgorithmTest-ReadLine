//
//  2606.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/09/23.
//

import Foundation

func Q_2606() {
    let nodeCount = Int(readLine()!)!
    let caseCount = Int(readLine()!)!
    
    var graphs: [[Int]] = Array(repeating: [], count: nodeCount + 1)
    for _ in 0..<caseCount {
        let input2: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
        let node1 = input2[0]
        let node2 = input2[1]
        
        graphs[node1].append(node2)
        graphs[node2].append(node1)
        graphs[node1].sort(by: >) // DFS인 경우 내림차순
        graphs[node2].sort(by: >) // DFS인 경우 내림차순
    }
    
    func dfs_recursive(_ start: Int, _ graphs: [[Int]]) -> Int {
        var visited: Set<Int> = []
        var infectedCount: Int = 0
        
        func dfs(_ node: Int) {
            if !visited.contains(node) {
                if node != 1 {
                    infectedCount += 1
                }
                
                visited.insert(node)
                
                for neighbor in graphs[node] {
                    dfs(neighbor)
                }
            }
        }
        
        dfs(start)
        return infectedCount
    }
    
    print(dfs_recursive(1, graphs))
}
