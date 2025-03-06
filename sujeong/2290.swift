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
    numChar[0]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[0]!.append(emptyhline)
    numChar[0]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[0]!.append(hline)

    numChar[1] = [ emptyhline ]
    numChar[1]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[1]!.append(emptyhline)
    numChar[1]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[1]!.append(emptyhline)
    
    numChar[2] = [ hline ]
    numChar[2]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[2]!.append(hline)
    numChar[2]? += Array(repeating: leftline.map{$0}, count: s)
    numChar[2]!.append(hline)

    numChar[3] = [ hline ]
    numChar[3]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[3]!.append(hline)
    numChar[3]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[3]!.append(hline)
    

    numChar[4] = [ emptyhline ]
    numChar[4]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[4]!.append(hline)
    numChar[4]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[4]!.append(emptyhline)
    
    numChar[5] = [ hline ]
    numChar[5]? += Array(repeating: leftline.map{$0}, count: s)
    numChar[5]!.append(hline)
    numChar[5]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[5]!.append(hline)
    
    numChar[6] = [ hline ]
    numChar[6]? += Array(repeating: leftline.map{$0}, count: s)
    numChar[6]!.append(hline)
    numChar[6]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[6]!.append(hline)
    
    numChar[7] = [ hline ]
    numChar[7]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[7]!.append(emptyhline)
    numChar[7]? += Array(repeating: rightline.map{$0}, count: s)
    numChar[7]!.append(emptyhline)
    
    numChar[8] = [ hline ]
    numChar[8]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[8]!.append(hline)
    numChar[8]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[8]!.append(hline)

    numChar[9] = [ hline ]
    numChar[9]? += Array(repeating: bothline.map{$0}, count: s)
    numChar[9]!.append(hline)
    numChar[9]? += Array(repeating: rightline.map{$0}, count: s)
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
