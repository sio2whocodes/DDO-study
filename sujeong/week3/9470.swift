//
//  main.swift
//  Graph
//
//  Created by sujeong on 3/5/25.
//

import Foundation

func solution() {
    
    // input
    let T:Int = Int(readLine()!)!
    for _ in 1...T {
        let KMP:[Int] = readLine()!.split(separator: " ").map { Int($0)! }
        let K = KMP[0]
        let M = KMP[1]
        let P = KMP[2]
        
        var adj:[[Int]] = [[Int]](repeating: [], count: M+1)
        var seq:[Int] = [Int](repeating: 0, count: M+1)
        
        for _ in 0..<P {
            let edge:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
            adj[edge[1]] += [edge[0]]
        }
        
        // 재귀
        func getSeqOf(_ m:Int) -> Int {
            if seq[m] != 0 {
                return seq[m]
            }
            if adj[m].count == 0 {
                seq[m] = 1
                return 1
            }
            // 순서 구해야할 때
            let chdr_seq:[Int] = adj[m].map { getSeqOf($0) }
            let maxSeq:Int = chdr_seq.max()!
//            let cnt = chdr_seq.count { $0 == maxSeq }
            let cnt = chdr_seq.filter{ $0 == maxSeq }.count
            if cnt > 1 {
                seq[m] = maxSeq + 1
            } else {
                seq[m] = maxSeq
            }
            return seq[m]
        }
        print(K, getSeqOf(M))
        // case 하나 끝 //
    }
    
}

solution()

/*
 
 1
 1 7 8
 1 3
 2 3
 6 4
 3 4
 3 5
 6 7
 5 7
 4 7
 
 */
