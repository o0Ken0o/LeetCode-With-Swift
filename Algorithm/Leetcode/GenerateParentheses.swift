//
//  GenerateParentheses.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 2/4/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

class GenerateParentheses {
    
    // tackle this problem with dynamic programming
    
    func generateParenthesis(_ n: Int) -> [String] {
        
        var arr2d = [[String]]()
        arr2d.append(["()"])
        
        for i in 1..<n {
            let lastArr = arr2d[i-1]
            
            var tempArr = [String]()
            for parentheses in lastArr {
                tempArr.append("(\(parentheses))")
                tempArr.append("()\(parentheses)")
                tempArr.append("\(parentheses)()")
            }
            
            let redundantElement = Array(repeatElement("()", count: i+1)).reduce("", +)
            if let index = tempArr.index(of: redundantElement) {
                tempArr.remove(at: index)
            }
            
            arr2d.append(tempArr)
        }
        
        return arr2d.last!
    }
}
