//
//  7785.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 2/22/24.
//

import Foundation

func Q_7785_OLD() {
    var io = IO(), set = Set<String>()
    
    for _ in 0..<io.readInt() {
        let (name, status) = (io.readString(), io.readString())
        if status == "enter" {
            set.insert(name)
        } else {
            set.remove(name)
        }
    }
    
    var result = ""
    set.sorted(by: >).forEach { result.write("\($0)\n") }
    print(result)
    
    // 빠른 입력
    class IO{var b:Data,i=0;init(fh:FileHandle=FileHandle.standardInput){b=try!fh.readToEnd()!}
    @inline(__always)func read()->UInt8{defer{i+=1};guard i<b.count else{return 0};return b[i]}
    @inline(__always)func readInt()->Int{var s=0,n=read(),p=true;while n==10||n==32{n=read()}
    if n==45{p.toggle();n=read()};while n>=48,n<=57{s=s*10+Int(n-48);n=read()};return s*(p ?1:-1)}
    @inline(__always)func readString()->String{var t="",n=read();while n==10||n==32 {n=read()}
    while n != 10,n != 32,n != 0{t+=String(bytes:[n],encoding:.ascii)!;n=read()};return t}}
}

func Q_7785() {
    var set = Set<String>(), result = ""
    
    for _ in 0..<Int(readLine()!)! {
        let r = readLine()!.split(separator: " "), (name, status) = (String(r[0]), r[1])
        if status == "enter" {
            set.insert(name)
        } else {
            set.remove(name)
        }
    }
    
    set.sorted(by: >).forEach { result.write("\($0)\n") }
    print(result)
}

