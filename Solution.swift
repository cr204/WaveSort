//
//  Solution.swift
//  Created by Jasur Rajabov on 2023-07-26.

import Foundation

//var inputArray = ["cat", "fish", "ant", "ant", "elephant", "platypus", "platypus", "cat"]
var inputArray = [1, 2, 1, 2, 3, 7, 4, 9, 11, 3, 1, 2, 3, 1, 3, 7, 4, 9]
var resultArray = inputArray
var inc: Bool = true

inputArray.sort{ $0 < $1 }
resultArray = []
print("INPUT: \(inputArray)")

func solve() {
    let partialArr = inc ? Array(Set(inputArray)).sorted { $0 < $1 } : Array(Set(inputArray)).sorted { $0 > $1 }
    resultArray.append(contentsOf: partialArr)
    
    for element in partialArr {
        if let index = inputArray.firstIndex(of: element) {
            inputArray.remove(at: index)
        }
    }
    
    if !inputArray.isEmpty {
        inc = !inc
        solve()
    } else {
        print("OUTPUT: \(resultArray)")
    }
}

solve()
