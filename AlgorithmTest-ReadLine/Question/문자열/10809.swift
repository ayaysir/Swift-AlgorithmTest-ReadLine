//
//  10809.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/9/24.
//

import Foundation

func Q_10809() {
    var a = Array(repeating:"-1",count:26),s = readLine()!.map{$0.asciiValue!}
    for i in 0..<s.count{let x = Int(s[i] - 97);if(a[x]=="-1"){a[x] = "\(i)"}}
    print(a.joined(separator:" "))
}

func Q_10809_OLD() {
    var a = Array(repeating: "-1", count: 26), s = readLine()!.map{ $0.asciiValue! }
    
    for i in 0..<s.count {
        let x = Int(s[i] - 97)
        if a[x] == "-1"  { a[x] = "\(i)" }
    }
    
    print(a.joined(separator:" "))
}
