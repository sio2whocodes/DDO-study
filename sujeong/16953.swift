//
//  main.swift
//  dfsNbfs
//
//  Created by sujeong on 3/24/25.
//

import Foundation

func solution() -> Int {
    
    let ab: [Int] = (readLine()?.split(separator:" ").map { Int($0)! })!
    let a:Int = ab[0]
    let b:Int = ab[1]
    
    var q:[(Int,Int)] = [(a,1)]
    
    while !q.isEmpty {
        let now = q.removeFirst()
        if now.0 == b {
            return now.1
        }
        else if now.0 < b {
            q.append((now.0*2, now.1+1))
            q.append((now.0*10+1, now.1+1))
        }
    }
    
    return -1
    
}

print(solution())


