//
//  Benchmark.swift
//  Algorithm
//
//  Created by Kam Hei Siu on 30/3/2018.
//  Copyright © 2018 Kam Hei Siu. All rights reserved.
//

import Foundation

func evaluateProblem(problemBlock: () -> Void) {
    
    let start = DispatchTime.now() // <<<<<<<<<< Start time
    
    problemBlock()
    
    let end = DispatchTime.now()   // <<<<<<<<<<   end time
    
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
    
    print("running time \(timeInterval) seconds")
}
