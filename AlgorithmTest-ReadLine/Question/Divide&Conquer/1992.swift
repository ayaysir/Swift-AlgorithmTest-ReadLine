//
//  1992.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/23/2024.
//
//  2: 쿼드트리 https://www.acmicpc.net/problem/1992
//

import Foundation

/// 쿼드트리 https://www.acmicpc.net/problem/1992
func Q_1992() {
    let n = Int(readLine()!)!
    let a = (0..<n).map { _ in readLine()!.map(String.init) }
    
    func isAllSame(_ y: Int, _ x: Int, _ size: Int) -> String? {
        for i in 0..<size {
            for j in 0..<size {
                if a[y+i][x+j] != a[y][x] {
                    return nil
                }
            }
        }
        
        return a[y][x]
    }
    
    var result = ""
    func recursive(_ y: Int = 0, _ x: Int = 0, _ size: Int = n) {
        if let char = isAllSame(y, x, size) {
            result += char
            return
        }
        
        result += "("
        
        let size = size / 2
        for i in [0, 1] {
            for j in [0, 1] {
                recursive(y + size * i, x + size * j, size)
            }
        }
        
        result += ")"
    }
    
    recursive()
    print(result)
    // print(result
    //     .replacingOccurrences(of: "(", with: "x")
    //     .replacingOccurrences(of: ")", with: "")
    //     .replacingOccurrences(of: "0", with: "b")
    //     .replacingOccurrences(of: "1", with: "w"))
    // 
    let decompressedString = decompressQuadtree(compressed: result)
        .map { $0.joined(separator: " ") }
        .joined(separator: "\n")
    print("decompressed:", decompressedString, separator: "\n")
}

/*
 [풀이]
 - 종료 조건에서는 괄호가 들어가면 안됨
 - 괄호는 n * n 인 상황에서만 묶여야 되고, 괄호로 묶인 그룹의 왼편은 사이즈가 동일하다.
 - for문 전에 괄호가 시작되고, 가로세로가 동일한 사이즈에서 괄호가 닫혀야 하므로 for문 끝난 이후에 괄호가 닫히낟.
  예)
 
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 1 1 1 1
0 0 0 0 1 1 1 1
 
 0(0011) => 왼쪽 사이즈는 4*4 이고, 오른쪽 사이즈는 각각 2*2이므로 그룹의 사이즈는 4*4이다.

 -----------
 
 문제
 흑백 영상을 압축하여 표현하는 데이터 구조로 쿼드 트리(Quad Tree)라는 방법이 있다. 흰 점을 나타내는 0과 검은 점을 나타내는 1로만 이루어진 영상(2차원 배열)에서 같은 숫자의 점들이 한 곳에 많이 몰려있으면, 쿼드 트리에서는 이를 압축하여 간단히 표현할 수 있다.

 주어진 영상이 모두 0으로만 되어 있으면 압축 결과는 "0"이 되고, 모두 1로만 되어 있으면 압축 결과는 "1"이 된다. 만약 0과 1이 섞여 있으면 전체를 한 번에 나타내지를 못하고, 왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래, 이렇게 4개의 영상으로 나누어 압축하게 되며, 이 4개의 영역을 압축한 결과를 차례대로 괄호 안에 묶어서 표현한다
 
 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0
 0 0 0 0 1 1 1 1
 0 0 0 0 1 1 1 1
 0 0 0 1 1 1 1 1
 0 0 1 1 1 1 1 1
 0 0 1 1 1 1 1 1
 0 0 1 1 1 1 1 1

 위 그림에서 왼쪽의 영상은 오른쪽의 배열과 같이 숫자로 주어지며, 이 영상을 쿼드 트리 구조를 이용하여 압축하면 "(0(0011)(0(0111)01)1)"로 표현된다. N ×N 크기의 영상이 주어질 때, 이 영상을 압축한 결과를 출력하는 프로그램을 작성하시오.

 입력
 첫째 줄에는 영상의 크기를 나타내는 숫자 N 이 주어진다. N 은 언제나 2의 제곱수로 주어지며, 1 ≤ N ≤ 64의 범위를 가진다. 두 번째 줄부터는 길이 N의 문자열이 N개 들어온다. 각 문자열은 0 또는 1의 숫자로 이루어져 있으며, 영상의 각 점들을 나타낸다.

 출력
 영상을 압축한 결과를 출력한다.

 예제 입력 1
8
11110000
11110000
00011100
00011100
11110000
11110000
11110011
11110011
 
 예제 출력 1
 ((110(0101))(0010)1(0001))
 
 예제 2
4
0011
0011
1000
0100
 (01(1001)0)
 참고: xbwxwbbwb
 - "("만 있어도 압축 해제할 수 있음
 - https://velog.io/@qwe910205/문제-풀이-쿼드-트리-뒤집기JAVA
 - https://www.algospot.com/judge/problem/read/QUADTREE
 */

func decompressQuadtree(compressed: String, size: Int? = nil) -> [[String]] {
    let compressed = compressed.replacingOccurrences(of: ")", with: "")
    let compressedArray = compressed.map(String.init)
    
    let size = size ?? getSize()
    var matrix = Array(repeating: Array(repeating: "0", count: size), count: size)
    
    var stringIndex = 0
    decompress(stringIndex: &stringIndex, size: size)
    
    func decompress(stringIndex: inout Int, row: Int = 0, col: Int = 0, size: Int) {
        let head = compressedArray[stringIndex]
        stringIndex += 1
        
        if head == "0" || head == "1" {
            for i in 0..<size {
                for j in 0..<size {
                    matrix[row + i][col + j] = (head == "1" ? "1" : "0")
                }
            }
        } else {
            let half = size / 2
            decompress(stringIndex: &stringIndex, row: row, col: col, size: half)
            decompress(stringIndex: &stringIndex, row: row, col: col + half, size: half)
            decompress(stringIndex: &stringIndex, row: row + half, col: col, size: half)
            decompress(stringIndex: &stringIndex, row: row + half, col: col + half, size: half)
        }
    }
    
    func getSize() -> Int {
        var stringIndex = 0
        let depth = Double(getDepth(stringIndex: &stringIndex, depth: 0))
        return Int(pow(Double(2), depth))
    }
    
    func getDepth(stringIndex: inout Int, depth: Int) -> Int {
        let head = compressedArray[stringIndex]
        stringIndex += 1
        
        var maxDepth = depth
        if head == "0" || head == "1" {
            return depth
        } else {
            for _ in 0..<4 {
                maxDepth = max(getDepth(stringIndex: &stringIndex, depth: depth + 1), maxDepth)
            }
        }
        
        return maxDepth
    }
    
    return matrix
}
