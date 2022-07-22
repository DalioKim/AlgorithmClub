import Foundation

let l1 = Int(String(readLine()!))!
var testSize: [Int]
var l2: [Int]
var l3: [Int]
var cnt: Int
var l3Count: Int
var result: Int

for _ in 0..<l1 {
    cnt = 0
    testSize = readLine()!.split(separator: " ").map { Int(String($0))! }
    l2 = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    l3 = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    l3Count = l3.count
    
    for i in l2 {
        result = binarySearch(l: 0, r: l3Count, arr: l3, target: i)
        print(result)
    }

    print(cnt)
}

func binarySearch(l: Int, r: Int, arr: [Int], target: Int) -> Int {
    var left = l
    var right = r - 1
    var mid = 0
    
    while left <= right {
        mid = (left + right) / 2
        if arr[mid] < target {
            left = mid + 1
        } else if arr[mid] > target {
            right = mid - 1
        } else {
            return mid
        }
    }
    return mid
}
