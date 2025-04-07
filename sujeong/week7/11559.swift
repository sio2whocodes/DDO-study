//
//  11559.swift
//  dfsNbfs
//
//  Created by sujeong on 4/3/25.
//

import Foundation

func solution() {
    
    var map:[[Character]] = []
    for _ in 0..<12 {
        map.append(Array(readLine()!))
    }
        
    let dr = [0,0,1,-1]
    let dc = [1,-1,0,0]
    
    func dfs(_ r:Int, _ c:Int, _ color:Character, _ list: inout [(Int,Int)], _ visit: inout [[Bool]]) {
        for i in 0..<4 {
            let (nr,nc):(Int,Int) = (r+dr[i], c+dc[i])
            if nr >= 0, nc >= 0, nr < 12, nc < 6, !visit[nr][nc], map[nr][nc] == color {
                visit[nr][nc] = true
                list.append((nr,nc))
                dfs(nr,nc,color,&list,&visit)
            }
        }
    }
    
    
    var cnt = 0
    while true {
        // 한 연쇄의 시작
        var isStarted = false
        for r in 0..<12 {
            for c in 0..<6 {
                if map[r][c] != "." {
                    // 같은 색 찾기 시작
                    var visit:[[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 6), count: 12)
                    visit[r][c] = true
                    var list:[(Int,Int)] = [(r,c)]
                    dfs(r,c,map[r][c],&list,&visit)
                    
                    // 터짐
                    if list.count >= 4 {
                        isStarted = true
                        for (tr,tc) in list {
                            map[tr][tc] = "."
                        }
                    }
                }
            }
        }
        // 한 연쇄의 끝
        if isStarted {
            cnt += 1
        } else {
            break
        }
        
       // 맵 정리
        for c in 0..<6 {
            for cr in (0..<12).reversed() {
                if map[cr][c] != "." {
                    continue
                }
                // "." 지점 찾음
                // 뿌요 찾아야함
                var pr = cr-1
                while pr >= 0, map[pr][c] == "." {
                    pr -= 1
                }

                if pr < 0 {
                    break // 뿌요 없음
                }

                // 뿌요랑 . swap
                map[cr][c] = map[pr][c]
                map[pr][c] = "."
            }
        }
    }
    print(cnt)
}


solution()
