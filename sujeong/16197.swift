//
//  16197.swift
//  dfsNbfs
//
//  Created by sujeong on 2/26/25.
//

import Foundation

func solution() -> Int {
    
    let NM:[Int] = (readLine()?.split(separator: " ").map{Int($0)!})!
    let N = NM[0]
    let M = NM[1]
    
    var map:[[Character]] = []
    for _ in 0..<N {
        let line:[Character] = Array(readLine()!)
        map.append(line)
    }
    
    var coins:[(Int, Int)] = []
    for r in 0..<N {
        for c in 0..<M {
            if map[r][c] == "o" {
                coins.append((r,c))
            }
        }
    }
    
    var result = 11
    let dr = [-1,1,0,0]
    let dc = [0,0,-1,1]
    
    func dfs(_ a:(Int, Int), _ b:(Int, Int), _ cnt:Int) {
        // 떨어진지 체크
        let aisfallen = !(a.0 >= 0 && a.0 < N && a.1 >= 0 && a.1 < M)
        let bisfallen = !(b.0 >= 0 && b.0 < N && b.1 >= 0 && b.1 < M)
        if (aisfallen && !bisfallen) || (!aisfallen && bisfallen) {
            // 둘중 하나만 떨어짐
            result = min(result, cnt)
        } else if !aisfallen && !bisfallen {
            // 둘 다 안떨어짐
            if cnt >= 10 {
                return
            }
            for i in 0..<4 {
                var nar = a.0 + dr[i]
                var nac = a.1 + dc[i]
                var nbr = b.0 + dr[i]
                var nbc = b.1 + dc[i]
                
                if nar >= 0 && nar < N && nac >= 0 && nac < M {
                    if map[nar][nac] == "#" {
                        nar = a.0
                        nac = a.1
                    }
                }
                if nbr >= 0 && nbr < N && nbc >= 0 && nbc < M {
                    if map[nbr][nbc] == "#" {
                        nbr = b.0
                        nbc = b.1
                    }
                }
                dfs((nar, nac), (nbr, nbc), cnt+1)
            }
        } else {
            // 둘 다 떨어짐
            // 종료
        }
    }
    
    dfs(coins[0], coins[1], 0)
    
    if result == 11 {
        result = -1
    }
    
    
    return result
}

print(solution())
