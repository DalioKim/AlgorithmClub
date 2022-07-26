import Foundation

let l1 = Int(String(readLine()!))!
let l2 = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let l3 = Int(String(readLine()!))!
let l4 = readLine()!.split(separator: " ").map { Int(String($0))! }

var resultArrs = [Int]()

for num in l4 {
    resultArrs.append(bisect(l: 0, r: l1, arrs: l2, target: num))
}

print(resultArrs)


func bisect(l: Int, r: Int, arrs: [Int], target: Int) -> Int {
    var left = l, right = r - 1
    
    while (left <= right) {
        var mid = (left + right) / 2
        
        if arrs[mid] < target {
            left = mid + 1
        } else if arrs[mid] > target {
            right = mid - 1
        } else {
            return 1
        }
    }
    return 0
}
