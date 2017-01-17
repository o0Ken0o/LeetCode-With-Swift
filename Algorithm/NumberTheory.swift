//
//  NumberTheory.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 16/1/2017.
//  Copyright © 2017 Kam Hei Siu. All rights reserved.
//

import Foundation

/*
    find the greatest common divisor between a and b
 */
func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    
    if r == 0 {
        return b
    } else {
        return gcd(b, r)
    }
}

/*
    get the prime factorization of n in the form of dictionary
    where each key value pairs represents a prime factor and the corresponding power
 */
func factorize(_ n: Int) -> [Int: Int] {
    
    if n == 1 {
        return [Int: Int]()
    }
    
    let maxDivisor = Int(sqrt(Double(n)))
    var factorDict = [Int: Int]()
    var num = n
    
    if maxDivisor > 1 {
        for i in 2...maxDivisor {
            if num % i == 0 {
                num /= i
                factorDict = combineTwoDict(factorDict, combineTwoDict(factorize(num), factorize(i)))
                break
            }
        }
        
        if num == n {
            factorDict[num] = 1
        }
    } else {
        factorDict[num] = 1
    }
    
    return factorDict
}

func combineTwoDict(_ a: [Int: Int], _ b: [Int: Int]) -> [Int: Int] {
    var resultDict = a
    
    for (key, value) in b {
        if let oldValue = resultDict[key] {
            resultDict[key] = oldValue + value
        } else {
            resultDict[key] = value
        }
    }
    
    return resultDict
}

