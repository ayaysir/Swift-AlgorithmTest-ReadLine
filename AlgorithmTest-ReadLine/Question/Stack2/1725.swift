//
//  1725.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/29/2024.
//
//  4: 히스토그램 https://www.acmicpc.net/problem/1725
//

import Foundation

/// 히스토그램 https://www.acmicpc.net/problem/1725
/// - 스택 1
func Q_1725_() {
    let n = Int(readLine()!)!
    let histogram = (0..<n).map { _ in Int(readLine()!)! }
    
    /// 인덱스 저장
    var stack: [Int] = []
    var maxResult: Int = .min
    
    for i in histogram.indices {
        while !stack.isEmpty, histogram[stack.last!] >= histogram[i] {
            let height = histogram[stack.popLast()!]
            let width = stack.isEmpty ? i : i - 1 - stack.last!
            maxResult = max(maxResult, width * height)
        }
        
        stack.append(i)
    }
    
    // 찌꺼기 없애기
    while !stack.isEmpty {
        let height = histogram[stack.popLast()!]
        let width = stack.isEmpty ? n : n - 1 - stack.last!
        maxResult = max(maxResult, width * height)
    }
    
    print(maxResult)
}

/// 히스토그램 https://www.acmicpc.net/problem/1725
/// - 스택 2 (마지막 추가작업 안하기)
func Q_1725__() {
    let n = Int(readLine()!)!
    let histogram = (0..<n).map { _ in Int(readLine()!)! } + [.min]
    
    /// 인덱스 저장
    var stack: [Int] = [-1]
    var maxResult: Int = .min
    
    for i in 0...n {
        while stack.count > 1, histogram[stack.last!] >= histogram[i] {
            let height = histogram[stack.popLast()!]
            let width = i - 1 - stack.last!
            maxResult = max(maxResult, width * height)
        }
        
        stack.append(i)
    }
    
    print(maxResult)
}

/// 히스토그램 https://www.acmicpc.net/problem/1725
/// - 분할 정복
func Q_1725() {
    let n = Int(readLine()!)!
    let histogram = (0..<n).map { _ in Int(readLine()!)! }
    print(recursive(0, n - 1, histogram))
    
    func recursive(_ start: Int, _ end: Int, _ histogram: [Int]) -> Int {
        if end == start {
            return histogram[end]
        } else if end - start == 1 {
            if histogram[end] < histogram[start] {
                return max(2 * histogram[end], histogram[start])
            } else {
                return max(histogram[end], 2 * histogram[start])
            }
        }
        
        let mid = (start + end) / 2
        let leftArea = recursive(start, mid, histogram)
        let rightArea = recursive(mid, end, histogram)
        var midArea = histogram[mid]
        var height = histogram[mid]
        var (left, right) = (mid - 1, mid + 1)
        
        let shrinkLeft: (() -> Void) = {
            height = min(height, histogram[left])
            midArea = max(midArea, height * (right - left))
            left -= 1
        }
        
        let expandRight: (() -> Void) = {
            height = min(height, histogram[right])
            midArea = max(midArea, height * (right - left))
            right += 1
        }
        
        while start <= left, right <= end {
            histogram[left] < histogram[right] ? expandRight() : shrinkLeft()
        }
        
        while start <= left {
            shrinkLeft()
        }
        
        while right <= end {
            expandRight()
        }
        
        return max(leftArea, rightArea, midArea)
    }
}

