//
//  24511.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/27/24.
//

import Foundation

func Q_24511() {
    _ = Int(readLine()!)!
    let refs = readLine()!.split{ $0 == " " }.map { $0 == "0" ? true : false}
    var deq = CompactDeque<Int>()
    readLine()!.split{ $0 == " " }.enumerated().forEach { if refs[$0.offset] {deq.enqueueRear(Int($0.element)!)} }
    
    _ = readLine()
    let inputs = readLine()!.split{ $0 == " " }.map{Int($0)!}
    var result = ""
    
    for input in inputs {
        if deq.isEmpty {
            result.write("\(input) ")
        } else {
            result.write("\(deq.dequeueRear()!) ")
            deq.enqueueFront(input)
        }
    }
    
    print(result)
    
    struct CompactDeque<T> {
        private var enq: [T] = .init(), deq: [T] = .init()
        
        var isEmpty: Bool {
            deq.isEmpty && enq.isEmpty ? true : false
        }
        
        /// 앞에 삽입
        mutating func enqueueFront(_ element: T) {
            deq.append(element)
        }
        
        /// 뒤에 삽입
        mutating func enqueueRear(_ element: T) {
            enq.append(element)
        }
        
        /// 뒤 빼고 제거
        mutating func dequeueRear() -> T? {
            if enq.isEmpty {
                if deq.isEmpty {
                    return nil
                }
                
                enq = deq.reversed()
                deq.removeAll()
                return enq.popLast()!
            } else {
                return enq.popLast()!
            }
        }
    }
}

/*
 [해설]
 https://codio.tistory.com/entry/%EB%B0%B1%EC%A4%80-24511%EB%B2%88-queuestack-Python%ED%8C%8C%EC%9D%B4%EC%8D%AC
 - 스택은 어차피 뒤에서 들어왔다 나가므로 신경안써도됨
 - 큐는 방문할때마다 입력, 출력값이 바뀌는데 개별 큐가 합쳐지면 유기체처럼 동작
   - 스택을 전부 제거하고 큐만 합친다음 덱(앞으로 삽입, 뒤로 출력)을 사용하면 답이 나옴
 
 ===============================
 
 queuestack https://www.acmicpc.net/problem/24511

 출력
 수열
 $C$의 원소를 차례대로 queuestack에 삽입했을 때의 리턴값을 공백으로 구분하여 출력한다.
 (=> 맨 마지막 스택/큐에서 pop된 값)

 예제 입력 1
4
0 1 1 0
1 2 3 4
3
2 4 7
 
 예제 출력 1
 4 1 2
 
 각 상태에 대한 큐스택 내부를 표현하면 다음과 같다.

 초기 상태 :
 $[1, 2, 3, 4]$
 첫 번째 원소 삽입 :
 $[2, 2, 3, 1]$
 두 번째 원소 삽입 :
 $[4, 2, 3, 2]$
 세 번째 원소 삽입 :
 $[7, 2, 3, 4]$
 
 예제 입력 2
5
1 1 1 1 1
1 2 3 4 5
3
1 3 5
 
 예제 출력 2
 1 3 5
 */
