//
//  10531.swift
//  AlgorithmTest-ReadLine
//
//  Created by 윤범태 on 5/16/25.
//
// 1: Golf Bot https://www.acmicpc.net/problem/10531
//

/*
 이 문제는 다음과 같은 상황을 가정하고 있습니다:

 ⸻

 상황 요약
   •  당신은 골프 로봇을 가지고 있는데, 이 로봇은 특정 거리들만 칠 수 있습니다.
   •  로봇이 칠 수 있는 거리들은 N개의 정수로 주어집니다.
 예: 1, 3, 5 같은 거리만 칠 수 있다면, 로봇은 딱 이 거리만큼만 공을 칠 수 있습니다.
   •  골프장의 각 홀까지의 거리가 M개 주어집니다.
   •  당신은 최대 두 번까지 공을 칠 수 있습니다. 두 번의 합으로 정확히 홀에 도달해야 합니다.
   •  예를 들어, 홀까지의 거리가 4이고, 로봇이 1, 3, 5 거리만 칠 수 있다면 1 + 3 = 4로 도달할 수 있습니다.
   •  로봇은 고의로 지나쳤다가 뒤로 치는 행동은 못합니다. (즉, 거리의 합이 정확히 홀까지의 거리여야 함)

 ⸻

 목표

 M개의 홀들 중에서, 최대 2번의 스트로크로 도달 가능한 홀의 개수를 세는 것이 문제의 목표입니다.

 ⸻

 입력 형식 (정리)

 N
 
 k1
 k2
 ...kN
 
 M
 
 d1
 d2
 ...dM

   •  ki: 로봇이 칠 수 있는 거리들
   •  dj: 각 홀까지의 거리

 ⸻

 출력 형식
   •  한 줄에 2번 이내의 스트로크로 도달 가능한 홀의 개수 출력

 ⸻

 예시 입력 1 해석

 입력:

3
1
3
5
6
2
4
5
7
8
9

   •  로봇이 칠 수 있는 거리: [1, 3, 5]
   •  홀의 거리: [2, 4, 5, 7, 8, 9]

 도달 가능한 홀 계산:
   •  2 = 1+1 ✔️
   •  4 = 1+3 ✔️
   •  5 = 5 ✔️
   •  7 = 3+4 ❌ (4는 없음)
   •  8 = 3+5 ✔️
   •  9 = 5+4 ❌ (4는 없음)

 => 정답: 4

 ⸻

 핵심 포인트
   •  **가능한 모든 1회 거리들 (k)**을 저장
   •  **가능한 모든 2회 거리들 (k1 + k2)**를 만들어 저장
   •  각 dj에 대해, dj가 1회 거리 또는 2회 거리 집합에 있는지 확인

 ⸻
 */

func Q_10531() {
  let N = Int(readLine()!)!
  let ks = (0..<N).map { _ in Int(readLine()!)! }
  let M = Int(readLine()!)!
  let ds = (0..<M).map { _ in Int(readLine()!)! }
  
  // 로봇이 한 번에 칠 수 있는 거리: 최대 200,000
  let maxDistance = 200_000
  var freq = [Int](repeating: 0, count: maxDistance + 1)

  for k in ks {
    freq[k] = 1
  }
  
  /*
   ✅ 사용 목적 (10531 문제에선?)
   로봇이 칠 수 있는 거리들이 [1, 3, 5]라고 하면
   - freq[k] = 1인 배열 freq를 두 번 곱하면,
   - 거리 k1 + k2로 도달 가능한 모든 거리들이 컨볼루션 결과로 나옵니다
   - 이때 conv[d] > 0이면, 거리 d는 2번에 도달 가능하다는 뜻
   */
  let conv = convolution(freq, freq)
  
  var reachable = [Bool](repeating: false, count: conv.count)
  for i in 0..<freq.count where freq[i] == 1 {
    reachable[i] = true // 1-shot
  }
  
  for i in 0..<freq.count where conv[i] > 0 {
    reachable[i] = true // 2-shot
  }
  
  var result = 0
  for d in ds where d < reachable.count && reachable[d] {
    result += 1
  }
  
  print(result)
}
