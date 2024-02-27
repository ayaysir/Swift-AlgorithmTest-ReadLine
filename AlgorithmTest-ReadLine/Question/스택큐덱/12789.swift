//
//  12789.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/26/24.
//

import Foundation

func Q_12789_OLD() {
    _ = readLine()
    let queue = readLine()!.split(separator: " ").map { Int($0)! }
    var stack = [Int](), entrance = [0]
    var qIndex = 0
    
    while qIndex < queue.count {
        if let entranceLast = entrance.last {
            let current = queue[qIndex]
            if current == entranceLast + 1 {
                entrance += [current]
                qIndex += 1
            } else if let stackLast = stack.last, stackLast == entranceLast + 1  {
                entrance += [stackLast]
                _ = stack.popLast()
            } else {
                stack += [current]
                qIndex += 1
            }
        }
    }
    
    if stack.isEmpty {
        print("Nice")
    } else {
        while !stack.isEmpty {
            if let entranceLast = entrance.last, let popped = stack.popLast() {
                if entranceLast + 1 != popped {
                    print("Sad")
                    break
                }
                
                entrance += [popped]
            }
            
            if stack.isEmpty {
                print("Nice")
            }
        }
    }
}

func Q_12789() {
    _ = readLine()
    var people = readLine()!.split(separator: " ").reversed().map { Int($0)! }
    var stack = [Int](), entrance = [0]
    
    while !people.isEmpty {
        if let entranceLast = entrance.last, let current = people.last {
            if current == entranceLast + 1 {
                entrance += [people.popLast()!]
            } else if let stackLast = stack.last, stackLast == entranceLast + 1  {
                entrance += [stack.popLast()!]
            } else {
                stack += [people.popLast()!]
            }
        }
    }
    
    print(stack.isEmpty || stack == stack.sorted(by: >) ? "Nice" : "Sad")
}

/*
4
4 2 1 3
Nice
 
5
5 4 1 3 2
Nice
 
5
4 5 1 3 2
Sad
 
5
4 5 1 2 3
Sad
 
5
5 4 1 2 3
Nice
*/
