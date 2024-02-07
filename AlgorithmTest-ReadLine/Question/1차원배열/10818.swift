//
//  10818.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/7/24.
//

import Foundation

func Q_10818() {
    _=readLine();let a = readLine()!.split{$0==" "}.map{Int($0)!}
    print(a.min()!,a.max()!)
}
