//
//  1620.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_1620() {
    let r = readLine()!.split(separator: " ").map { Int($0)! }, (n, m) = (r[0], r[1])
    let pokemonsArr = (0..<n).map { _ in readLine()! }
    let pokemonsDict = Dictionary(uniqueKeysWithValues: zip(pokemonsArr, (1...n).map{$0})) // 26까지가 아니라 n까지임 (문제 수가 26개 고정이라고 착각)
    
    var result = ""
    for _ in 0..<m {
        let r = readLine()!
        
        if let number = Int(r) {
            result.write(pokemonsArr[number - 1] + "\n")
        } else {
            result.write("\(pokemonsDict[r]!)\n")
        }
    }
    
    print(result)
}

/*
 나는야 포켓몬 마스터 이다솜 https://www.acmicpc.net/problem/1620
 
 문제
 - 제약: N과 M은 1보다 크거나 같고, 100,000보다 작거나 같은 자연수
 - 입력: N개의 줄에 포켓몬의 번호가 1번인 포켓몬부터 N번에 해당하는 포켓몬까지 한 줄에 하나씩 입력
 - 출력: 첫째 줄부터 차례대로 M개의 줄에 각각의 문제에 대한 답
 
예제 입력 1
27 6
Bulbasaur
Ivysaur
Venusaur
Charmander
Charmeleon
Charizard
Squirtle
Wartortle
Blastoise
Caterpie
Metapod
Butterfree
Weedle
Kakuna
Beedrill
Pidgey
Pidgeotto
Pidgeot
Rattata
Raticate
Spearow
Fearow
Ekans
Arbok
Pikachu
Raichu
Reimarumon
25
Raichu
3
Pidgey
Kakuna
27
 
 예제 출력 1
 Pikachu
 26
 Venusaur
 16
 14
 */
