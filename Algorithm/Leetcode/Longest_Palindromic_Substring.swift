//
//  Longest_Palindromic_Substring.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 31/3/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    // we will use dynamic programming to solve this problem
    
    // 2d array
    var dpArr = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    var stringArr = Array(s)
    
    /*
     * init base case P(i, i)
     * P(i,i) is always true
     */
    for i in 0..<s.count {
        dpArr[i][i] = true
    }
    
    /*
     * init another base case P(i, i+1)
     * P(i,i+1) = Si == Si+1
     */
    for i in 0..<s.count {
        if i+1 < s.count {
            dpArr[i][i+1] = stringArr[i] == stringArr[i+1]
        }
    }
    
    /*
     * we can build up our result using the base cases
     */
    if s.count >= 2 {
        for j in 2..<s.count {
            for i in 0..<s.count {
                guard i+j < s.count else { break }
                dpArr[i][i+j] = stringArr[i] == stringArr[i+j] && dpArr[i+1][i+j-1]
            }
        }
    }
    
    var result = ""
    for i in 0..<s.count {
        for j in 0..<s.count {
            guard j >= i else { continue }
            if dpArr[i][j], result.count < j-i+1 {
                let ithIndex = s.index(s.startIndex, offsetBy: i)
                let jthIndex = s.index(s.startIndex, offsetBy: j)
                result = String(s[ithIndex...jthIndex])
            }
        }
    }
    
    return result
}

//let string = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"

//evaluateProblem { print(longestPalindrome(string)) }

