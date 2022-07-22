import Foundation

let input = Double(readLine()!)!

var start: Double = 0
var end = input

while start <= end {
    let mid = ceil((start + end) / 2)
    if ceil(input / mid) == mid {
        start = mid
        break
    } else if ceil(input / mid) > mid {
        start = mid + 1
    } else {
        end = mid - 1
    }
}
print(Int(start))
