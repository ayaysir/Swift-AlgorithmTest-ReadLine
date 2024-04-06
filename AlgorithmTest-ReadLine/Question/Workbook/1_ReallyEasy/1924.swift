//
//  1924.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 4/6/24.
//

// import Foundation

/// 2007년 https://www.acmicpc.net/problem/1924
func Q_1924() {
    let MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    let date = readLine()!.split(separator: " ").map { Int($0)! }
    let (month, day) = (date[0], date[1])
    
    let sumOfDay = (0..<month - 1).reduce(0) { $0 + MONTHS[$1] } + day
    print(dayOfWeek[sumOfDay % 7])
}

/*
 [풀이]
 (1) 해당 날짜까지의 총 일수를 계산 (예) 3월 14일 => 31 + 28 + 14 = 73
 (2) 를 % 7해서 나머지를 구한 뒤 dayOfWeek[인덱스] 로 표시 => 73 % 7 = 3 => 수요일 (배열은 일요일 = 0부터 시작)
 
 --------
 
 문제
 오늘은 2007년 1월 1일 월요일이다. 그렇다면 2007년 x월 y일은 무슨 요일일까? 이를 알아내는 프로그램을 작성하시오.

 입력
 첫째 줄에 빈 칸을 사이에 두고 x(1 ≤ x ≤ 12)와 y(1 ≤ y ≤ 31)이 주어진다. 참고로 2007년에는 1, 3, 5, 7, 8, 10, 12월은 31일까지, 4, 6, 9, 11월은 30일까지, 2월은 28일까지 있다.

 출력
 첫째 줄에 x월 y일이 무슨 요일인지에 따라 SUN, MON, TUE, WED, THU, FRI, SAT중 하나를 출력한다.
 
 분류
 - 수학
 - 구현

 예제 입력 1
 1 1
 예제 출력 1
 MON
 
 예제 입력 2
 3 14
 예제 출력 2
 WED
 
 예제 입력 3
 9 2
 예제 출력 3
 SUN
 
 예제 입력 4
 12 25
 예제 출력 4
 TUE
 */
