//
//  11058.swift
//  DP
//
//  Created by sujeong on 3/19/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() -> Int {    
    let N:Int = Int(readLine()!)!
    
    var dp:[Int] = [Int](repeating: 0, count: N+1)
    
    for i in 1...N {
        dp[i] = dp[i-1]+1
        if i >= 3 {
            for j in 3..<i {
                dp[i] = max(dp[i-j]*(j-1), dp[i])
            }
        }
        
    }
    
    return dp[N]
}

print(solution())
