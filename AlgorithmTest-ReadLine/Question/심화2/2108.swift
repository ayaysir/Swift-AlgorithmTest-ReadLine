//
//  2108.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/12/24.
//

import Foundation

func Q_2108_시간초과() {
    // import Foundation
    
    let f = IO()
    var numbers: [Int] = [], sum = 0
    var freqs: [Int: Int] = [:]
    var maxValue: Int = .min, minValue: Int = .max
    
    for _ in 0..<f.readInt() {
        let number = f.readInt()
        
        numbers.append(number)
        
        freqs[number, default: 0] += 1
        sum += number
        
        maxValue = max(maxValue, number)
        minValue = min(minValue, number)
    }
    
    // 산술평균
    print(Int(round(Double(sum) / Double(numbers.count))))
    
    // 중앙값
    numbers.sort()
    print(numbers[numbers.count / 2])
    
    // 최빈값
    let maxFreq = freqs.values.max()!
    let maxFreqs = freqs.filter { $0.value == maxFreq }.keys.sorted()
    print(maxFreqs[maxFreqs.count == 1 ? 0 : 1])
    
    // 범위
    print(maxValue - minValue)
    
    final class IO {
        @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
        
        @inline(__always) private func readByte() -> UInt8 {
            defer { byteIdx += 1 }
            return buffer.withUnsafeBufferPointer { $0[byteIdx] }
        }
        
        @inline(__always) func readInt() -> Int {
            var number = 0, byte = readByte(), isNegative = false
            while byte == 10 || byte == 32 { byte = readByte() }
            if byte == 45 { byte = readByte(); isNegative = true }
            while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
            return number * (isNegative ? -1 : 1)
        }
        
        @inline(__always) private func write(_ output: String) {
            FileHandle.standardOutput.write(output.data(using: .utf8)!)
        }
    }
}

func Q_2108() {
    // import Foundation
    
    var numbers: [Int] = []
    var freqs: [Int: Int] = [:]
    var sum = 0
    
    for _ in 0..<Int(readLine()!)! {
        let number = Int(readLine()!)!
        sum += number
        
        numbers.append(number)
        
        freqs[number, default: 0] += 1
    }
    
    // 산술평균
    print(Int(round(Double(sum) / Double(numbers.count))))
    
    // 중앙값
    numbers.sort()
    print(numbers[numbers.count / 2])
    
    // 최빈값
    let maxFreq = freqs.max { $0.value < $1.value }
    let modes = freqs.filter { $0.value == maxFreq!.value }.keys.sorted()
    
    if modes.count == 1 {
        print(modes.first!)
    } else {
        print(modes[1])
    }
    
    // 범위
    print(numbers.max()! - numbers.min()!)
}

/*
[💥💥💥]
 - 시간초과 피한답시고 시도했던 여러 방법들이 오히려 역효과
   - ReadLine 사용해도 문제없음
 - 산술합계 구할때만 sum 변수 사용하고, 나머지는 배열, 사전에 전부 넣은다음 나중에 한번에
 - 배열, 사전 정렬/필터링도 입력 끝나고 한번에
 
통계학 https://www.acmicpc.net/problem/2108

문제
수를 처리하는 것은 통계학에서 상당히 중요한 일이다. 통계학에서 N개의 수를 대표하는 기본 통계값에는 다음과 같은 것들이 있다. 단, N은 홀수라고 가정하자.

산술평균 : N개의 수들의 합을 N으로 나눈 값
중앙값 : N개의 수들을 증가하는 순서로 나열했을 경우 그 중앙에 위치하는 값
최빈값 : N개의 수들 중 가장 많이 나타나는 값
범위 : N개의 수들 중 최댓값과 최솟값의 차이
N개의 수가 주어졌을 때, 네 가지 기본 통계값을 구하는 프로그램을 작성하시오.

입력첫
첫째 줄에 수의 개수 N(1 ≤ N ≤ 500,000)이 주어진다. 단, N은 홀수이다. 그 다음 N개의 줄에는 정수들이 주어진다. 입력되는 정수의 절댓값은 4,000을 넘지 않는다.

출력
첫째 줄에는 산술평균을 출력한다. 소수점 이하 첫째 자리에서 반올림한 값을 출력한다.

둘째 줄에는 중앙값을 출력한다.

셋째 줄에는 최빈값을 출력한다. 여러 개 있을 때에는 최빈값 중 두 번째로 작은 값을 출력한다.

넷째 줄에는 범위를 출력한다.

예제 입력 1
5
1
3
8
-2
2
예제 출력 1
2
2
1
10

예제 입력 2
1
4000
예제 출력 2
4000
4000
4000
0

예제 입력 3
5
-1
-2
-3
-1
-2
예제 출력 3
-2
-2
-1
2

예제 입력 4
3
0
0
-1
예제 출력 4
0
0
0
1

(0 + 0 + (-1)) / 3 = -0.333333... 이고 이를 첫째 자리에서 반올림하면 0이다. -0으로 출력하면 안된다.
*/
