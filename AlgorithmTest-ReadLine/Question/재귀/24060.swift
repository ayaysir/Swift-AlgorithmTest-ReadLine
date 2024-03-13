//
//  24060.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/13/24.
//

import Foundation

func Q_24060() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    let k = r[1]
    var a = readLine()!.split(separator: " ").map { Int($0)! }
    var tmp: [Int] = .init(repeating: -1, count: a.count)
    var visitCount = 0
    
    mergeSort(0, a.count - 1)
    
    // 기록: 이동횟수가 k(저장횟수)에 못미칠 때
    if k > visitCount {
        print(-1)
    }
    
    func mergeSort(_ p: Int, _ r: Int) {
        if p < r {
            let q = (p + r) / 2
            mergeSort(p, q)
            mergeSort(q + 1, r)
            merge(p, r)
        }
    }
    
    func merge(_ p: Int, _ r: Int) {
        let q = (p + r) / 2
        // [💥💥💥] Pseudocode: t <- 1; 이라고 적혀있으나 실제 구현시 1이 아닌 0임에 유의
        var (i, j, t) = (p, q + 1, 0)
        
        while i <= q, j <= r {
            if a[i] <= a[j] {
                tmp[t] = a[i]
                t += 1
                i += 1
            } else {
                tmp[t] = a[j]
                t += 1
                j += 1
            }
        }
        
        while i <= q {
            tmp[t] = a[i]
            t += 1
            i += 1
        }
        
        while j <= r {
            tmp[t] = a[j]
            t += 1
            j += 1
        }
        
        // Pseudocode: t <- 1; 이라고 적혀있으나 실제 구현시 1이 아닌 0임에 유의
        (i, t) = (p, 0)
        while i <= r {
            a[i] = tmp[t]
            
            visitCount += 1
            if visitCount == k {
                // 기록: 저장횟수(k)에서 저장되는 수를 출력
                print(a[i])
                break
            }
            
            i += 1
            t += 1
        }
    }
}

/*
 알고리즘 수업 - 병합 정렬 1 https://www.acmicpc.net/problem/24060
  - 문제 요약: 주어진 [병합 정렬] 슈도코드를 참고해서 K 번째 저장 되는 수를 출력한다. 저장 횟수가 K 보다 작으면 -1을 출력한다.
 */
