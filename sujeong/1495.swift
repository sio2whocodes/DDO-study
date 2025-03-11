//
//  1495.swift
//  DP
//
//  Created by sujeong on 3/11/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() -> Int {
    //input
    let initi:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
    let N = initi[0]
    let S = initi[1]
    let M = initi[2]
    
    let v:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
    
    var dp:[Set<Int>] = [Set<Int>](repeating: [], count: N+1)

    //init
    dp[0].insert(S)
    
    //process
    for i in 0..<N {
        if dp[i].isEmpty {
            return -1
        }
        for cur in dp[i] {
            if cur-v[i] >= 0 {
                dp[i+1].insert(cur-v[i])
            }
            if cur+v[i] <= M {
                dp[i+1].insert(cur+v[i])
            }
        }
    }
    
    if dp[N].isEmpty {
        return -1
    } else {
        return dp[N].max()!
    }
}

print(solution())
