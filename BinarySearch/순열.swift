//
//  순열.swift
//  AlgorithmBySwift
//
//  Created by 김나희 on 7/22/22.
//

import Foundation

// 이분탐색으로 풀이 -> 시간초과
let N = Int(readLine()!)!
var res = Array(repeating: 0, count: N)

for i in 0..<N {
    var element = Int(readLine()!)!
    for j in 0..<N {
        if element == 0 && res[j] == 0 {
            res[j] = i+1
            break
        }
        else if res[j] == 0 {
            element -= 1
        }
    }
}

for i in res {
    print(i)
}

// 세그먼트 트리로 풀이

import Foundation

let N = Int(readLine()!)!
var res = Array(repeating: 0, count: N+1)
var tree = Array(repeating: 0, count: 4*N)

build(1, 1, N)
for i in 1..<N+1 {
    let element = Int(readLine()!)!
    res[query(element+1, 1, 1, N)] = i
}

func build(_ node: Int, _ l: Int, _ r: Int) {
    if l == r {
        tree[node] = 1
        return
    }
    let mid = (l+r) / 2
    build(node*2, l, mid)
    build(node*2+1, mid+1, r)
    tree[node] = tree[node*2] + tree[node*2+1]
}

func query(_ val: Int, _ node: Int, _ nl: Int, _ nr: Int) -> Int{
    tree[node] -= 1
    if nl == nr {
        return nl
    }
    let mid = (nl+nr) / 2
    if tree[node*2] >= val {
        return query(val, node*2, nl, mid)
    }
    return query(val-tree[node*2], node*2+1, mid+1, nr)
}

for i in 1..<res.count {
    print(res[i])
}

