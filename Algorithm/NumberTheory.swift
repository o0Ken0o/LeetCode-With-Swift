//
//  NumberTheory.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 16/1/2017.
//  Copyright © 2017 Kam Hei Siu. All rights reserved.
//

import Foundation

/*

 */
func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    
    if r == 0 {
        return b
    } else {
        return gcd(b, r)
    }
}

