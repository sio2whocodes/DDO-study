//
//  main.swift
//  math3
//
//  Created by sujeong on 2/19/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func isPrime(_ num:Int) -> Bool {
    if num == 2 {
        return true
    } else if num < 2 {
        return false
    } else {
        for d in 2...max(2,Int(pow(Double(num), 0.5))) {
            if num % d == 0 {
                return false
            }
        }
    }
    return true
}

func solution() -> [Int] {
    var result:[Int] = []
    // input
    let N:Int = Int(readLine()!)!
    
    // process : 완벽한 수
    let start = Int(pow(10.0, Double(N-1)))
    let end = Int(pow(10.0, Double(N)))
    var num = start
    while num < end {
        // 접두어 검사
        var isPerfect = true
        for m in (0..<N).reversed() {
            let d = Int(pow(10.0, Double(m)))
            let prenum = num/d
            if !isPrime(prenum) {
                num += d
                isPerfect = false
                break
            }
        }
        if isPerfect {
            result.append(num)
            num += 1
        }
    }
    
    return result
    
}

solution().forEach { print($0) }
