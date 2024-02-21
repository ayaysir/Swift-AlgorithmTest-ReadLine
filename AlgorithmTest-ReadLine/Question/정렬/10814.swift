//
//  10814.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/21/24.
//

import Foundation

func Q_10814() {
    typealias Member = (age: Int, name: String)
    let members: [Member] = (0..<Int(readLine()!)!).map { _ in
        let r = readLine()!.split(separator: " ")
        return (Int(r[0])!, String(r[1]))
    }

    members.sorted { $0.age < $1.age }.forEach { print($0.age, $0.name) }
}
