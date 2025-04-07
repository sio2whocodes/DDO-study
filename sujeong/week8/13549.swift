//
//  13549.swift
//  dfsNbfs
//
//  Created by sujeong on 4/7/25.
//

import Foundation

func solution() {
    let input:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
    let n:Int = input[0]
    let k:Int = input[1]
    
    var dist:[Int] = [Int](repeating: Int.max, count: 100001)
    var cnt:[Int] = [Int](repeating: 0, count: 100001)
    
    dist[n] = 0
    cnt[n] = 1
    
    var q:[Int] = []
    q.append(n)
    
    while !q.isEmpty {
        let now = q.removeFirst()
        let nowdist = dist[now]
        
        if now-1 >= 0 && now-1 <= 100000 {
            if dist[now-1] > nowdist+1 {
                // 처음방문
                dist[now-1] = nowdist+1
                cnt[now-1] = cnt[now]
                q.append(now-1)
            } // 방문했는데 dist가 이미 내가 방문할 때보다 짧을때가 없다는 가정임 (bfs니까) - 원래 있던 dist값보다 작은 경우로 덮어써야 할 때가 오지 않음
        }
        if now+1 <= 100000 && now+1 >= 0 {
            if dist[now+1] > nowdist+1 {
                // 처음방문
                dist[now+1] = nowdist+1
                cnt[now+1] = cnt[now]
                q.append(now+1)
            }
        }
        if now*2 <= 100000 && now*2 >= 0 {
            if dist[now*2] > nowdist {
                // 처음방문
                dist[now*2] = nowdist
                cnt[now*2] = cnt[now]
                q.append(now*2)
            }
        }
    }
    
    print(dist[k])
}

solution()
