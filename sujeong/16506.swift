//
//  main.swift
//  Simulation
//
//  Created by sujeong on 2/27/25.
//

import Foundation

func solution() -> [String] {
    
    let map:[String:String] = [
        "ADD":"00000",
        "ADDC":"00001",
        "SUB":"00010",
        "SUBC":"00011",
        "MOV":"00100",
        "MOVC":"00101",
        "AND":"00110",
        "ANDC":"00111",
        "OR":"01000",
        "ORC":"01001",
        "NOT":"01010",
        "MULT":"01100",
        "MULTC":"01101",
        "LSFTL":"01110",
        "LSFTLC":"01111",
        "LSFTR":"10000",
        "LSFTRC":"10001",
        "ASFTR":"10010",
        "ASFTRC":"10011",
        "RL":"10100",
        "RLC":"10101",
        "RR":"10110",
        "RRC":"10111",
    ]
    
    let n:Int = Int(readLine()!)!
    var results:[String] = []
    var inputs:[[String]] = []
    for _ in 0..<n {
        let input:[String] = (readLine()?.split(separator: " ").map{String($0)})!
        inputs.append(input)
    }
    
    for input in inputs {
        var result = ""
        var isC = false
        
        let opcode = map[input[0]]!
        if Array(input[0]).last == "C" {
            isC = true
        }
        result += opcode+"0"
        
        let rD:Int = Int(input[1])!
        let srD = String(rD, radix: 2)
        result += String(repeating: "0", count: 3-srD.count) + srD
        
        let rA = Int(input[2])!
        if input[0] == "MOV" || input[0] == "NOT" || input[0] == "MOVC" {
            result += "000"
        } else {
            let srA = String(rA, radix: 2)
            result += String(repeating: "0", count: 3-srA.count) + srA
        }
        
        let rBC = Int(input[3])!
        if isC {
            let srBC = String(rBC, radix: 2)
            result += String(repeating: "0", count: 4-srBC.count) + srBC
        } else {
            let srBC = String(rBC, radix: 2)
            result += String(repeating: "0", count: 3-srBC.count) + srBC + "0"
        }
        results.append(result)
    }
    return results
}

var s = solution()
for a in s {
    print(a)
}
