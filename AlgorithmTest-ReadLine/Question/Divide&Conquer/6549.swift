//
//  6549.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  9: 히스토그램에서 가장 큰 직사각형 https://www.acmicpc.net/problem/6549
//

import Foundation

/// 히스토그램에서 가장 큰 직사각형 https://www.acmicpc.net/problem/6549
func Q_6549() {
    func recursive(_ start: Int, _ end: Int, _ histogram: [Int]) -> Int {
        if end == start {
            return histogram[end]
        } else if end - start == 1 {
            if histogram[end] < histogram[start] {
                return max(2 * histogram[end], histogram[start])
            } else {
                return max(2 * histogram[start], histogram[end] )
            }
        }
        
        let mid = (start + end) / 2
        let leftArea = recursive(start, mid, histogram)
        let rightArea = recursive(mid, end, histogram)
        var (left, right) = (mid - 1, mid + 1)
        var midArea = histogram[mid]
        var height = histogram[mid]
        
        while start <= left, right <= end {
            if histogram[left] < histogram[right] {
                height = min(height, histogram[right])
                midArea = max(midArea, height * (right - left))
                right += 1
            } else {
                height = min(height, histogram[left])
                midArea = max(midArea, height * (right - left))
                left -= 1
            }
        }
        
        while start <= left {
            height = min(height, histogram[left])
            midArea = max(midArea, height * (right - left))
            left -= 1
        }
        
        while right <= end {
            height = min(height, histogram[right])
            midArea = max(midArea, height * (right - left))
            right += 1
        }
        
        return max(leftArea, rightArea, midArea)
    }
    
    var result = ""
    
    while let r = readLine(), r != "0" {
        let cmd = r.split(separator: " ").map { Int($0)! }
        result.write("\(recursive(1, cmd[0], cmd))\n")
    }
    
    print(result)
}


/// 히스토그램에서 가장 큰 직사각형 https://www.acmicpc.net/problem/6549
func Q_6549_스택() {
    var result = ""
    
    while let r = readLine(), r != "0" {
        let cmd = r.split(separator: " ").map { Int($0)! }
        let n = cmd[0]
        let histogram = Array(cmd[1...])
        
        var stack: [Int] = [], maxArea: Int = .min
        for i in 0..<n {
            while !stack.isEmpty, histogram[stack.last!] >= histogram[i] {
                // 최대 넓이 계산
                let height = histogram[stack.popLast()!]
                let width = stack.isEmpty ? i : i - 1 - stack.last!
                maxArea = max(maxArea, width * height)
            }
            
            stack.append(i)
        }
        
        // 남은 찌꺼기 없애기
        while !stack.isEmpty {
            let height = histogram[stack.popLast()!]
            let width = stack.isEmpty ? n : n - 1 - stack.last!
            maxArea = max(maxArea, width * height)
        }
        
        result.write("\(maxArea)\n")
    }
    
    print(result)
}

func Q_6549_스택2() {
    var result = ""

    while let r = readLine(), r != "0" {
        let cmd = r.split(separator: " ").map { Int($0)! }
        let n = cmd[0]
        let histogram = Array(cmd[1...]) + [.min]

        var stack: [Int] = [-1], maxArea: Int = .min
        for i in 0...n {
            while stack.count > 1, histogram[stack.last!] > histogram[i] {
                // 최대 넓이 계산
                let height = histogram[stack.popLast()!]
                let width = i - 1 - stack.last!
                maxArea = max(maxArea, width * height)
            }

            stack.append(i)
        }
        
        result.write("\(maxArea)\n")
    }

    print(result)
}

