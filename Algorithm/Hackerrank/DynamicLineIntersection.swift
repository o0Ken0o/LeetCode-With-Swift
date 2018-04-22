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
        var myDict = [Int: Set<Int>]()
        for _ in 0..<n {
            let str = (readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!
            let subStrArray = str.split(separator: " ")
            
            let firstElement = subStrArray.first!
            if firstElement == "+" {
                
                let slope = Int(subStrArray[1])!
                let yIntercept = Int(subStrArray[2])!
                if myDict[slope] == nil {
                    myDict[slope] = Set<Int>()
                }
                myDict[slope]?.insert(yIntercept)
                
            } else if firstElement == "-" {
                
                let slope = Int(subStrArray[1])!
                let yIntercept = Int(subStrArray[2])!
                myDict[slope]?.remove(yIntercept)
                
            } else {
                
                let queryIntercept = Int(subStrArray[1])!
                var count = 0
                for (slope, interceptSet) in myDict {
                    interceptSet.forEach {
                        if (queryIntercept - $0) % slope == 0 {
                            count += 1
                        }
                    }
                }
                
                print(count)
            }
        }
    }
}
