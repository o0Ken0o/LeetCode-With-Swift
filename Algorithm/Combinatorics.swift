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
