//
//  main.swift
//  Simulation
//
//  Created by sujeong on 3/27/25.
//

import Foundation

func solution() -> [Int] {
    // general
    let dx = [0,1,0,-1]
    let dy = [1,0,-1,0]
    
    // input
    let T:Int = Int(readLine()!)!
    var results:[Int] = []
    
    for _ in 0..<T {
        // case start
        let inst:[Character] = Array(String(readLine()!))
        
        var minx = 0
        var miny = 0
        var maxx = 0
        var maxy = 0
        
        var cx = 0
        var cy = 0
        var cd = 0 // 현재 방향
        
        for c in inst {
            switch c {
            case "F":
                cx = cx+dx[cd]
                cy = cy+dy[cd]
            case "B":
                cx = cx-dx[cd]
                cy = cy-dy[cd]
            case "R":
                cd = (cd+1)%4
            case "L":
                cd = (cd-1+4)%4
            default:
                continue
            }
            
            minx = min(minx, cx)
            miny = min(miny, cy)
            maxx = max(maxx, cx)
            maxy = max(maxy, cy)
        }
        
        let area = (maxx-minx)*(maxy-miny)
        results.append(area)
        // case end
    }
    
    return results
}

solution().forEach { print($0) }
