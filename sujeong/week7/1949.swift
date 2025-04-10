//
//  1949.swift
//  Graph
//
//  Created by sujeong on 4/2/25.
//

import Foundation

func solution() -> Int {
    var answer:Int = 0
    
    let n:Int = Int(readLine()!)!
    let pop:[Int] = [0] + (readLine()?.split(separator: " ").map { Int($0)! })!
    
    
    var adj:[[Int]] = [[Int]](repeating: [], count: n+1)
    
    for _ in 0..<n-1 {
        let edge:[Int] = readLine()?.split(separator: " ").map { Int($0) } as! [Int]
        adj[edge[0]].append(edge[1])
        adj[edge[1]].append(edge[0])
    }
    
    var visit:[Bool] = [Bool](repeating: false, count: n+1)
    var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+1)
    // dp [0] -> 우수마을, [1] -> 우수마을 아님
    
    func getMax(_ start: Int) {
        visit[start] = true
        
        dp[start][0] = pop[start]
        
        for ch in adj[start] {
            // start가 우수 마을일 때 -> 인접 마을은 우수마을이면 X
            // start가 우수 마을 아니면 -> 인접 마을은 우수마을 일 수도, 아닐수도
            if !visit[ch] {
                getMax(ch)
                dp[start][0] += dp[ch][1]
                dp[start][1] += max(dp[ch][0], dp[ch][1])
            }
        }
    }
    getMax(1)
        
    answer = max(dp[1][0], dp[1][1])
    return answer
}

print(solution())
