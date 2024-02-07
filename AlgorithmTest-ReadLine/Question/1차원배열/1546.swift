//
//  1546.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/7/24.
//

import Foundation

func Q_1546() {
    let n = Float(readLine()!)!,a = readLine()!.split{$0==" "}.map{Float($0)!},mx = a.max()!
    print(a.reduce(0){$0+$1/mx*100/n})
}
