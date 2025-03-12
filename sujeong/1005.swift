//
//  1005.swift
//  Graph
//
//  Created by sujeong on 3/12/25.
//

import Foundation

func solution() {
    var result:[Int] = []
    
    // input
    let T:Int = Int(readLine()!)!
    for _ in 0..<T {
        // case start
        
        let NK:[Int] = (readLine()?.split(separator:" ").map { Int($0)! })!
        let N = NK[0]
        let K = NK[1]
        
        var D:[Int] = [0]
        D += (readLine()?.split(separator:" ").map { Int($0)! })!
        
        var adj:[[Int]] = [[Int]](repeating: [], count: N+1)
        var cnt:[Int] = [Int](repeating: 0, count: N+1)
        
        for _ in 0..<K {
            let xy:[Int] = (readLine()?.split(separator:" ").map { Int($0)! })!
            adj[xy[0]].append(xy[1])
            cnt[xy[1]] += 1
        }
        
        let W:Int = Int(readLine()!)!
        var time:[Int] = D
        
        // 위상정렬 큐 초기화
        var q:[Int] = []
        for i in 1...N {
            if cnt[i] == 0 {
                q.append(i)
            }
        }
        
        
        while !q.isEmpty {
            let now = q.removeFirst()
            for bd in adj[now] {
                cnt[bd] -= 1
                time[bd] = max(time[bd], time[now]+D[bd])
                if cnt[bd] == 0 {
                    q.append(bd)
                }
            }
        }
        
        result.append(time[W])
        // case end
    }
    result.forEach{ print($0) }
}

solution()
