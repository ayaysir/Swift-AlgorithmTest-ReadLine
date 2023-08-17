# ReadLine으로 Input 입력받기
## 정수 한 개 입력
```swift
let input = Int(readLine()!)!
```

## 정수 여러 개 입력 (스페이스 구분자)
```swift
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
```

## 문자열 한 개 입력
```swift
let inputs = readLine()!
```

## 문자열 여러 개 입력 (스페이스 구분자)
```swift
let inputs = readLine()!.split(separator: " ")
let inputs = readLine()!.split { $0 == " " }
```

## 값을 여러 개 받음 (구분자 없음, 예: 123456)
```swift
let inputs = Array(readLine()!).map { Int(String($0))! }
let inputs = Array(readLine()!).map { String($0)! }
```
