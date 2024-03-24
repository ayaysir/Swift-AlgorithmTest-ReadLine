//
//  VoidFilesGeneratorByACMICPCStep.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 3/20/24.
//

import Foundation

/*
 [복붙 예제]
 단계    문제 번호    제목    정보    정답    제출    정답 비율
 1    11659    구간 합 구하기 4        45604    110607    38.928%
 누적 합 테크닉으로 구간 합을 빠르게 구하는 문제
 2    2559    수열        20453    55364    35.929%
 길이가 K인 모든 구간에 대해 구간 합을 구하는 문제
 3    16139    인간-컴퓨터 상호작용    서브태스크    6091    22302    28.901%
 구간 내에 있는 특정 문자의 개수를 구하는 문제
 4    10986    나머지 합        12996    46259    26.624%
 구간 합의 아이디어를 응용하여 특정 조건을 만족하는 구간의 개수를 구하는 문제
 5    11660    구간 합 구하기 5        31200    68223    44.106%
 2차원에서 구간 합을 구하는 문제
 6    25682    체스판 다시 칠하기 2        2812    7240    37.919%
 예전에 다시 칠했던 체스판을 이제 초대형으로 칠해 봅시다.
 
 [VoidFile 예제]
 
 //
 //  11659.swift
 //  AlgorithmTest-ReadLine
 //
 //  Created by 윤범태 on 3/20/24.
 //
 //  1: 구간 합 구하기 4 https://www.acmicpc.net/problem/11659
 //

 import Foundation
 
 /// 구간 합 구하기 4 https://www.acmicpc.net/problem/11659
 func Q_11659() {
     let n = Int(readLine()!)!
 }
 
 [사전 예제]
 1463: Q_1463,
 2156: Q_2156,
 11053: Q_11053,
 11054: Q_11054,
 2565: Q_2565,
 9251: Q_9251,
 12865: Q_12865,

 */

struct ACMICPCStepInfo {
    let id: UUID
    var questionIndex: Int
    var questionNumber: String
    var questionTitle: String
}

func VoidFilesGeneratorByACMICPCStep() {
    print("[\(#function)]")
    
    var readLines: [String] = []
    while let r = readLine(strippingNewline: true) {
        if r.isEmpty {
            break
        }
        
        readLines.append(r)
        // print("r:", r, r.isEmpty, r.count)
    }
    // print(readLines)
    
    let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
    let acmicpcDir = dir.appendingPathComponent("ACMICPC", isDirectory: true)
    
    let questions: [ACMICPCStepInfo] = readLines.compactMap {
        let words = $0.split(separator: "\t")
        // print(words)
        if !words.isEmpty, let questionIndex = Int(words[0]) {
            let questionNumber = String(words[1])
            let questionTitle = String(words[2])
            
            // "성공"이면 파일 안만들기
            if words.contains("성공") {
                print("[\(questionNumber)] \(questionTitle) 문제는 이미 풀었기 때문에 목록에서 제외됩니다.")
                return nil
            }
            
            return ACMICPCStepInfo(id: .init(), questionIndex: questionIndex, questionNumber: questionNumber, questionTitle: questionTitle)
        }
        
        return nil
    }
    
    let voidFile = """
    //
    //  [Q_NUMBER].swift
    //  AlgorithmTest-ReadLine
    //
    //  Created by 윤범태 on [DATE_NOW].
    //
    //  [Q_I]: [Q_TITLE] https://www.acmicpc.net/problem/[Q_NUMBER]
    //

    import Foundation

    /// [Q_TITLE] https://www.acmicpc.net/problem/[Q_NUMBER]
    func Q_[Q_NUMBER]() {
        let n = Int(readLine()!)!
    
        
    }
    """
    
    let formatter = DateFormatter()
    formatter.timeZone = .current
    formatter.dateFormat = "M/d/y"
    
    if !FileManager.default.fileExists(atPath: acmicpcDir.path) {
        do {
            try FileManager.default.createDirectory(atPath: acmicpcDir.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
        }
        print("새 디렉토리를 생성했습니다.")
    } else {
        // 먼저 디렉토리 비우기
        do {
            try FileManager.default.contentsOfDirectory(atPath: acmicpcDir.path).forEach { file in
                guard file != "복붙.txt" else {
                    return
                }
                
                try FileManager.default.removeItem(atPath: acmicpcDir.path + "/" + file)
            }
        } catch {
            print(error)
        }
        print("디렉토리의 기존 파일들을 지웠습니다.")
    }
    
    var dictionaryText: [String] = []
    questions.forEach { info in
        let filled = voidFile
            .replacingOccurrences(of: "[Q_NUMBER]", with: info.questionNumber)
            .replacingOccurrences(of: "[DATE_NOW]", with: formatter.string(from: .now))
            .replacingOccurrences(of: "[Q_I]", with: String(info.questionIndex))
            .replacingOccurrences(of: "[Q_TITLE]", with: info.questionTitle)
        
        dictionaryText.append("\(info.questionNumber): Q_\(info.questionNumber),")
        let fileURL = dir
            .appendingPathComponent("ACMICPC", isDirectory: true)
            .appendingPathComponent("\(info.questionNumber).swift")
        try! filled.write(to: fileURL, atomically: true, encoding: .utf8)
        print("\(info.questionNumber).swift 생성 완료")
    }
    
    print("""
    
    모든 파일 생성 완료 - 해당 파일들을 Swift 프로젝트로 불러오세요. (폴더 이름 및 순서는 수동으로...): 
     - 경로: \(acmicpcDir.absoluteString)
    
    아래 내용을 문제 사전에 붙여넣으세요.
    
    \(dictionaryText.joined(separator: "\n"))
    
    """)
    
    exit(0)
}

