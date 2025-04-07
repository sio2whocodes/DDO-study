//
//  main.swift
//  DP
//
//  Created by sujeong on 3/4/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    // process
    var cases:[Int] = [Int](repeating: 1, count: 100001)
    
    for i in 2...10000 {
        cases[i] += cases[i-2]
    }
    
    for i in 3...10000 {
        cases[i] += cases[i-3]
    }
    
    // in&output
    for _ in 0..<N {
        let n = Int(readLine()!)!
        print(cases[n])
    }
    
}

solution()
