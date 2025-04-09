//
//  2933.swift
//  Simulation
//
//  Created by sujeong on 4/9/25.
//

import Foundation

func solution() {
    let RC:[Int] = readLine()?.split(separator: " ").map { Int($0) } as! [Int]
    let (R, C):(Int, Int) = (RC[0], RC[1])
    
    var map:[[Character]] = []
    
    for _ in 0..<R {
        map.append(Array(readLine()!))
    }
    
    let _:Int = Int(readLine()!)!
    let heights:[Int] = readLine()?.split(separator: " ").map { Int($0) } as! [Int]
    
    let dr = [0,0,1,-1]
    let dc = [-1,1,0,0]

    for (i,height) in heights.enumerated() {
        // 막대 던지기
        let realH = R-height
        let left2Right = (i % 2 == 0) // 짝면 왼->오
        let seq = left2Right ? Array(0..<C) : Array(0..<C).reversed()
        // 미네랄 파괴
        for c in seq {
            if map[realH][c] == "x" {
                map[realH][c] = "."
                break
            }
        }
        // 클러스터 하강
        // 떠있는 클러스터 모으기 bfs
        var q:[(Int,Int)] = []
        var visit:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
        // 바닥에 있는 미네랄 모두 넣어줌
        for c in 0..<C {
            if map[R-1][c] == "x" {
                visit[R-1][c] = true
                q.append((R-1,c))
            }
        }
        //bfs
        while !q.isEmpty {
            let here:(Int,Int) = q.popLast()!
            for i in 0..<4 {
                let (nr,nc) = (here.0 + dr[i], here.1 + dc[i])
                if nr >= 0, nr < R, nc >= 0, nc < C, map[nr][nc] == "x", !visit[nr][nc] {
                    visit[nr][nc] = true
                    q.append((nr,nc))
                }
            }
        }
        
        var floatingM:[(Int,Int)] = []
        for r in 0..<R {
            for c in 0..<C {
                if !visit[r][c], map[r][c] == "x" {
                    floatingM.append((r,c))
                }
            }
        }
        
        visit = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
        for m in floatingM {
            visit[m.0][m.1] = true
        }
        
        floatingM.sort { a, b in
            if a.0 == b.0 {
                return a.1 < b.1
            } else {
                return a.0 < b.0
            }
        }
        
        // 내려갈 거리
        var len = 100
        for m in floatingM {
            if map[m.0 + 1][m.1] == "." {
                var tmp = 1
                while m.0 + tmp < R {
                    if map[m.0+tmp][m.1] == "x" {
                        break
                    }
                    tmp += 1
                }
                if m.0+tmp == R || !visit[m.0+tmp][m.1] { // 같은 클러스터인 경우 count하지 않음
                    len = min(len, tmp)
                }
            }
        }
        len -= 1
        
        // swap
        while !floatingM.isEmpty {
            let now:(Int,Int) = floatingM.popLast()!
            let tmp = map[now.0+len][now.1]
            map[now.0+len][now.1] = map[now.0][now.1]
            map[now.0][now.1] = tmp
        }
    }
    
    map.forEach { row in
        print(String(row))
    }
}

solution()
