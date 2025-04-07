//
//  main.swift
//  Simulation
//
//  Created by sujeong on 2/20/25.
//

import Foundation

func solution() {
    
    // input
    let strings:[String] = readLine()!.split(separator:" ").map { String($0) }
    let defaultType:String = strings[0]
    let variables:[String] = strings[1...].map{String($0)}
        
    for vari in variables {
        var type = defaultType
        let name = vari.filter{ $0.isLetter }
        let addtype = vari.filter { !$0.isLetter }
        for c in addtype.reversed() {
            switch c {
            case "&":
                type += "&"
            case "*":
                type += "*"
            case "[":
                type += "]"
            case "]":
                type += "["
            case ",",";":
                continue
            default:
                continue
            }
        }
        
        print(type, name+";")
    }
    
}

solution()

