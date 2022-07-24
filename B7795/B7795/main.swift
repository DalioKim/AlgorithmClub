//
//  main.swift
//  B7795
//
//  Created by Atlas on 2022/07/21.
//
//
//  main.swift
//  B7795
//
//  Created by Atlas on 2022/07/21.
//

import Foundation

func getResult(leftArray: [Int], rightArray: [Int]) {
    var count = 0
    
    leftArray.forEach { leftValue in
        var left = 0
        var right = rightArray.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            print("v :\(leftValue) , left: \(left) ,right :\(right), mid\(mid) , midvalue \(rightArray[mid])")
            if leftValue > rightArray[mid] {
                left = mid + 1
            }else{
                right = mid-1
            }
        }
        
        print("count ===== > \(left)")
        count += left
    }
    
    print("\(count)" )
}


let testCaseLength = readLine()!

for _ in 0..<Int(testCaseLength)! {
    let _ = readLine()?.split(separator: " ").compactMap{Int($0)}
    let leftArray = readLine()?.split(separator: " ").compactMap{Int($0)}.sorted()
    let rightArray = readLine()?.split(separator: " ").compactMap{Int($0)}.sorted()
    getResult(leftArray: leftArray!, rightArray: rightArray!)
}
