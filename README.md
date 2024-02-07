# ReadLine으로 Input 입력받기
## 정수 한 개 입력
```swift
let input = Int(readLine()!)!
```

## 정수 여러 개 입력 (스페이스 구분자)
```swift
let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
```

## 문자열 한 개 입력
```swift
let inputs = readLine()!
```

## 문자열 여러 개 입력 (스페이스 구분자)
```swift
let inputs = readLine()!.split(separator: " ")
```
```swift
let inputs = readLine()!.split { $0 == " " }
```

## 값을 여러 개 받음 (구분자 없음, 예: 123456, ABCDEF)
```swift
let inputs = Array(readLine()!).map { Int($0)! }
```
```swift
let inputs = Array(readLine()!).map { String($0)! }
```

## EOF(End of File) 처리
```swift
while let input = readLine() { ... }
```

## 빠른 입력 처리 1

<details>
<summary>접기/펼치기</summary>

```swift
import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
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

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시

            while now != 10
                    && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
            }

            return str
    }
}
```
</details>

## 빠른 입력 처리 2

<details>
<summary>접기/펼치기</summary>

```swift
import Foundation

class FileIO {
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
    
    @inline(__always) func readStringSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}
```
</details>
