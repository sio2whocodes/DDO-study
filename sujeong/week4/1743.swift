//
//  1743.swift
//  dfsNbfs
//
//  Created by sujeong on 3/10/25.
//

import Foundation

func solution() -> Int {
    
    let dr = [-1,1,0,0]
    let dc = [0,0,1,-1]
    
    var result = 0
    // R C K
    let input = (readLine()?.split(separator: " ").map { Int($0)! })!
    let N = input[0]
    let M = input[1]
    let K = input[2]
    
    var map:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    for _ in 0..<K {
        let food = readLine()!.split(separator:" ").map { Int(String($0))! }
        map[food[0]-1][food[1]-1] = true
    }
    
    var visit:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    var q:[(Int, Int)] = []
    
    for r in 0..<N {
        for c in 0..<M {
            if map[r][c] && !visit[r][c] {
                q.append((r,c))
                visit[r][c] = true
                var cnt = 0
                while !q.isEmpty {
                    let now:(Int, Int) = q.removeFirst()
                    cnt += 1
                    for i in 0..<4 {
                        let nr = now.0+dr[i]
                        let nc = now.1+dc[i]
                        if nr >= 0 && nr < N && nc >= 0 && nc < M && !visit[nr][nc] && map[nr][nc] {
                            q.append((nr,nc))
                            visit[nr][nc] = true
                        }
                    }
                }
                result = max(cnt, result)
            }
        }
    }
    return result
}

print(solution())