/*
 [풀이]
 (1) 완전탐색
  - 어떤 한 블록을 기준으로 잡았을 때, 그 블록의 높이로 만들 수 있는 직사각형의 넓이를 찾아야 한다.
  - 기준 블록을 잡은 뒤에는 왼쪽과 오른쪽으로 더 이상 확장할 수 없을 때까지 범위를 넓혀가며 직사각형의 넓이를 계산해 준다.
    - 배열의 범위 경곗값에 다다른 경우이거나, 그렇지 않은 경우 인덱스가 가리키는 블록의 높이가 기준 블록의 높이보다 작은 경우
  - 모든 블록에 대해서 위의 과정을 진행한다.
 
 (2) 스택: https://st-lab.tistory.com/255 링크참고
 
 (3) 분할정복 https://codable.tistory.com/1
  [기본]
  - 히스토그램을 반으로 분할한다.
    - 만약 배열의 크기가 2보다 큰 경우에는 가운데 인덱스를 중심으로 배열을 분할한다.
  - 배열 크기: [9] => [5] [4] => [3][2]  [2][2] => [2][1] (-)   (-) (-)
  - 배열의 범위가 1이거나 2인 경우에는, 해당 범위에서 만들 수 있는 직사각형 넓이의 최댓값을 반환한다.
  - 분할 기준점을 중심으로 왼쪽 범위에서의 최댓값과 오른쪽 범위에서의 최댓값을 비교한 뒤, 둘 중 큰 값을 반환한다.
 
  [문제점 및 개선]
           |
     4️⃣6️⃣8️⃣ 5️⃣7️⃣
     ⬜️⬜️🟪 ⬜️⬜️
     ⬜️⬜️🟪 ⬜️🟪
     ⬜️🟥🟥 ⬜️🟪
     ⬜️🟥🟥 🟧🟧
     🟪🟥🟥 🟧🟧
     🟪🟥🟥 🟧🟧
     🟪🟥🟥 🟧🟧
     🟪🟥🟥 🟧🟧
 
 - 세 번째 블록을 기준으로 나누어진 후 각각의 범위에서 최댓값을 반환한 경우
 - 왼쪽 범위에서의 최댓값은 빨간색 12(=2*6), 오른쪽 범위에서의 최댓값은 주황색 10(=2*5)으로 나타난다.
 
          |
    4️⃣6️⃣8️⃣ 5️⃣7️⃣
    ⬜️⬜️🟪 ⬜️⬜️
    ⬜️⬜️🟪 ⬜️🟪
    ⬜️🟪🟪 ⬜️🟪
    ⬜️🟨🟨 🟨🟨
    🟪🟨🟨 🟨🟨
    🟪🟨🟨 🟨🟨
    🟪🟨🟨 🟨🟨
    🟪🟨🟨 🟨🟨
 
 - 가장 큰 직사각형은 오른쪽 범위와 왼쪽 범위 모두에 걸쳐있는 형태로 나타나고, 이때의 최댓값은 노란색 20(=4*5)이다.
 
 - 완전 탐색과 같이, 중간값을 기준으로 양쪽으로 넓혀가며 최댓값을 찾는 작업이 필요하다.
 
    4️⃣6️⃣8️⃣ 5️⃣7️⃣
    ⬜️⬜️🟥 ⬜️⬜️
    ⬜️⬜️🟥 ⬜️🟪
    ⬜️🟪🟥 ⬜️🟪
    ⬜️🟪🟥 🟪🟪
    🟪🟪🟥 🟪🟪
    🟪🟪🟥 🟪🟪
    🟪🟪🟥 🟪🟪
    🟪🟪🟥 🟪🟪
 - 처음에는 중간값인 8에서 시작한다.
 
     4️⃣6️⃣8️⃣ 5️⃣7️⃣
     ⬜️⬜️🟪 ⬜️⬜️
     ⬜️⬜️🟪 ⬜️🟪
     ⬜️🟥🟥 ⬜️🟪
     ⬜️🟥🟥 🟪🟪
     🟪🟥🟥 🟪🟪
     🟪🟥🟥 🟪🟪
     🟪🟥🟥 🟪🟪
     🟪🟥🟥 🟪🟪
 - 이 후 왼쪽 또는 오른쪽으로 범위를 넓혀가는데, 둘 중에 "높이가 더 높은 쪽으로" 확장을 진행한다.
 - 더 넓은 왼쪽으로 확장, 넓이는 12(=2*6)
 
     4️⃣6️⃣8️⃣ 5️⃣7️⃣
     ⬜️⬜️🟪 ⬜️⬜️
     ⬜️⬜️🟪 ⬜️🟪
     ⬜️🟪🟪 ⬜️🟪
     ⬜️🟥🟥 🟥🟪
     🟪🟥🟥 🟥🟪
     🟪🟥🟥 🟥🟪
     🟪🟥🟥 🟥🟪
     🟪🟥🟥 🟥🟪
 - 다음으로는 왼쪽의 높이 4보다 오른쪽의 높이 5가 더 크기 때문에 오른쪽으로 확장을 한다.
 - 넓이 15(=3*5), 이전의 12보다 더 크므로 최대 넓이를 갱신한다.
 
     4️⃣6️⃣8️⃣ 5️⃣7️⃣
     ⬜️⬜️🟪 ⬜️⬜️
     ⬜️⬜️🟪 ⬜️🟪
     ⬜️🟪🟪 ⬜️🟪
     ⬜️🟥🟥 🟥🟥
     🟪🟥🟥 🟥🟥
     🟪🟥🟥 🟥🟥
     🟪🟥🟥 🟥🟥
     🟪🟥🟥 🟥🟥
 - 이후 높이가 7인 오른쪽으로 다시 확장을 진행한다.
 - 이때 넓이는 20(=4*5), 최대 넓이를 20으로 갱신한다.
 - 마지막으로 왼쪽의 4로 확장을 진행하는데, 이 경우 최대 넓이가 변하지 않기 때문에 넓이의 갱신은 발생하지 않는다.
 
 ----------
 
 히스토그램은 직사각형 여러 개가 아래쪽으로 정렬되어 있는 도형이다. 각 직사각형은 같은 너비를 가지고 있지만, 높이는 서로 다를 수도 있다.
 히스토그램에서 가장 넓이가 큰 직사각형을 구하는 프로그램을 작성하시오.
 
 입력
 입력은 테스트 케이스 여러 개로 이루어져 있다. 각 테스트 케이스는 한 줄로 이루어져 있고, 직사각형의 수 n이 가장 처음으로 주어진다. (1 ≤ n ≤ 100,000) 그 다음 n개의 정수 h1, ..., hn (0 ≤ hi ≤ 1,000,000,000)가 주어진다. 이 숫자들은 히스토그램에 있는 직사각형의 높이이며, 왼쪽부터 오른쪽까지 순서대로 주어진다. 모든 직사각형의 너비는 1이고, 입력의 마지막 줄에는 0이 하나 주어진다.

 출력
 각 테스트 케이스에 대해서, 히스토그램에서 가장 넓이가 큰 직사각형의 넓이를 출력한다.
 
 알고리즘 분류
 - 자료 구조
 - 세그먼트 트리
 - 분할 정복
 - 스택
 
 예제 입력 1
 7 2 1 4 5 1 3 3
 4 1000 1000 1000 1000
 0
 
 예제 출력 1
 8
 4000
 */
