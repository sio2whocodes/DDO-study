//
//  main.swift
//  dfsNbfs
//
//  Created by sujeong on 2/24/25.
//

import Foundation

func solution() {
    let NM:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
    let N = NM[0]
    let M = NM[1]
    
    var map:[[Character]] = []
    for _ in 0..<M {
        let row:String = readLine()!
        map.append(Array(row))
    }
        
    // process
    let dr = [-1,1,0,0]
    let dc = [0,0,-1,1]
    
    var WStrength = 0
    var BStrength = 0
    var visit:[[Bool]] = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
    for r in 0..<M {
        for c in 0..<N {
            if !visit[r][c] && map[r][c] == "W" {
                // 인접 그룹 인원 찾기
                var cnt = 0
                var q:[(Int, Int)] = []
                visit[r][c] = true
                q.append((r,c))
                while !q.isEmpty {
                    let now = q.removeFirst()
                    cnt += 1
                    for i in 0..<4 {
                        let nr = now.0 + dr[i]
                        let nc = now.1 + dc[i]
                        if nr >= 0 && nc >= 0 && nr < M && nc < N && map[nr][nc] == "W" && !visit[nr][nc] {
                            visit[nr][nc] = true
                            q.append((nr,nc))
                        }
                    }
                }
                WStrength += (cnt*cnt)
            }
            
            if !visit[r][c] && map[r][c] == "B" {
                // 인접 그룹 인원 찾기
                var cnt = 0
                var q:[(Int, Int)] = []
                visit[r][c] = true
                q.append((r,c))
                while !q.isEmpty {
                    let now = q.removeFirst()
                    cnt += 1
                    for i in 0..<4 {
                        let nr = now.0 + dr[i]
                        let nc = now.1 + dc[i]
                        if nr >= 0 && nc >= 0 && nr < M && nc < N && map[nr][nc] == "B" && !visit[nr][nc] {
                            visit[nr][nc] = true
                            q.append((nr,nc))
                        }
                    }
                }
                BStrength += (cnt*cnt)
            }
        }
    }
    print(WStrength, BStrength)
}

solution()

