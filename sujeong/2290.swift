//
//  2290.swift
//  implement
//
//  Created by sujeong on 3/6/25.
//

import Foundation

func makeNumChar(_ s:Int) -> [Int:[[Character]]] {
    let hline:[Character] = " "+[Character](repeating: "-", count: s)+" "
    let emptyhline:[Character] = [Character](repeating: " ", count: s+2)
    let leftline:[Character] = "|"+[Character](repeating: " ", count: s+1)
    let rightline:[Character] = [Character](repeating: " ", count: s+1) + "|"
    let bothline:[Character] = "|"+[Character](repeating: " ", count: s) + "|"
    
    var numChar:[Int:[[Character]]] = [:]
    
    numChar[0] = [ hline ]
    for _ in 0..<s {
        numChar[0]!.append(bothline)
    }
    numChar[0]!.append(emptyhline)
    for _ in 0..<s {
        numChar[0]!.append(bothline)
    }
    numChar[0]!.append(hline)

    numChar[1] = [ emptyhline ]
    for _ in 0..<s {
        numChar[1]!.append(rightline)
    }
    numChar[1]!.append(emptyhline)
    for _ in 0..<s {
        numChar[1]!.append(rightline)
    }
    numChar[1]!.append(emptyhline)
    
    numChar[2] = [ hline ]
    for _ in 0..<s {
        numChar[2]!.append(rightline)
    }
    numChar[2]!.append(hline)
    for _ in 0..<s {
        numChar[2]!.append(leftline)
    }
    numChar[2]!.append(hline)

    numChar[3] = [ hline ]
    for _ in 0..<s {
        numChar[3]!.append(rightline)
    }
    numChar[3]!.append(hline)
    for _ in 0..<s {
        numChar[3]!.append(rightline)
    }
    numChar[3]!.append(hline)
    

    numChar[4] = [ emptyhline ]
    for _ in 0..<s {
        numChar[4]!.append(bothline)
    }
    numChar[4]!.append(hline)
    for _ in 0..<s {
        numChar[4]!.append(rightline)
    }
    numChar[4]!.append(emptyhline)
    
    numChar[5] = [ hline ]
    for _ in 0..<s {
        numChar[5]!.append(leftline)
    }
    numChar[5]!.append(hline)
    for _ in 0..<s {
        numChar[5]!.append(rightline)
    }
    numChar[5]!.append(hline)
    
    numChar[6] = [ hline ]
    for _ in 0..<s {
        numChar[6]!.append(leftline)
    }
    numChar[6]!.append(hline)
    for _ in 0..<s {
        numChar[6]!.append(bothline)
    }
    numChar[6]!.append(hline)
    
    numChar[7] = [ hline ]
    for _ in 0..<s {
        numChar[7]!.append(rightline)
    }
    numChar[7]!.append(emptyhline)
    for _ in 0..<s {
        numChar[7]!.append(rightline)
    }
    numChar[7]!.append(emptyhline)
    
    numChar[8] = [ hline ]
    for _ in 0..<s {
        numChar[8]!.append(bothline)
    }
    numChar[8]!.append(hline)
    for _ in 0..<s {
        numChar[8]!.append(bothline)
    }
    numChar[8]!.append(hline)

    numChar[9] = [ hline ]
    for _ in 0..<s {
        numChar[9]!.append(bothline)
    }
    numChar[9]!.append(hline)
    for _ in 0..<s {
        numChar[9]!.append(rightline)
    }
    numChar[9]!.append(hline)
    
    return numChar
}

func solution() {
    // input
    let SN:[Int] = (readLine()?.split(separator: " ").map { Int($0)! })!
    let s = SN[0]
    let n = SN[1]
    let numch = makeNumChar(s)
    let narr:[Int] = String(n).map { Int(String($0))! }
    
    var result:String = ""
    
    for r in 0..<2*s+3 {
        for n in narr {
            result += (String((numch[n]?[r] as? [Character])!)+" ")
        }
        result += "\n"
    }
    
    print(result)
    
}

solution()
