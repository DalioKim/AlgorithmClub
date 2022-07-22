//
//  main.swift
//  B7795
//
//  Created by Atlas on 2022/07/21.
//

import Foundation

func solution(testCase: Int){
    for _ in 0..<testCase {
        let arraySize = readLine()?.split(separator: " ").compactMap{Int($0)}
        guard let arraySize = arraySize else { return }
    
        var array = [[Int]]()
        for _ in 0..<arraySize.count {
            let temp2 = readLine()?.split(separator: " ").compactMap{Int($0)}
            array.append((temp2!.sorted()))
        }
        
        getResult(array)
    }
}

func getResult(_ data: [[Int]]) {
    var count = 0
    
    data[0].forEach { str in
        let value = Int(str)
        data[1].forEach { str2 in
            let value2 = Int(str2)
            if value > value2 {
                count += 1
            }
        }
    }
    
    print("\(count)" )
}


let testCaseLength = readLine()!
print("\(solution(testCase: (Int(testCaseLength) ?? 0)))")

