//
//  main.swift
//  DP
//
//  Created by sujeong on 4/8/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() -> Int {
    
    // input
    let n: Int = Int(readLine()!)!
    let num: [Int] = readLine()?.split(separator: " ").map { Int($0)! } as! [Int]
    
    // data
    var result: Int = 0
    var dp: [[Int:Int]] = [[Int:Int]](repeating: [:], count: n) // i번째 연산자까지 계산했을 때 나올 수 있는 값:경우의 수 들의 집합
    
    // process
    dp[0][num[0]] = 1
    
    for i in 1..<n-1 {
        for pre in dp[i-1] {
            // 더할 때
            let newAdd = pre.key + num[i]
            if newAdd >= 0 && newAdd <= 20 {
                dp[i][newAdd, default: 0] += pre.value
            }
            // 뺄 때
            let newRed = pre.key - num[i]
            if newRed >= 0 && newRed <= 20 {
                dp[i][newRed, default: 0] += pre.value
            }
        }
    }
    
    result = dp[n-2][num[n-1], default: 0]
    
    // output
    return result
}

print(solution())
