//
//  1269.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_1269_() {
    _ = readLine()
    let A = Set(readLine()!.split(separator: " ").map { Int($0)! })
    let B = Set(readLine()!.split(separator: " ").map { Int($0)! })
    var (aCount, bCount) = (0, 0)
    
    for a in A {
        aCount += !B.contains(a) ? 1 : 0
    }
    
    for b in B {
        bCount += !A.contains(b) ? 1 : 0
    }
    
    print(aCount + bCount)
}

func Q_1269() {
    // var r={readLine()!.split{$0==" "}},_=r(),A=Set(r()),B=Set(r()),a=0,b=0
    // for e in A{a+=B.contains(e) ?0:1}
    // for e in B{b+=A.contains(e) ?0:1}
    // print(a+b)
    
    let r={readLine()!.split{$0==" "}},_=r(),A=Set(r()),B=Set(r())
    print(A.symmetricDifference(B).count)
}
