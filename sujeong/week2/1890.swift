//
//  1809.swift
//  DP
//
//  Created by sujeong on 2/26/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() -> Int {

    // input
    let N:Int = Int(readLine()!)!
    
    var map:[[Int]] = []
    for _ in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }

    // process
    var dp:[[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N), count: N)
    dp[0][0] = 1
    
    for r in 0..<N {
        for c in 0..<N {
            if map[r][c] == 0 {
                continue
            }
            let nr = r+map[r][c]
            let nc = c+map[r][c]
            if nr < N {
                dp[nr][c] += dp[r][c]
            }
            if nc < N {
                dp[r][nc] += dp[r][c]
            }
        }
    }
    
    return dp[N-1][N-1]
}

print(solution())
