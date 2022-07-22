//
//  먹을것인가 먹힐것인가.swift
//  AlgorithmBySwift
//
//  Created by 김나희 on 7/23/22.
//

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let A = readLine()!.split(separator: " ").map { Int(String($0))! }
    let B = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted { $0 < $1 }
    
    var res = 0
    for i in 0..<nm[0] {
        var lt = 0
        var rt = nm[1] - 1
        while lt <= rt {
            let mid = (lt+rt) / 2
            if B[mid] < A[i] {
                lt = mid + 1
            } else {
                rt = mid - 1
            }
        }
        res += lt
    }
    print(res)
}
