//
//  13241.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/23/24.
//

import Foundation

func Q_13241() {
    func findGCD(_ a: Int, _ b: Int) -> Int {
        (a % b == 0) ? b : findGCD(b, a % b)
    }
    
    let r = readLine()!.split(separator: " ").map { Int($0)! }
    print(r[0] * r[1] / findGCD(r[0], r[1]))
}

func Q_13241_SHORT() {
    func f(_ a:Int,_ b:Int)->Int{(a%b==0) ?b:f(b,a%b)}
    let r=readLine()!.split{$0==" "}.map{Int($0)!},a=r[0],b=r[1]
    print(a*b/f(a,b))
}
