//
//  2533.swift
//  Graph
//
//  Created by sujeong on 3/19/25.
//

import Foundation

func solution() -> Int {
    
    let N:Int = Int(readLine()!)!
    var adj:[[Int]] = [[Int]](repeating: [], count: N+1)
    
    for _ in 0..<N-1 {
        let uv:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
        adj[uv[0]].append(uv[1])
        adj[uv[1]].append(uv[0])
    }
    
    var dp:[[Int]] = [[Int]](repeating: [0,0], count: N+1)
    var visit:[Bool] = [Bool](repeating: false, count: N+1)
    
    func findMinAdap(_ n:Int) {
        visit[n] = true
        
        // 내가 어답터
        dp[n][0] = 1
        for c in adj[n] {
            if !visit[c] {
                findMinAdap(c)
                dp[n][0] += min(dp[c][0], dp[c][1])
                dp[n][1] += dp[c][0]
            }
        }
        
    }
    findMinAdap(1)
    return min(dp[1][0], dp[1][1])
}

print(solution())