/*
 [풀이] https://st-lab.tistory.com/255
 6549(히스토그램에서 가장 큰 직사각형) 문제와 풀이법 동일
 1. 분할정복
   => 6549번 문제로
 
 2. 스택 https://loosie.tistory.com/305
 (1) index를 기준으로 해당 히스토그램을 탐색을 한다.
   - 높이만 탐색하는 것이 아니라 구간을 탐색하는 것이기 때문에 히스토그램의 index와 높이 두 값이 모두 필요하기 때문이다.
 (2) i를 탐색할 때 현재 새로 들어온 직사각형의 높이(arr[i])와 이전(arr[s.peek])에 위치한 높이와 비교한다.
     1) arr[i] >= arr[s.peek] : 새로 들어온 직사각형의 높이가 더 클 경우, 이전보다 지금 새로 들어온 직사각형에서 큰 직사각형의 넓이가 나올 수 있으므로 while문을 패스한다
     2) arr[i] < arr[s.peek] 이전에 위치한 직사각형 높이가 더 클 경우 큰 직사각형이 이전에 위치할 확률이 높으므로 넓이를
        구해준다.   ☛ arr[i]보다 작거나 같은 값이 나올 때까지 반복
 (3) 2번의 연산이 끝났으면(최대 넓이를 구했거나 패스했거나) i를 stack에 넣어준다.
 
 [로직]
 - Stack에 2-1) 새로 들어오는 직사각형의 높이가 현재 직사각형의 높이보다 클 경우 값을 append해준다. 그러면 자연스럽게 새로 들어오는 직사각형들의 높이는 이전보다 높다는 것을 알 수 있다.
 - 그리고나서 이젠 2-2) 새로 들어오는 직사각형이 현재 직사각형의 높이보다 작다면 이전의 직사각형이 더 크다는 소리이므로 이전까지 쌓아왔던 내림차순(Stack은 후입선출이므로)으로 되어있는 직사각형 높이들을 모두 조회해준다.
 - 단, 새로 들어오는 직사각형의 높이보다 큰 경우까지만 조회해준다. 이유는 높이가 같거나 낮으면 새로 들어오는 직사각형과 같이 넓이를 구할 수 있는 직사각형이기 때문이다.
 
 [시뮬레이션]
 arr : [ 2 1 4 5 1 3 3 ]
 
 (i = 2)
 ⬜️⬇️⬜️🟨⬜️⬜️⬜️   새로 들어오는 직사각형(histogram[i])이 현재 직사각형의 높이(stack.peek)보다 작다면 계산을 해준다.
 ⬜️⬜️🟨🟨⬜️⬜️⬜️   이전 직사각형의 높이를 계산해준다. 앞으로 계산할 이유가 없는 직사각형이이므로 계산해주고 stack에서 제거한다.
 ⬜️⬜️🟨🟨⬜️🟨🟨   stack.pop
 🟥⬜️🟨🟨⬜️🟨🟨   넓이 = arr[1] * 1(=>2-1-(-1)) = 2
 🟥🟩🟨🟨🟨🟨🟨
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 
 (i = 5)
 ⬜️⬜️⬜️🟥⬇️⬜️⬜️
 ⬜️⬜️🟨🟥⬜️⬜️⬜️
 ⬜️⬜️🟨🟥⬜️🟨🟨   arr[2] == arr[5] 로 높이가 똑같으므로 3번까지만 계산하고 while문 종료
 🟨⬜️🟨🟥⬜️🟨🟨   stack.pop => 4번 직사각형
 🟨🟨🟨🟥🟩🟨🟨   넓이1 = arr[4] * 1(=>5-1-3) = 5
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 
 ⬜️⬜️⬜️🟨⬇️⬜️⬜️
 ⬜️⬜️🟥🟥⬜️🟨🟨
 ⬜️⬜️🟥🟥⬜️🟨🟨   stack.pop => 3번 직사각형
 🟨⬜️🟥🟥⬜️🟨🟨   넓이2 = arr[3] * 2(=>5-1-2) = 8
 🟨🟨🟥🟥🟩🟨🟨
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 
 (i = 8)
 ⬜️⬜️⬜️🟨⬜️⬜️⬜️⬇️ 마지막까지 조회가 완료되었다면 여태까지 stack에 남아있는 계산하지 못한 직사각형들을 모조리 계산해준다.
 ⬜️⬜️🟨🟨⬜️🟨🟥   stack.pop => 7번 직사각형
 ⬜️⬜️🟨🟨⬜️🟨🟥   넓이1 = arr[7] * 1(=>8-1-6) = 3
 🟨⬜️🟨🟨⬜️🟨🟥
 🟨🟨🟨🟨🟨🟨🟥🟩
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 
 ⬜️⬜️⬜️🟨⬜️⬜️⬜️⬇️
 ⬜️⬜️🟨🟨⬜️🟥🟥
 ⬜️⬜️🟨🟨⬜️🟥🟥   stack.pop => 6번 직사각형
 🟨⬜️🟨🟨⬜️🟥🟥   넓이2 = arr[6] * 2(=>8-1-5) = 6
 🟨🟨🟨🟨🟨🟥🟥🟩
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 
 ⬜️⬜️⬜️🟨⬜️⬜️⬜️⬇️
 ⬜️⬜️🟨🟨⬜️🟨🟨
 ⬜️⬜️🟨🟨⬜️🟨🟨   stack.pop => 5번 직사각형
 🟨⬜️🟨🟨⬜️🟨🟨   넓이3 = arr[5] * 5(=>8-1-2) = 5
 🟨🟨🟥🟥🟥🟥🟥🟩
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 
 ⬜️⬜️⬜️🟨⬜️⬜️⬜️⬇️
 ⬜️⬜️🟨🟨⬜️🟨🟨   stack.pop => 2번 직사각형
 ⬜️⬜️🟨🟨⬜️🟨🟨   arr[2] * 7(8-1-0) = 5
 🟨⬜️🟨🟨⬜️🟨🟨
 🟥🟥🟥🟥🟥🟥🟥🟩
 1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣
 */
