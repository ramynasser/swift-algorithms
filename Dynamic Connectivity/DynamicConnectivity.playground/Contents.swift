import Foundation
class QuickFindUF {
    
    private var id:[Int] = []
    
    init(n: Int) {
        // initalize id array from 0 to n
        for index in 0..<n {
            id[index] = index
        }
    }
    // check if p and q is connectd
    func connected(p:Int,q:Int)-> Bool{
        return id[p] == id[q]
    }
    // union p and q
    func union(p:Int,q:Int) {
        let pid = id[p]
        let qid = id[q]
        for index in 0..<id.count {
            if id[index] == pid {
                id[index] = qid
            }
        }
    }
    
}

