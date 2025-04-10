//
//  6987.swift
//  dfsNbfs
//
//  Created by sujeong on 3/20/25.
//

import Foundation

func solution() {
    
    var ab:[(Int, Int)] = []
    for a in 1...5 {
        for b in a+1...6 {
            ab.append((a,b))
        }
    }
    
    var result = 0
    var answers:[Int] = []

    func dfs(_ i:Int, _ scores:[[Int]]) {
        if i == 15 {
            // 종료
            if scores.allSatisfy({ row in row.allSatisfy { $0 == 0 }}) {
                result = 1
            } else {
                result = 0
            }
            return
        }
        
        var _scores = scores
        let a = ab[i].0
        let b = ab[i].1
        
        if scores[a][0] > 0 && scores[b][2] > 0 {
            // a > b
            _scores[a][0] -= 1
            _scores[b][2] -= 1
            dfs(i+1, _scores)
            _scores[a][0] += 1
            _scores[b][2] += 1
        }
        if scores[a][1] > 0 && scores[b][1] > 0 {
            // a = b
            _scores[a][1] -= 1
            _scores[b][1] -= 1
            dfs(i+1, _scores)
            _scores[a][1] += 1
            _scores[b][1] += 1
        }
        if scores[a][2] > 0 && scores[b][0] > 0 {
            // a < b
            _scores[a][2] -= 1
            _scores[b][0] -= 1
            dfs(i+1, _scores)
            _scores[a][2] += 1
            _scores[b][0] += 1
        }
        
        
    }
    
    
    for i in 0..<4 {
        result = 0
        var scores:[[Int]] = [[Int]](repeating: [], count: 7)
        
        let arr:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
        for i in 0..<arr.count {
            scores[i/3+1].append(arr[i])
        }
        
        dfs(0, scores)
        answers.append(result)
    }
    
    print(answers.reduce("") { pre, new in
        return pre+"\(new) "
    })
    return
}

solution()
