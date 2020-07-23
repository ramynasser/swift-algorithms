
import Foundation
public class Node<T: Comparable> {
    var key: T!
    var left: Node?
    var right: Node?

    //add item based on its value
    func addNode(key: T) {
        //check for the head node
        if (self.key == nil) {
            self.key = key
            return
        }

        //check the left side of the tree
        if (key < self.key) {
            if (self.left != nil) {
                left!.addNode(key: key)
            }
            else {
                //create a new left node
                let leftChild : Node = Node()
                leftChild.key = key
                self.left = leftChild
            }
        } //end if

        //check the left side of the tree
        if (key > self.key) {
            if (self.right != nil) {
                right!.addNode(key: key)
            }
            else {
                //create a new right node
                let rightChild : Node = Node()
                rightChild.key = key
                self.right = rightChild
            }
        } //end if
    } //end function
} //end class

func createTree(from strArr: [String]) -> String {
   var numberList:[Int] = []
   for item in  strArr {
    if item != "#" {
        numberList.append(Int(item)!)
     }
   }
    
  //create a new BST instance
    let root = Node<Int>()

    //sort each item in the list
    for number in numberList {
        root.addNode(key: number)
    }
    
    let PreorderTraversal = recursivePreorderTraversal(root: root)
    
    var printStr:String = ""
    for item in  PreorderTraversal {
        printStr.append(String(item))
        printStr.append("")
    }
    
  // code goes here
  // Note: feel free to modify the return type of this function
    return printStr
}


func recursivePreorderTraversal(root: Node<Int>?) -> [Int] {
    if root == nil {
        return []
    }
    var result: [Int] = []
    result.append(root!.key)
    result += recursivePreorderTraversal(root: root!.left)
    result += recursivePreorderTraversal(root: root!.right)
    return result
}

func recursiveInorderTraversal(root: Node<Int>?) -> [Int] {
    if root == nil {
        return []
    }
    var result: [Int] = []
    result += recursiveInorderTraversal(root: root!.left)
    result.append(root!.key)
    result += recursiveInorderTraversal(root: root!.right)
    return result
}
func recursivePostTraversal(root: Node<Int>?) -> [Int] {
    if root == nil {
        return []
    }
    var result: [Int] = []
    result += recursivePostTraversal(root: root!.left)
    result += recursivePostTraversal(root: root!.right)
    result.append(root!.key)
    return result
}
