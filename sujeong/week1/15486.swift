//
//  15486.swift
//  DP
//
//  Created by sujeong on 2/18/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

//struct C {
//    var date:Int = 0
//    var cost:Int = 0
//}

func solution() -> Int {

    // input
    let N:Int = Int(readLine()!)!
    
    var T:[Int] = [0]
    var P:[Int] = [0]
    for _ in 1...N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        T.append(line[0])
        P.append(line[1])
    }

    // process
    
    var dp:[Int] = Array<Int>(repeating: 0, count: N+1)
    
    for i in 1...N {
        if dp[i] < dp[i-1] {
            dp[i] = dp[i-1]
        }
        var targetDay = i+T[i]-1
        if targetDay <= N && dp[targetDay] < dp[i-1]+P[i] {
            dp[targetDay] = dp[i-1]+P[i]
        }
    }
    
    return dp[N]
}

print(solution())

