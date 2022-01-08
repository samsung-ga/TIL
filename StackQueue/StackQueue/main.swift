import Foundation

struct Stack<T> {
  private var storage: [T] = []
  
  var top: T? {
    return self.storage.last
  }
  
  var isEmpty: Bool {
    return self.storage.isEmpty
  }
  
  mutating func push_back(_ element: T) {
    self.storage.append(element)
  }
  
  mutating func pop() -> T? {
    return self.storage.popLast()
  }
  
}

struct Queue<T> {
  private var storage: [T] = []
  
  var front: T? {
    return self.storage.first
  }
  
  var back: T? {
    return self.storage.last
  }
  
  var isEmpty: Bool {
    return self.storage.isEmpty
  }
  
  mutating func push(_ element: T) {
    self.storage.append(element)
  }
  
  mutating func pop() -> T? {
    guard self.isEmpty == false else { return nil }
    return self.storage.removeFirst()
  }
}

