//
//  16113.swift
//  String
//
//  Created by sujeong on 3/13/25.
//  Copyright © 2025 임수정. All rights reserved.
//

import Foundation

func solution() {
    
    var result:String = ""
    
    // preset
    let dict:[[[Int]]:String] = [
        [[],[],[],[],[]]:"",
        [[1,1,1],
        [1,0,1],
        [1,0,1],
        [1,0,1],
         [1,1,1]]:"0",
        [[1],
        [1],
        [1],
        [1],
         [1]]:"1",
        [[1,1,1],
        [0,0,1],
        [1,1,1],
        [1,0,0],
         [1,1,1]]:"2",
        [[1,1,1],
        [0,0,1],
        [1,1,1],
        [0,0,1],
         [1,1,1]]:"3",
        [[1,0,1],
        [1,0,1],
        [1,1,1],
        [0,0,1],
         [0,0,1]]:"4",
       [[1,1,1],
        [1,0,0],
        [1,1,1],
        [0,0,1],
        [1,1,1]]:"5",
        [[1,1,1],
         [1,0,0],
         [1,1,1],
         [1,0,1],
         [1,1,1]]:"6",
        [[1,1,1],
         [0,0,1],
         [0,0,1],
         [0,0,1],
         [0,0,1]]:"7",
        [[1,1,1],
         [1,0,1],
         [1,1,1],
         [1,0,1],
         [1,1,1]]:"8",
        [[1,1,1],
         [1,0,1],
         [1,1,1],
         [0,0,1],
         [1,1,1]]:"9",
    ]
    
    // input
    let len:Int = Int(readLine()!)!
    let signal:[Character] = Array(readLine()!)
    let clen:Int = len/5
    var sig:[[Int]] = [[Int]](repeating: [], count: 5)
    for (i,s) in signal.enumerated() {
        sig[i/clen].append( s == "#" ? 1 : 0 )
    }
        
    var now:[[Int]] = [[Int]](repeating: [], count: 5)
    var col:[Int] = []
    
    for c in 0..<sig[0].count {
        for r in 0..<5 {
            col.append(sig[r][c])
        }
        
        if col.filter({ $0 == 1 }).isEmpty {
            // 빈 열
            result += dict[now]!
            col = []
            now = [[Int]](repeating: [], count: 5)
        } else {
            for j in 0..<5 {
                now[j].append(col[j])
            }
            col = []
        }
        
    }
    
    if !now.isEmpty {
        result += dict[now]!
    }
    
    print(result)
    
}

solution()
