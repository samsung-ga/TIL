import Foundation

// 간단 구현
var parent = [Int]()

for i in 0...10 {
  parent.append(i)
}

func findParent(_ element: Int) -> Int {
  if parent[element] != element {
    return findParent(parent[element])
  } else {
    return element
  }
}

func union(_ first: Int, and second: Int) {
  let firstParent = findParent(first)
  let secondParent = findParent(second)
  if firstParent < secondParent {
    parent[secondParent] = firstParent
  } else {
    parent[firstParent] = secondParent
  }
}

// struct 구현
// 출처 : https://victorqi.gitbooks.io/swift-algorithm/content/union-find.html
// unionSets 함수 추가 + 함수명 변경
struct UnionFind<T: Hashable> {
  private var index = [T: Int]()
  private var parent = [Int]()
  private var size = [Int]()

  mutating func addSetWith(_ element: T) {
    index[element] = parent.count
    parent.append(parent.count)
    size.append(1)
  }

  mutating func findParent(_ element: T) -> Int? {
    if let indexOfElement = index[element] {
      return setByIndex(indexOfElement)
    } else {
      return nil
    }
  }

  mutating func setByIndex(_ index: Int) -> Int {
    if parent[index] == index {
      return index
    } else {
      return setByIndex(parent[index])
    }
  }

  mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
    if let firstSet = findParent(firstElement), let secondSet = findParent(secondElement) {
      return firstSet == secondSet
    } else {
      return false
    }
  }
  
  // 더 작은 쪽으로 parent 정한 방법
  mutating func unionSets(_ firstElement: T, and secondElement: T) {
    if let firstSet = findParent(firstElement), let secondSet = findParent(secondElement) {
      if firstSet > secondSet {
        parent[firstSet] = secondSet
        size[secondSet] += size[firstSet]
      } else {
        parent[secondSet] = firstSet
        size[firstSet] += size[secondSet]
      }
    }
  }
  
  // 사이즈를 기준으로 parent 정한 방법
  mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
    if let firstSet = findParent(firstElement), let secondSet = findParent(secondElement) {
      if firstSet != secondSet {
        if size[firstSet] < size[secondSet] {
          parent[firstSet] = secondSet
          size[secondSet] += size[firstSet]
        } else {
          parent[secondSet] = firstSet
          size[firstSet] += size[secondSet]
        }
      }
    }
  }
}
