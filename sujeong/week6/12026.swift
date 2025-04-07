//
//  main.swift
//  DP
//
//  Created by sujeong on 3/25/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() -> Int {
    let N:Int = Int(readLine()!)!
    let road:[Character] = Array(readLine()!)
    let next:[Character:Character] = ["B":"O", "O":"J", "J":"B"]
    
    var dp:[Int] = [Int](repeating: -1, count: N)
    dp[0] = 0
    for i in 0..<N {
        if dp[i] >= 0 {
            // i번째 보도블럭이 도달가능한 곳이면 -> 다음 도달 가능한 곳 찾기
            for j in i+1..<N {
                if road[j] == next[road[i]] {
                    if dp[j] == -1 {
                        dp[j] = dp[i]+(j-i)*(j-i)
                    } else {
                        dp[j] = min(dp[i]+(j-i)*(j-i), dp[j])
                    }
                }
            }
        }
    }
    
    return dp[N-1]
}

print(solution())
