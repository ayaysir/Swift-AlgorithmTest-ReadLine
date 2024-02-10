//
//  1316.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/10/24.
//

import Foundation

func Q_1316() {
    var result = 0
    for _ in 0..<Int(readLine()!)! {
        let word = readLine()!.map(String.init)
        var grouped: [String] = [word.first!]
        for i in 1..<word.count where word[i - 1] != word[i] {
            grouped.append(word[i])
        }
        
        result += Set(word).count == grouped.count ? 1 : 0
    }
    
    print(result)
}

func Q_1316_SHORT() {
    // print((0..<Int(readLine()!)!).reduce(0){$1;var w=readLine()!.map{$0},g=[w[0]]
    //     for i in 1..<w.count where w[i-1] != w[i]{g.append(w[i])}
    //     return $0+(Set(w).count==g.count ?1:0)})
}

/*
예제 입력 1
3
happy
new
year
예제 출력 1
3
 
예제 입력 2
4
aba
abab
abcabc
a
예제 출력 2
1
 
예제 입력 3
5
ab
aa
aca
ba
bb
예제 출력 3
4
 
예제 입력 4
2
yzyzy
zyzyz
예제 출력 4
0
 
예제 입력 5
1
z
예제 출력 5
1
 
예제 입력 6
9
aaa
aaazbz
babb
aazz
azbz
aabbaa
abacc
aba
zzaz
예제 출력 6
2
 */
