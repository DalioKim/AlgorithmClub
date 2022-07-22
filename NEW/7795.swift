/*
 
 문제해석
 주어진 배열 A와 B에서
 A가 B의 요소보다 클때 짝을 지을 수 있다
 A와 B의 조합의 갯수를 구하기
 
 
 포인트
 A와 B요속간엥 각자 비교하면 시간복잡도 절대 못채움
 mid 기준으로 A를 옮겨 까능한 쌍을 찾고
 B의 한요소에대해 쌍이 따 나옹면 또 옮기는 형식
 투포인특가 맞음
 
 */


import Foundation

let count = Int(readLine()!)!

for _ in 0 ..< count {
    let _ = readLine()!
    let firstArr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    let secondArr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    
    var start = 0
    var end = 0
    var count = 0
    
    while end <= secondArr.count - 1 && start <= firstArr.count - 1{
        
        //투포인터 로직 좀 더 구체적으로 생각
        /*
         A가 클때는 B의 기준이 달라졌는지 확인하고 A의 한칸을 땡긴다.
         아니면 B를 뒤로 옮긴다.
         */
        if firstArr[start] > secondArr[end] {
            count += (firstArr.count - start)
            end += 1
        } else {
            start += 1
            
        }
        
    }
    
    print(count)
}
