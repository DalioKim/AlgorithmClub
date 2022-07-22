import Foundation

let input = Int(readLine()!)!
var tree = [Int: Int]()
createTree(start: 1, end: input, node: 1)
print("tree \(tree.sorted(by: <))")
var result = [Int: Int]()
for i in 1 ... input {
    let x = query(start: 1, end: input, node: 1, val: Int(readLine()!)!)
    result[x] = i
    update(start: 1, end: input, node: 1, idx: x)
}


func createTree(start: Int, end: Int, node: Int) {
    if start == end {
        tree[node] = 1
        return
    }
    let mid = (start + end) / 2
    //이분트리 생성
    createTree(start: start, end: mid, node: node * 2)
    createTree(start: mid + 1, end: end, node: node * 2 + 1)
    //    print("start \(start) mid \(mid) end \(end) node \(node)")
    
    tree[node] = tree[node * 2]! + tree[node * 2 + 1]!
    //    print("node \(node) tree \(tree[node]!)")
}

func update(start: Int, end: Int, node: Int, idx: Int) {
    //본인이 해당하는 쪽의 노드들만 업뎅이트 
    if idx < start || end < idx {
        return
    }
    if start == end {
        tree[node] = 0
        print("update문 index \(start) tree \(tree.sorted(by: <))")
        return;
    }
    
    let mid = (start + end) / 2
    update(start: start, end: mid, node: node * 2, idx: idx)
    update(start: mid + 1, end: end, node: node * 2 + 1, idx: idx)
    tree[node] = tree[node]! - 1
    
}

func query(start: Int, end: Int, node: Int, val: Int) -> Int {
    print("query문 필요한 빈칸 \(val)  tree \(tree)")
    if start == end {
        print("탐색 완료 필요한 빈칸 \(val) index \(start) tree \(tree.sorted(by: <))")
        return start
    }
    let mid = (start + end) / 2
    //    print("start \(start) mid \(mid) end \(end) node \(node) val \(val)")
    
    //좌우의 값은 같으나, 그 값을 기준으로 크면 우측 작으면 좌측
    if(tree[node * 2]! > val) {
        print("좌측 필요한 빈칸 \(val) 트리값 \(tree[node * 2]!)")
              return query(start: start, end: mid, node: node * 2, val: val)
              } else {
                  print("우측 필요한 빈칸 \(val) 트리값 \(tree[node * 2]!)")
                  //우측으로 이동한 경우 그만큼 값을 제외
            return query(start: mid+1, end: end, node: node*2+1, val: val - tree[node * 2]!)
        }
              }
              
              result.sorted {
            $0.key < $1.key
        }.forEach {
            print($0.value)
            
        }
              
