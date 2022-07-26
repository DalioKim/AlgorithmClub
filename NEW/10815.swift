import Foundation

let standardCount = Int(readLine()!)!
let standards = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

let targetCount = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map{Int(String($0))!}

var result = [String]()

for target in targets {
    result.append(binarySearch(target))
}

print(result.joined(separator: " "))

func binarySearch(_ target: Int) -> String {
    var start = 0
    var end = standardCount - 1
    var result = "0"
    
    while start <= end {
        let mid = (start + end) / 2
        if target > standards[mid] {
            start = mid + 1
        } else if target < standards[mid] {
            end = mid - 1
        } else {
            result = "1"
            break
        }
    }
    return result
}
