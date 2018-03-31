//
//  ZigZag_Conversion.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 31/3/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    // need to handle the case if s.count < numRows
    if s.count < numRows || numRows == 1 || numRows == 0 {
        return s
    }
    
    var twoDArr = Array(repeatElement([Character](), count: numRows))
    var row = 0
    var isTop2Bottom = true
    for char in s {
        if row == numRows {
            row = numRows - 2
            isTop2Bottom = false
        }
        
        if row == -1 {
            row = 1
            isTop2Bottom = true
        }
        
        if isTop2Bottom {
            twoDArr[row].append(char)
            row += 1
        } else {
            twoDArr[row].append(char)
            row -= 1
        }
    }
    
    return twoDArr.flatMap{$0}.reduce("", +)
}

func verifyZigZagConvertion() {
    verifyZigZagConvertion("PAYPALISHIRING", 3, "PAHNAPLSIIGYIR")
    verifyZigZagConvertion("ABC", 2, "ACB")
    verifyZigZagConvertion("ABCD", 2, "ACBD")
}

private func verifyZigZagConvertion(_ s: String, _ rowsNum: Int, _ expectedStr: String) {
    let result = convert(s, rowsNum) == expectedStr ? "passed" : "NOT passed"
    print("test string: \(s), result: \(result)")
}


