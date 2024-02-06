//
//  15552.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/6/24.
//

import Foundation

func Q_15552() {
    let f = FileIO(); var s = ""
    (0..<f.readInt()).forEach({_ in s+="\(f.readInt()+f.readInt())\n"})
    print(s)
    
    final class FileIO {
        private let buffer: Data
        private var index: Int = 0
        init(fileHandle: FileHandle = FileHandle.standardInput) {
            self.buffer = try! fileHandle.readToEnd()!
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
            while now == 10 || now == 32 { now = read() }
            if now == 45 { isPositive.toggle(); now = read() }
            while now >= 48, now <= 57 {
                sum = sum * 10 + Int(now-48)
                now = read()
            }
            return sum * (isPositive ? 1:-1)
        }
    }
}
