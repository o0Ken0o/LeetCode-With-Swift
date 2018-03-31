//
//  Combinatorics.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 11/1/2017.
//  Copyright © 2017 Kam Hei Siu. All rights reserved.
//

import Foundation

/* 
    the value of resulting nCr will be rounded down using modulus function with the upperBoound
    i.e. newValue = oldValue % upperBound
 
    you need to initialize the parameter array yourself and then execute the function like the following
 
    var ncrTable = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
    genNCR(&ncrTable)
    
*/
func genNCR (array: inout [[Int]], maxRow: Int, upperBound: Int=Int.max) {
    
    array[0][0] = 1
    
    for i in 1...maxRow-1 {
        for j in 0...i {
            if j == 0 || j == i {
                array[i][j] = 1
            } else {
                let overflowCheck = Int.addWithOverflow(array[i-1][j-1], array[i-1][j])
                if overflowCheck.overflow {
                    array[i][j] = (array[i-1][j-1] % upperBound) + (array[i-1][j] % upperBound)
                } else {
                    array[i][j] = array[i-1][j-1] + array[i-1][j]
                }
                
                if array[i][j] > upperBound {
                    array[i][j] %= upperBound
                }
            }
        }
    }
}

/*
    pass an empty array, maximum row number and upperBound
    
    maxRow >= 1
 */
func genPascalTriangle(array: inout [[Int]], maxRow: Int, upperBound: Int=1000000) {
    array = [[Int]]()
    array.append([1])
    
    for i in 1...maxRow {
        var newRow = Array(repeating: 0, count: array[i-1].count + 1)
        for j in 0...i {
            if j == 0 || j == i {
                newRow[j] = 1
            } else {
                let checkOverflow = Int.addWithOverflow(array[i-1][j-1], array[i-1][j-1])
                if checkOverflow.overflow {
                    newRow[j] = array[i-1][j-1] % upperBound + array[i-1][j-1] % upperBound
                } else {
                    newRow[j] = array[i-1][j] + array[i-1][j-1]
                }
                
                newRow[j] %= upperBound
            }
        }
        
        array.append(newRow)
    }
    
}

/*
    calling this func continuously poses a threat to the amount of running time
 */
func calNCR(_ n: Int, _ r: Int, _ upperBound: Int=10000000) -> Int {
    if r > n {
        return -1
    }
    
    if r == 0 || n == 0 {
        return 1
    }
    
    
    var arrayEven = [1]
    var arrayOdd = [Int]()
    
    var arrayRef: [Int]!
    var arrayToBeCal: [Int]!
    for i in 1...n {
        arrayRef = i % 2 != 0 ? arrayEven : arrayOdd
        arrayToBeCal = Array(repeating: 0, count: min(r+1, arrayRef.count + 1))
        for j in 0...min(r,i) {
            if j == 0 || j == i {
                arrayToBeCal[j] = 1
            } else {
                let addOverFlowCheck = Int.addWithOverflow(arrayRef[j], arrayRef[j-1])
                if addOverFlowCheck.overflow {
                    arrayToBeCal[j] = arrayRef[j] % upperBound + arrayRef[j-1] % upperBound
                } else {
                    arrayToBeCal[j] = arrayRef[j] + arrayRef[j-1]
                }
            }
            
            if arrayToBeCal[j] >= upperBound {
                arrayToBeCal[j] %= upperBound
            }
        }
        
        if i % 2 != 0 {
            arrayOdd = arrayToBeCal
        } else {
            arrayEven = arrayToBeCal
        }
    }
    
    if n % 2 != 0 {
        return arrayOdd[r]
    } else {
        return arrayEven[r]
    }
}

