//
//  11286.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/26/2024.
//
//  3: 절댓값 힙 https://www.acmicpc.net/problem/11286
//

// import Foundation

/// 절댓값 힙 https://www.acmicpc.net/problem/11286
func Q_11286() {
    let n = Int(readLine()!)!
    let cmd = (0..<n).map { _ in Int(readLine()!)! }
    var prq = PriorityQueueUseAbsValue()

    var result = ""
    cmd.forEach { c in
        switch c {
        case 0:
            result.write("\(prq.isEmpty ? 0 : prq.dequeue()!)\n")
        default:
            prq.enqueue(c)
        }
    }

    print(result)
}

/*
 [풀이] /Common/PriorityQueueUseAbsValue 참고
 - 정렬 조건을 지정해야 하는 곳이 3군데 있는데 모두 지정해야 한다.
   - 절대값이 작으면 그 값을 더 우선시한다.
   - 절대값이 같으면 일반값을 비교해 일반값이 작은 쪽을 더 우선시한다.
 - 정렬 조건만 지정하는 것으로, 값 자체는 원래 값이 들어가고 나와야 한다.
 
 -------
 
 문제
 절댓값 힙은 다음과 같은 연산을 지원하는 자료구조이다.

 배열에 정수 x (x ≠ 0)를 넣는다.
 배열에서 절댓값이 가장 작은 값을 출력하고, 그 값을 배열에서 제거한다. 절댓값이 가장 작은 값이 여러개일 때는, 가장 작은 수를 출력하고, 그 값을 배열에서 제거한다.
 프로그램은 처음에 비어있는 배열에서 시작하게 된다.

 입력
 첫째 줄에 연산의 개수 N(1≤N≤100,000)이 주어진다. 다음 N개의 줄에는 연산에 대한 정보를 나타내는 정수 x가 주어진다. 만약 x가 0이 아니라면 배열에 x라는 값을 넣는(추가하는) 연산이고, x가 0이라면 배열에서 절댓값이 가장 작은 값을 출력하고 그 값을 배열에서 제거하는 경우이다. 입력되는 정수는 -231보다 크고, 231보다 작다.

 출력
 입력에서 0이 주어진 회수만큼 답을 출력한다. 만약 배열이 비어 있는 경우인데 절댓값이 가장 작은 값을 출력하라고 한 경우에는 0을 출력하면 된다.

 예제 입력 1
 18
 1
 -1
 0
 0
 0
 1
 1
 -1
 -1
 2
 -2
 0
 0
 0
 0
 0
 0
 0
 
 예제 출력 1
 -1
 1
 0
 -1
 -1
 1
 1
 -2
 2
 0
 */
