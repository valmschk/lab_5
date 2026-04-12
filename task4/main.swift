import Foundation

// 1. Делители
for i in 1...1000 {
    var count = 0
    for j in 1...i {
        if i % j == 0 { count += 1 }
    }
    if count == 5 { print("Число с 5 делителями: \(i)") }
}

// 2. Нечетные
let oddNumbers = Array(10...40).filter { $0 % 2 != 0 }
print("Нечетные 10-40: \(oddNumbers)")

// 3. Рубли
func getRubles(n: Int) -> String {
    let r10 = n % 10
    let r100 = n % 100
    if r10 == 1 && r100 != 11 { return "\(n) рубль" }
    if (2...4).contains(r10) && !(12...14).contains(r100) { return "\(n) рубля" }
    return "\(n) рублей"
}
[1, 5, 22, 11, 42].forEach { print(getRubles(n: $0)) }

// 4. Реверс
class ArrayReverser<T> {
    var elements: [T]?
    init(_ elements: [T]?) { self.elements = elements }
    func reverse() -> [T]? { return elements?.reversed() }
}
let reverser = ArrayReverser([1, 2, 3, 4, 5])
if let result = reverser.reverse() { print("Реверс: \(result)") }