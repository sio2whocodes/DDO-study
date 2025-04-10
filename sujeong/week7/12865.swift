//
//  12865.swift
//  DP
//
//  Created by sujeong on 4/1/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

struct Item {
    let weight:Int
    let value:Int
}

func solution() -> Int {
    let nk:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
    let (n, k) = (nk[0], nk[1])
    
    var dp:[[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: k+1)
    var inven:[Item] = [Item(weight: 0, value: 0)]
    
    for _ in 0..<n {
        let wv:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
        inven.append(Item(weight: wv[0], value: wv[1]))
    }
    
    for wlimit in 1...k {
        for ci in 1...n {
            let itemWeight = inven[ci].weight
            let itemValue = inven[ci].value
            if wlimit >= itemWeight {
                let maxValueWithMe: Int = dp[wlimit-itemWeight][ci-1] + itemValue
                dp[wlimit][ci] = maxValueWithMe
            }
            let maxValueWithoutMe: Int = dp[wlimit][ci-1]
            dp[wlimit][ci] = max(dp[wlimit][ci], maxValueWithoutMe)
        }
    }
    
    return dp[k][n]
}


print(solution())
