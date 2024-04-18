//
//  4195.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/16/2024.
//
//  3: 친구 네트워크 https://www.acmicpc.net/problem/4195
//

import Foundation

/// 친구 네트워크 https://www.acmicpc.net/problem/4195
func Q_4195() {
    var unf: [String : String]!
    var visited: [String : Int]!
    
    func find(_ x: String) -> String {
        guard x != unf[x] else {
            return x
        }
        
        unf[x] = find(unf[x]!)
        return unf[x]!
    }
    
    func union(_ x: String, _ y: String) {
        let (x, y) = (find(x), find(y))
        
        guard x != y else {
            return
        }
        
        unf[y] = x
        // 🆕 방문기록 저장
        visited[x]! += visited[y]!
    }
    
    var result = ""
    
    for _ in 0..<Int(readLine()!)! {
        let n = Int(readLine()!)!
        
        unf = .init()
        visited = .init()
        
        // 사전 초기화
        for _ in 0..<n {
            let people = readLine()!.split(separator: " ").map(String.init)
            let (a, b) = (people[0], people[1])
            
            if unf[a] == nil {
                unf[a] = a
                visited[a] = 1
            }
            
            if unf[b] == nil {
                unf[b] = b
                visited[b] = 1
            }
            
            // 유니언
            union(a, b)
            // print(a, find(a), visited)
            result.write("\(visited[find(a)]!)\n")
        }
    }
    
    print(result)
}

/*
 [풀이] https://velog.io/@rhdmstj17/백준-4195번-친구-네트워크-python-union-find
 - 기존 배열 타입으로 된 Union Find를 사전으로 변경
   - 키: 사람 이름
   - 값: 그 사람의 부모 노드 이름
   - 무조건 input에서 먼저 입력된 값을 상위 부모라고 간주한다.
 - union 과정에서 방문기록을 저장하는 visited를 추가
   - 키: 사람 이름
   - 값: 탐색 횟수 => 그 사람의 친구수
   - 유니언 할때 y의 탐색 횟수를 x에 더해준다 => 유니언 될때마다 x와 y의 탐색횟수가 x로 합쳐진다.
   => 두 사람의 친구수를 합친 값이 x에 갱신된다.
 - union(a, b)를 한 뒤
   - a의 부모를 찾는다: find(a)
   - 그 부모의 방문 횟수(=>친구수)를 출력한다. visited[find(a)]
 
 ---------
 
 문제
 민혁이는 소셜 네트워크 사이트에서 친구를 만드는 것을 좋아하는 친구이다. 우표를 모으는 취미가 있듯이, 민혁이는 소셜 네트워크 사이트에서 친구를 모으는 것이 취미이다.

 어떤 사이트의 친구 관계가 생긴 순서대로 주어졌을 때, 두 사람의 친구 네트워크에 몇 명이 있는지 구하는 프로그램을 작성하시오.

 친구 네트워크란 친구 관계만으로 이동할 수 있는 사이를 말한다.

 입력
 첫째 줄에 테스트 케이스의 개수가 주어진다. 각 테스트 케이스의 첫째 줄에는 친구 관계의 수 F가 주어지며, 이 값은 100,000을 넘지 않는다. 다음 F개의 줄에는 친구 관계가 생긴 순서대로 주어진다. 친구 관계는 두 사용자의 아이디로 이루어져 있으며, 알파벳 대문자 또는 소문자로만 이루어진 길이 20 이하의 문자열이다.

 출력
 친구 관계가 생길 때마다, 두 사람의 친구 네트워크에 몇 명이 있는지 구하는 프로그램을 작성하시오.

 예제 입력 1
 2
 3
 Fred Barney
 Barney Betty
 Betty Wilma
 3
 Fred Barney
 Betty Wilma
 Barney Betty
 
 예제 출력 1
 2
 3
 4
 2
 2
 4
 
 [반례]
 
1
8
a b
b c
d e
e f
g h
h i
a f
c i
 
 ans:
 2
 3
 2
 3
 2
 3
 6
 9
 
1
4
a b
b c
c a
b a
 ans:
 2
 3
 3
 3
 
1
7
a b
b c
c a
d e
e d
d e
a b
 ans:
 2
 3
 3
 2
 2
 2
 3
 
1
9
a b
c d
e f
g h
b c
f g
d e
h a
b g
 ans:
 2
 2
 2
 2
 4
 4
 8
 8
 8
 */
