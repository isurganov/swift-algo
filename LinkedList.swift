import Foundation

// Node structure itself
public class LLNode<T> {
    var value: T
    var next: LLNode?
    weak var previous: LLNode?
    
    public init(value: T) {
        self.value = value
    }
}

// Start of the list
public class LinkedList<T> {
    public typealias Node = LLNode<T>
    
    private var head: Node?
    
    public var first: Node? {
        return head
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    //Keeping track of the tail node
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    //Count the nodes
    public var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let next = node.next {
            count += 1
            node = next
        }
        return count
    }
    
    //Append new node to the end of the list
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    //Return node by index
    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { //(*1)
                    break
                }
            }
            return node!
        }
    }
    
    //Insert node by index
    public func insert(value: T, atIndex index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index-1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
}
