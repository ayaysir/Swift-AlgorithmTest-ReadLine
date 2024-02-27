//
//  4949.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/26/24.
//

import Foundation

func Q_4949_OLD() {
    func isPair(_ prev: String, _ next: String) -> Bool {
        switch prev {
        case "(": return next == ")"
        case "[": return next == "]"
        default: return false
        }
    }

    while let r = readLine(), r != "." {
        var stack1 = r.filter { String($0).rangeOfCharacter(from: .init(charactersIn: "()[]").inverted) == nil }.map(String.init)
        var stack2 = [String]()
        
        while !stack1.isEmpty {
            let popped = stack1.popLast()!
            if !stack2.isEmpty, isPair(popped, stack2.last!) {
                _ = stack2.popLast()
            } else {
                stack2 += [popped]
            }
        }
        
        // [💥💥💥] YES, NO가 아니고 yes, no로 출력해야함
        print(stack2.count == 0 ? "yes" :  "no")
    }
}

func Q_4949() {
    func isPair(_ prev: String, _ next: String) -> Bool {
        switch prev {
            case "(": return next == ")"
            case "[": return next == "]"
            default: return false
        }
    }

    while let r = readLine(), r != "." {
        var stack = [String]()
        for s in r.map(String.init) where s.rangeOfCharacter(from: .init(charactersIn: "()[]").inverted) == nil {
            if let last = stack.last, isPair(last, s) {
                _ = stack.popLast()
            } else {
                stack += [s]
            }
        }

        // [💥💥💥] YES, NO가 아니고 yes, no로 출력해야함
        print(stack.count == 0  ? "yes" : "no")
    }
}
