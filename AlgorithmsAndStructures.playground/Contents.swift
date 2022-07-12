import Foundation
import Darwin

func rotation(a: [Int], k: Int) -> [Int] {
    guard !a.isEmpty else { return [] }
    guard k > 0 else { return a }
    
    var result = a
    
    for _ in 1...k {
        result = rotateRightOnce(a: result)
    }
    
    return result
}

func rotateRightOnce(a: [Int]) -> [Int] {

    var newArray = Array<Int>(repeating: 0, count: a.count)

    for i in 0..<a.count - 1 {
        newArray[i + 1] = a[i]
    }
    newArray[0] = a.last!

    return newArray
}

func rotateLeft(a: [Int], k: Int) -> [Int] {
    
    guard !a.isEmpty else { return [] }
    guard k > 0 else { return a }
    
    var result = a
    
    for _ in 1...k {
        result.append(result.first!)
        result.removeFirst()
    }
    
    return result
}

rotateLeft(a: [1,2,3,4,5], k: 2)
//
//rotateRightOnce(a: [1,2,3,4,5])

rotation(a: [1,2,3,4,5], k: 1)
// -------------------------------------------------------------------------- //
func revertString(_ text: String) -> String {
    guard !text.isEmpty else { return "" }
    
    var result = [String]()
    
    for i in text {
        result.insert(String(i), at: 0)
    }
    
    return result.joined()
}

revertString("abc")
// -------------------------------------------------------------------------- //

func phoneNumber(_ s: String) -> String {
    
    // remove space and dashes
    let noSpace = s.replacingOccurrences(of: " ", with: "")
    let noSpaceNoDash = noSpace.replacingOccurrences(of: "-", with: "")
    
    // looping through char-by-char
    var result = ""
    
    var count = 1
    for c in noSpaceNoDash {
        result.append(c)
        if count % 3 == 0 {
            result.append("-")
        }
        count += 1
    }
    if result.last == "-" {
        result = String(result.dropLast())
    }
    
    // if second last char has a dash (-x)
    // reformat last thruu chars to (-xx)
    var chars = Array(result)
    let secondLastPtr = chars.count - 2
    if chars[secondLastPtr] == "-" {
        // *-x > -*x
        chars[secondLastPtr] = chars[secondLastPtr - 1]
        chars[secondLastPtr - 1] = "-"
        
    }
    
    return String(chars)
}

phoneNumber("123456789")
phoneNumber("12345678")
phoneNumber("123   -- 2345--456")

phoneNumber("01")
phoneNumber("012")

// -------------------------------------------------------------------------- //

public func findContact(_ A: [String],_ B: [String],_ P: String) -> String {
    var result = [String]()
    
    for i in 0..<B.count {
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        return "No contact"
    } else if result.count == 1 {
    return result.first!
    }
    
    return result.sorted().first!
}

let A = ["pim", "pom"]
let B = ["999999999", "11777888999"]
let P = "88999"

findContact(A, B, P)

// ----------------------------------------------------------------------------------------- //
//------------------------------------- Linked List ---------------------------------------- //
// ----------------------------------------------------------------------------------------- //
class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}



