//
//  Helpers.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 1/4/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

func convert(char: Character) -> Int? {
    switch char {
    case "0":
        return 0
    case "1":
        return 1
    case "2":
        return 2
    case "3":
        return 3
    case "4":
        return 4
    case "5":
        return 5
    case "6":
        return 6
    case "7":
        return 7
    case "8":
        return 8
    case "9":
        return 9
    default:
        return nil
    }
}

func isAnAlphabet(_ char: Character) -> Bool {
    return String(char).range(of: "[a-zA-Z]", options: .regularExpression) != nil
}

infix operator **

func **(base: Int, index: Int) -> Int {
    var product = 1
    for _ in 0..<index {
        product *= base
    }
    return product
}
