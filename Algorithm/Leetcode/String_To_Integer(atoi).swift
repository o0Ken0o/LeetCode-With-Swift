//
//  String_To_Integer(atoi).swift
//  Algorithm
//
//  Created by Kam Hei Siu on 1/4/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

class MyAtoi {
    func myAtoi(_ str: String) -> Int {
        var intArr = [Int]()
        var sign = 1
        
        let noSpaceStr = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if noSpaceStr.count == 0 {
            return 0
        }
        
        if noSpaceStr.count == 1 {
            return Int(noSpaceStr) ?? 0
        }
        
        if let first = noSpaceStr.first {
            if first == "-" {
                sign = -1
            }
        }
        
        for (i, char) in noSpaceStr.enumerated() {
            if i == 0, (char  == "-" || char == "+") {
                continue
            }
            
            if let myInt = convert(char: char) {
                intArr.append(myInt)
            } else {
                break
            }
        }
        
        var sum = 0
        let largestIntStr = "\(Int32.max)"
        
        if intArr.count > largestIntStr.count {
            return sign == 1 ? Int(Int32.max) : Int(Int32.min)
        } else if intArr.count == largestIntStr.count {
            for (myIntStr, largestIntChar) in zip(intArr, largestIntStr) {
                if myIntStr == Int(String(largestIntChar))! {
                    continue
                } else if myIntStr < Int(String(largestIntChar))! {
                    break
                } else {
                    return sign == 1 ? Int(Int32.max) : Int(Int32.min)
                }
            }
        }
        
        
        
        for (i, myInt) in intArr.enumerated() {
            sum += myInt * (10**(intArr.count - 1 - i))
        }
        
        return sum * sign
    }
    
    func verify() {
        printVerificationResult(case: "2147483647", expected: 2147483647)
        printVerificationResult(case: "2147483648", expected: 2147483647)
        printVerificationResult(case: "-2147483649", expected: -2147483648)
    }
    
    private func printVerificationResult(case str: String, expected int: Int) {
        let result = myAtoi(str) == int ? "passed" : "NOT passed"
        print("case: \(str), expected:\(int), \(result)")
    }
}
