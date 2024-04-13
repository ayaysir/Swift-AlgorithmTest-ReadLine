//
//  1991.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  4: 트리 순회 https://www.acmicpc.net/problem/1991
//

// import Foundation

/// 트리 순회 https://www.acmicpc.net/problem/1991
func Q_1991() {
    let n = Int(readLine()!)!
    var graph = [String : [String]]()
    
    // 그래프 추가
    for _ in 0..<n {
        let c = readLine()!.split(separator: " ").map(String.init)
        let (p, l, r) = (c[0], c[1], c[2])
        graph[p, default: []].append(contentsOf: [l, r])
    }
    
    enum Order: CaseIterable {
        case preorder, inorder, postorder
    }
    
    var result = "", indent = ""
    /// 특정 순서로 순회 후 결과 받음
    func dfs(_ node: String, _ order: Order) {
        guard let parentNode = graph[node] else {
            return
        }
        
        let (leftNode, rightNode) = (parentNode[0], parentNode[1])
        
        // 🖨️ 전위 출력
        if order == .preorder {
            result.write(node)
        }
        
        if leftNode != "." {
            dfs(leftNode, order)
            indent += " "
        }
        
        // 🖨️ 중위 출력
        if order == .inorder {
            result.write(node)
        }
        
        if rightNode != "." {
            dfs(rightNode, order)
            indent += " "
        }
        
        // 🖨️ 후위 출력
        if order == .postorder {
            result.write(node)
        }
    }
    
    for order in Order.allCases {
        indent = ""
        dfs("A", order)
        result.write("\n")
    }
    
    print(result)
}

/*
 [풀이]
 - dfs가 각각 양쪽 노드를 탐색하게 하고
 - Print를 적절한 위치에 배치시키면 전위, 중위, 후위 출력이 가능하다.
 
 (1) 전위: dfs가 실행되는 순서대로 출력된다.
 (2) 중위: 왼쪽 가지 탐색이 완료되면 역순으로 출력된다.
 (3) 후위: 왼쪽 및 오른쪽 가지 탐색이 완료되면 가장 깊은 노드부터 왼-오 순으로 출력된다.
 
ABDCEFG
DBAECFG
DBEGFCA
 
 --------
 
 문제
 이진 트리를 입력받아 전위 순회(preorder traversal), 중위 순회(inorder traversal), 후위 순회(postorder traversal)한 결과를 출력하는 프로그램을 작성하시오.
 
            A
           / \
          B   C
         /   / \
        D   E   F
                 \
                  G
 
 예를 들어 위와 같은 이진 트리가 입력되면,

 전위 순회한 결과 : ABDCEFG // (루트) (왼쪽 자식) (오른쪽 자식)
 중위 순회한 결과 : DBAECFG // (왼쪽 자식) (루트) (오른쪽 자식)
 후위 순회한 결과 : DBEGFCA // (왼쪽 자식) (오른쪽 자식) (루트)
 가 된다.

 입력
 첫째 줄에는 이진 트리의 노드의 개수 N(1 ≤ N ≤ 26)이 주어진다. 둘째 줄부터 N개의 줄에 걸쳐 각 노드와 그의 왼쪽 자식 노드, 오른쪽 자식 노드가 주어진다. 노드의 이름은 A부터 차례대로 알파벳 대문자로 매겨지며, 항상 A가 루트 노드가 된다. 자식 노드가 없는 경우에는 .으로 표현한다.

 출력
 첫째 줄에 전위 순회, 둘째 줄에 중위 순회, 셋째 줄에 후위 순회한 결과를 출력한다. 각 줄에 N개의 알파벳을 공백 없이 출력하면 된다.

 예제 입력 1
 7
 A B C
 B D .
 C E F
 E . .
 F . G
 D . .
 G . .
 
 예제 출력 1
 ABDCEFG
 DBAECFG
 DBEGFCA
 */