class LinkedList {
    private var head: Node?
    
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(1)
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(1)
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }
    
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(n)
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        node.next = newNode
    }
    
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(n)
    func getLast() -> Int? {
        if head == nil {
            return nil
        }
        
        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        return node.data
    }
    
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(n)
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data)
        var currentNode = head
        
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next!
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        
    }
    
    // ----------------------------------------------------------------------------------------- //
    // // time complexity O(1)
    func deleteFirst() {
        head = head?.next
    }
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(n)
    func deleteLast() {
        var nextNode = head
        var previoudNode: Node?
        
        while(nextNode?.next != nil) {
            previoudNode = nextNode
            nextNode = nextNode?.next
        }
        previoudNode?.next = nil
    }
    
    // ----------------------------------------------------------------------------------------- //
    // time complexity O(n)
    func deleteAtPosition(at position: Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    // ----------------------------------------------------------------------------------------- //
    var isEmpty: Bool {
        return head == nil
    }
    
    // ----------------------------------------------------------------------------------------- //
    func clear() {
        head = nil
    }
    
    // ----------------------------------------------------------------------------------------- //
    func printLinkedListSimple() {
        if head == nil { return }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}

let linkedList = LinkedList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedListSimple()

linkedList.addFront(7)
linkedList.printLinkedListSimple()

linkedList.addBack(5)
linkedList.printLinkedListSimple()

linkedList.getFirst()
linkedList.getLast()

linkedList.insert(position: 2, data: 8)
linkedList.printLinkedListSimple()

linkedList.deleteFirst()
linkedList.printLinkedListSimple()

linkedList.deleteLast()
linkedList.printLinkedListSimple()

linkedList.deleteAtPosition(at: 1)
linkedList.printLinkedListSimple()

// ----------------------------------------------------------------------------------------- //
// Write a func to fing a length linkedList

func length(_ head: Node?) -> Int {
    
    if head == nil {
        return 0
    }
    
    var len = 0
    var current = head
    
    while current != nil {
        len += 1
        current = current?.next
    }
    
    return len
}

length(node1)
// ----------------------------------------------------------------------------------------- //
// find merge linkedLists
func findMergeBrute(headA: Node?, headB: Node?) -> Int? {
    
    let m = length(headA)
    let n = length(headB)
    
    var currentA = headA
    
    for _ in 0...m-1 {
        var currentB = headB
        for _ in 0...n-1 {
            let A = currentA?.data
            let B = currentB?.data
            print("A: \(A ?? 0) B: \(B ?? 0)")
            if A == B {
                return currentA?.data
            }
            currentB = currentB?.next
        }
        currentA = currentA?.next
    }
    
    return nil
}
// ----------------------------------------------------------------------------------------- //
func findMergeSpaceTime(headA: Node?, headB: Node?) -> Int? {
    // Create a dict of all nodes of B
    // Use it to loop up each element of A
    let m = length(headA) // O(m)
    let n = length(headB) // O(n)
    
    var dict = [Int?: Bool]()
    var currentB = headB
    
    for _ in 0...n-1 { // O(n)
        let B = currentB?.data
        dict[B] = true
        currentB = currentB?.next
    }
    
    var currentA = headA
    
    for _ in 0...m-1 {
        let A = currentA?.data
        if dict[A] == true {
            return A
        }
        currentA = currentA?.next
    }
    return nil
}
// ----------------------------------------------------------------------------------------- //
func findMergeInsight(headA: Node?, headB: Node?) -> Int? { // O(n)
    
    let m = length(headA)
    let n = length(headB)
    
    var currentA = headA
    var currentB = headB
    
    if n > m {
        let temp = currentA
        currentA = currentB
        currentB = temp
    }
    
    let d = abs(m - n)
    
    for _ in 1...d {
        currentA = currentA?.next
    }
    
    for _ in 0...n-1 {
        let A = currentA?.data
        let B = currentB?.data
        if A == B {
            return A
        }
        currentA = currentA?.next
        currentB = currentB?.next
    }
    return nil
}


let node11 = Node(11, node2)
let node10 = Node(10, node11)

printLinkedListSimple(node1)
printLinkedListSimple(node10)

findMergeBrute(headA: node1, headB: node10)
findMergeSpaceTime(headA: node1, headB: node10)
findMergeInsight(headA: node10, headB: node1)

// ----------------------------------------------------------------------------------------- //
// Method to check if linked list has cycle (memory leak)
func hasCycle(first: Node) -> Bool {
    var slow: Node? = first
    var fast: Node? = first
    
    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow?.data == fast?.data {
            return true
        }
    }
    return false
}

let nodeA5 = Node(5)
let nodeA4 = Node(4)
let nodeA3 = Node(3)
let nodeA2 = Node(2)
let head = Node(1)

head.next = nodeA2
nodeA2.next = nodeA3
nodeA3.next = nodeA4
nodeA4.next = nodeA5
nodeA5.next = nodeA3

hasCycle(first: head)
