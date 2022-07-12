import UIKit


struct MyArray {
    var lenght: Int
    var data: [Int:String]
    
    init() {
        self.lenght = 0
        self.data = [:]
    }
    
    init(lenght: Int, data: [Int:String]) {
        self.lenght = lenght
        self.data = data
    }
    
    func get(_ itemAtIndex: Int) -> String {
        guard let item = data[itemAtIndex] else { return "undefined value"}
        return item
    }
    
    @discardableResult mutating func push(item: String) -> Int {
        data[self.lenght] = item
        defer {
            self.lenght += 1
        }
        return self.lenght
    }
    
    @discardableResult mutating func pop() -> String? {
        guard let index = data.index(forKey: self.lenght - 1) else { return nil }
        
        self.lenght -= 1
        return data.remove(at: index).value
    }
    
}

var newArray = MyArray()
newArray.push(item: "Hi")
newArray.push(item: "You")
newArray.push(item: "!")
print(newArray)
newArray.pop()
print(newArray)

func reverseStr(str: String) -> String {
    let newStr = str.reversed()
    
    return String(newStr)
}

print(reverseStr(str: "Hello my name is Dima"))

func mergedArr(arr1: [Int], arr2: [Int]) -> [Int] {
    let newArr = arr1 + arr2
    return newArr.sorted()
}

mergedArr(arr1: [1,3,4,6,7], arr2: [2,4,6,78,8])



func firstReccurringNumber(arr: [Int]) {
    var arrUniq = [Int]()
    var arrRep = [Int]()
    for i in arr {
        if !arrUniq.contains(i) {
            arrUniq.append(i)
        } else {
            arrRep.append(i)
        }
    }
    print(arrRep)
}

firstReccurringNumber(arr: [1,2,3,5,6,7,5,4,7,33])

var count = 0
func recursion() {
    while count < 3 {
        count += 1
        print(count)
        recursion()
    }
    print("Done")
}

recursion()


func factorial(num: Int) {
    var answer = 1
    for i in 2...num {
        answer = answer * i
    }
    print(answer)
}

factorial(num: 5)

func factorial1(num: Int) -> Int {
    var result = 0
    if num == 2 {
        return 2
    } else {
        result = num * factorial1(num: num - 1)
    }
    return result
}

factorial1(num: 5)


func fibonacci(_ num: Int) -> Int {
    if num < 2 {
        return num
    }
    let result = fibonacci(num - 1) + fibonacci(num - 2)
    print(result)
    return result
}

fibonacci(10)

let arr = [2, 65, 34, 2, 1, 7, 8]
let arr2 = arr.sorted()

func bubleSort(arr: [Int]) {
    var length = arr.count
    for i in arr {
        for j in arr {
            if j > i {
                
            }
        }
    }
}
