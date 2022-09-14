import Foundation

struct Queue<T> {
     var list = [T]()
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !list.isEmpty else { return nil }
        return list.removeFirst()
    }
    
    var isEmpty: Bool {
         return list.isEmpty
    }
}

struct Stack<T> {
     var list = [T]()
    
    mutating func push(_ element: T) {
        list.append(element)
    }
    
    mutating func pop() -> T? {
        guard !list.isEmpty else { return nil }
        return list.removeLast()
    }
    
    var isEmpty: Bool {
         return list.isEmpty
    }
}
