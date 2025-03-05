//
//  main.swift
//  dfsNbfs
//
//  Created by sujeong on 3/3/25.
//

import Foundation

func solution() {
    var map:[[Character]] = []
    let NM:[Int] = (readLine()?.split(separator:" ").map { Int($0)! })!
    let N:Int = NM[0]
    let M:Int = NM[1]
    
    for _ in 0..<N {
        map.append(Array(readLine()!))
    }
    
    var dist:[[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: M), count: N)
    var q = [(Int,Int)]()
    q.append((0,0))
    dist[0][0] = 1
    
    let dr = [-1,1,0,0]
    let dc = [0,0,-1,1]
    
    while !q.isEmpty {
        let now = q.removeFirst()
        for i in 0..<4 {
            let nr = now.0+dr[i]
            let nc = now.1+dc[i]
            if nr >= 0 && nr < N && nc >= 0 && nc < M && dist[nr][nc] == 0 && map[nr][nc] == "1" {
                q.append((nr, nc))
                dist[nr][nc] = dist[now.0][now.1]+1
            }
        }
        
    }
    
    print(dist[N-1][M-1])
    
}

solution()
