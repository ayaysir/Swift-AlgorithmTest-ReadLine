//
//  5639.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  6: 이진 검색 트리 https://www.acmicpc.net/problem/5639
//

import Foundation

/// 이진 검색 트리 https://www.acmicpc.net/problem/5639
func Q_5639() {
    var preorder: [Int] = []
    while let r = readLine(), let node = Int(r) {
        preorder.append(node)
    }

    var result = ""
    
    func recursive(_ start: Int, _ end: Int) {
        guard start <= end else {
            return
        }
        
        let root = preorder[start]
        let rightStartIndex: Int = {
            for i in preorder.indices where start < i && root < preorder[i] {
                return i
            }
            
            return -1
        }()
        
        if rightStartIndex != -1 {
            recursive(start + 1, rightStartIndex - 1)
            recursive(rightStartIndex, end)
        } else {
            recursive(start + 1, end)
        }
        
        result.write("\(root)\n")
    }
    
    recursive(0, preorder.count - 1)
    print(result)
}

/*
 [풀이]
 * 이진 검색 트리에서 전위 순회 배열은 가장 왼쪽에 루트를 가진다.
 * 오른쪽에서 루트값보다 큰 부분부터 시작하는 곳이 오른쪽 가지, 그 나머지 부분이 왼쪽 가지이다.
 
 루트     왼쪽 가지                         오른쪽 가지
 [50]    [30    24    5    28     45]   [98    52    60]
 - 루트보다 큰 98이 있는 노드부터 오른쪽 가지, 그 나머지 부분(루트는 제외)은 왼쪽 가지이다.
 
 다시 왼쪽 가지, 오른쪽 가지를 다시 순회한다.
 [30] [24   5   28]  [45]
 [98] [52  60]       [-]
 
 - 오른쪽 가지 루트 98의 경우 더 이상 루트보다 큰 값이 없으므로 나머지 노드들을 전부 왼쪽 자식으로 넣고 종료한다.
 
 * 후위 배열을 구하는 것이므로 출력을 재귀 호출 구역의 가장 마지막에 배치한다.
 
 --------
 
 문제
 이진 검색 트리는 다음과 같은 세 가지 조건을 만족하는 이진 트리이다.

 노드의 왼쪽 서브트리에 있는 모든 노드의 키는 노드의 키보다 작다.
 노드의 오른쪽 서브트리에 있는 모든 노드의 키는 노드의 키보다 크다.
 왼쪽, 오른쪽 서브트리도 이진 검색 트리이다.
 
                     [ 50 ]
                    /     \
                   30      98
                  /  \     /
                 24   45  52
                /  \       \
               5   28       60
 

 전위 순회 (루트-왼쪽-오른쪽)은 루트를 방문하고, 왼쪽 서브트리, 오른쪽 서브 트리를 순서대로 방문하면서 노드의 키를 출력한다. 후위 순회 (왼쪽-오른쪽-루트)는 왼쪽 서브트리, 오른쪽 서브트리, 루트 노드 순서대로 키를 출력한다. 예를 들어, 위의 이진 검색 트리의 전위 순회 결과는 50 30 24 5 28 45 98 52 60 이고, 후위 순회 결과는 5 28 24 45 30 60 52 98 50 이다.

 이진 검색 트리를 전위 순회한 결과가 주어졌을 때, 이 트리를 후위 순회한 결과를 구하는 프로그램을 작성하시오.

 입력
 트리를 전위 순회한 결과가 주어진다. 노드에 들어있는 키의 값은 106보다 작은 양의 정수이다. 모든 값은 한 줄에 하나씩 주어지며, 노드의 수는 10,000개 이하이다. 같은 키를 가지는 노드는 없다.

 출력
 입력으로 주어진 이진 검색 트리를 후위 순회한 결과를 한 줄에 하나씩 출력한다.

 예제 입력 1
 50
 30
 24
 5
 28
 45
 98
 52
 60
 
 예제 출력 1
 5
 28
 24
 45
 30
 60
 52
 98
 50
 */
