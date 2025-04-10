//
//  1141.swift
//  String
//
//  Created by sujeong on 4/10/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() -> Int {
    
    // input
    let n:Int = Int(readLine()!)!
    var words:[String] = []
    for _ in 0..<n {
        words.append(readLine()!)
    }
    
    // process
    var result = n
    words.sort()
    
    for (i,word) in words.enumerated() {
        for j in i+1..<n {
            if words[j].starts(with: word) {
                result -= 1
                break
            }
        }
    }
    
    return result
    
}


print(solution())
