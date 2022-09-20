import Foundation

class TreeNode<T> {
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(data: T,
         leftNode: TreeNode? = nil,
         rightNode: TreeNode? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BinaryTree<T: Comparable & CustomStringConvertible> {
    
    public typealias Node = TreeNode<T>
    
    private var rootNode: Node?
    
    func insert(element: T) {
        let node = Node(data: element)
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    // RECURSIVE FUNCTION
    private func insert(_ rootNode: Node _ node: Node) {
        if rootNode.data > node.data {
            if let leftNode = rootNode.leftNode {
                self.insert(leftNode, node)
            } else {
                rootNode.leftNode = node
            }
        } else {
            if let rightNode = rootNode.rightNode {
                self.insert(rightNode, node)
            } else {
                rootNode.rightNode = node
            }
        }
    }
}

extension BinaryTree {
    
    func search(element: T) {
        self.search(self.rootNode, element)
    }
    
    private func search(_ rootNode: TreeNode<T>?, _ element: T) {
        
        guard let rootNode = rootNode else {
            print("INVALID NODE : \(element)")
            return
        }
        
        print("ROOT NODE \(rootNode.data)")
        if element > rootNode.data {
            self.search(rootNode.rightNode, element)
        } else if element < rootNode.data {
            self.search(rootNode.leftNode, element)
        } else {
           print("NODE FOUND : \(rootNode.data)")
        }
    }
}
