//
//  10989.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

/*
 아래 Q_10989() 함수를 그대로 복붙했으면 실행하는 코드 Q_10989()를 넣자
 30분동안 뻘짓함ㅠㅠ ㅋㅋㅋㅋㅋㅋ
 */
func Q_10989() {
    // 주어진 조건에서 수의 범위가 정해져 있고 개수가 많을 때, 일반적으로 계수 정렬(Counting Sort)이 가장 효과적인 정렬 알고리즘 중 하나입니다.
    let f = FileIO()
    var array: [Int] = .init(repeating: 0, count: 10001) // 여기는 빈도수 세는 배열이므로 count가 n이 아니고 최대값
    for _ in 0..<f.readInt() {
        array[f.readInt()] += 1
    }
    
    var result = ""
    for i in 1...10000 {
        result += String(repeating: "\(i)\n", count: array[i])
        
        // while array[i] > 0 {
        //     result.write("\(i)\n")
        //     array[i] -= 1
        // }
        
        // for _ in 0..<array[i] {
        //     result.write("\(i)\n")
        // }
    }
    
    print(result)
}

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10 && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

// class FileIO {
//     @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
//
//     @inline(__always) private func readByte() -> UInt8 {
//         defer { byteIdx += 1 }
//         return buffer.withUnsafeBufferPointer { $0[byteIdx] }
//     }
//
//     @inline(__always) func readInt() -> Int {
//         var number = 0, byte = readByte(), isNegative = false
//         while byte == 10 || byte == 32 { byte = readByte() }
//         if byte == 45 { byte = readByte(); isNegative = true }
//         while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
//         return number * (isNegative ? -1 : 1)
//     }
//
//     @inline(__always) func readStringSum() -> Int {
//         var byte = readByte()
//         while byte == 10 || byte == 32 { byte = readByte() }
//         var sum = Int(byte)
//         while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
//         return sum - Int(byte)
//     }
//
//     @inline(__always) private func write(_ output: String) {
//         FileHandle.standardOutput.write(output.data(using: .utf8)!)
//     }
// }
