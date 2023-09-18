//
//  DFS_BFS.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2023/09/18.
//

import Foundation

func bfs(_ start: Int, _ graphs: [[Int]]) -> String {
    var queue: [Int] = [start]
    var visited: Set<Int> = []
    var result: String = ""
    
    while !queue.isEmpty {
        let dequeued = queue.removeFirst()
        if !visited.contains(dequeued) {
            visited.insert(dequeued)
            queue.append(contentsOf: graphs[dequeued])
            result += "\(dequeued) "
        }
    }
    
    return result
}

func dfs(_ start: Int, _ graphs: [[Int]]) -> String {
    var stack: [Int] = [start]
    var visited: Set<Int> = []
    var result: String = ""
    
    while !stack.isEmpty {
        let popped = stack.removeLast()
        if !visited.contains(popped) {
            stack.append(contentsOf: graphs[popped].reversed())
            visited.insert(popped)
            result += "\(popped) "
        }
    }
    
    return result
}

func dfs_recursive(_ start: Int, _ graphs: [[Int]]) -> String {
    var visited: Set<Int> = []
    var result: String = ""
    
    func dfs(_ node: Int) {
        if !visited.contains(node) {
            result += "\(node) "
            visited.insert(node)
            
            for neighbor in graphs[node] {
                dfs(neighbor)
            }
        }
    }
    
    dfs(start)
    return result
}
