//
//  DynamicLineIntersection.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 22/4/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

class DynamicLineIntersection {
    func dynamicLineIntersection(n: Int) -> Void {
        var myDict = [Int: [Int: Int]]()
        for _ in 0..<n {
            let str = (readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!
            let subStrArray = str.split(separator: " ")
            
            let firstElement = subStrArray.first!
            if firstElement == "+" {
                
                let slope = Int(subStrArray[1])!
                let yIntercept = Int(subStrArray[2])!
                if myDict[slope] == nil {
                    myDict[slope] = [Int: Int]()
                }
                if myDict[slope]![yIntercept] == nil {
                    myDict[slope]![yIntercept] = 1
                } else {
                    myDict[slope]![yIntercept]! += 1
                }
                
            } else if firstElement == "-" {
                
                let slope = Int(subStrArray[1])!
                let yIntercept = Int(subStrArray[2])!
                
                myDict[slope]![yIntercept]! -= 1
                
            } else {
                
                let queryIntercept = Int(subStrArray[1])!
                var intersectionCount = 0
                for (slope, interceptDict) in myDict {
                    for (intercept, count) in interceptDict {
                        if (queryIntercept - intercept) % slope == 0 {
                            intersectionCount += count
                        }
                    }
                }
                
                print(intersectionCount)
            }
        }
    }
}
