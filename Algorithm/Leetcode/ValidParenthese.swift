//
//  ValidParenthese.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 2/4/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

class ValidParenthese {
    
    // use stack to tackle this problem
    
    func isValid(_ s: String) -> Bool {
        var result = true
        
        var parentheseArray = [Character]()
        outerloop: for char in s {
            switch char {
                
            case "(", "{", "[":
                parentheseArray.append(char)
            
            case ")":
                if let last = parentheseArray.popLast(), last == "(" {
                    
                } else {
                    result = false
                    break outerloop
                }
            
            case "}":
                if let last = parentheseArray.popLast(), last == "{" {
                    
                } else {
                    result = false
                    break outerloop
                }
            
            case "]":
                if let last = parentheseArray.popLast(), last == "[" {
                    
                } else {
                    result = false
                    break outerloop
                }
            
            default:
                result = false
                break outerloop
            }
        }
        
        if !parentheseArray.isEmpty {
            result = false
        }
        
        return result
    }
    
    func verify() {
        printResult(caseStr: "()", expected: true)
        printResult(caseStr: "()()([)]", expected: false)
    }
    
    func printResult(caseStr: String, expected: Bool) {
        let result = isValid(caseStr) == expected ? "passed" : "NOT passed"
        print("\(caseStr), \(expected), \(result)")
    }
}
