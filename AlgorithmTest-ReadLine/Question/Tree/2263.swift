//
//  2263.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/12/2024.
//
//  5: 트리의 순회 https://www.acmicpc.net/problem/2263
//

import Foundation

/// 트리의 순회 https://www.acmicpc.net/problem/2263
func Q_2263() {
    let n = Int(readLine()!)!
    var indices = [Int](repeating: 0, count: n + 1)
    let inorder = readLine()!.split(separator: " ").enumerated().map { i, v in
        let n = Int(String(v))!
        indices[n] = i
        return n
    }
    let postorder = readLine()!.split(separator: " ").map { Int($0)! }
    
    var result = ""
    
    func divideConquer(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int) {
        guard inStart <= inEnd, postStart <= postEnd else {
            return
        }
        
        let root = postorder[postEnd]
        let rootIndex = indices[root]
        /// 중위 배열에서 왼쪽 파트 범위
        let leftSize = rootIndex - inStart
        
        result.write("\(root) ")
        
        divideConquer(inStart, rootIndex - 1, postStart, postStart + leftSize - 1)
        divideConquer(rootIndex + 1, inEnd, postStart + leftSize, postEnd - 1)
    }
    
    divideConquer(0, n - 1, 0, n - 1)
    print(result)
}

/*
 [풀이] https://non-stop.tistory.com/128
 - 분할 정복 사용
 
 (예제)
 중위: 8 4 9 2 5 1 6 3 7
 후위: 8 9 4 5 2 6 7 3 1
 
 => 후위순회의 마지막 노드는 항상 그 트리의 루트 노드이다.
 => 중위순회에서 루트 노드를 기준으로 왼쪽, 오른쪽 서브 트리로 나뉜다.
 
               왼쪽 트리 [루트] 오른쪽 트리
         중위: 8 4 9 2 5 [1] 6 3 7
                             [루트]
         후위: 8 9 4 5 2 6 7 3 [1]
 
 => 중위순회의 left/right 트리의 크기 = 후위순회의 left/right 트리의 크기와 동일
     
              size: 5 [루트] size: 3
        중위: 8 4 9 2 5 [1] 6 3 7
              =size: 5  =size: 3 [루트]
        후위: [8 9 4 5 2] [6 7 3]  [1]
 
 => 후위에서 나뉜 왼쪽 가지, 오른쪽 가지의 가장 끝 원소는 해당 가지 내에서의 루트이다.
     
                      root      root  root
        후위: [8 9 4 5 [2]] [6 7 [3]]  [1]
 
 => 이것을 앞의 과정을 반복해 다시 쪼개면 보다 구체적인 트리 구조를 알 수 있게 된다.
 
               left    r                 l     r
         중위: (8 4 9) [2] 5     [1]      6 [3] 7
 
         후위: [(8 9 4) 5 [2]]       [6 7 [3]] [1]
                left   r             l r
    
 <divideConquer 함수 설명>
 func divideConquer(_ inStart: Int, _ inEnd: Int, _ postStart: Int, _ postEnd: Int)
 - inStart, inEnd : 중위순회 배열에서 사용할 인덱스 범위
 - postStart, postEnd : 후위순회 배열에서 사용할 인덱스 범위
 
 divideConquer(inStart, rootIndex - 1, postStart, postStart + leftSize - 1)
  => 중위 배열의 시작 인덱스부터 루트 인덱스의 바로 왼쪽까지, 
  => 후위의 시작부터 leftSize(=>중위와 동일) 의 바로 왼쪽까지
 divideConquer(rootIndex + 1, inEnd, postStart + leftSize, postEnd - 1)
  => 중위 배열의 루트 바로 오른쪽부터 끝까지, 
  => 후위의 왼쪽 사이즈부터(=>오른쪽 가지부터), 오른쪽 끝의 루트 바로 전까지 (postEnd 에 -1을 하는 이유)
 
 => 전위 배열을 구하는 것이므로 노드 출력 위치는 재귀 함수들의 위에 배치
 
 --------
 
 문제
 n개의 정점을 갖는 이진 트리의 정점에 1부터 n까지의 번호가 중복 없이 매겨져 있다. 이와 같은 이진 트리의 인오더와 포스트오더가 주어졌을 때, 프리오더를 구하는 프로그램을 작성하시오.

 입력
 첫째 줄에 n(1 ≤ n ≤ 100,000)이 주어진다. 다음 줄에는 인오더를 나타내는 n개의 자연수가 주어지고, 그 다음 줄에는 같은 식으로 포스트오더가 주어진다.

 출력
 첫째 줄에 프리오더를 출력한다.

 예제 입력 1
 3
 1 2 3
 1 3 2
 
 예제 출력 1
 2 1 3
 */
