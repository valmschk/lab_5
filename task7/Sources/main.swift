import Foundation

// Исходный массив для работы
var array: [Int] = []

// Функция для вывода элементов массива
func printArray() {
    if array.isEmpty {
        print("Массив сейчас пуст.")
    } else {
        print("Текущий массив: \(array)")
    }
}

// Функция для вывода интерактивного меню
func printMenu() {
    print("\n--- ИНТЕРАКТИВНОЕ МЕНЮ (ЗАДАНИЕ 7) ---")
    print("1. Добавить элемент в конец массива")
    print("2. Вставить элемент по индексу")
    print("3. Удалить элемент по индексу")
    print("4. Вывести только нечетные числа")
    print("5. Инвертировать (реверсировать) массив")
    print("6. Показать текущий массив")
    print("0. Выход")
    print("--------------------------------------")
    print("Выберите действие: ", terminator: "")
}

var isRunning = true

while isRunning {
    printMenu()
    
    if let input = readLine(), let choice = Int(input) {
        switch choice {
        case 1:
            print("Введите целое число для добавления: ", terminator: "")
            if let elementInput = readLine(), let element = Int(elementInput) {
                array.append(element)
                print("Элемент \(element) успешно добавлен в конец.")
            } else {
                print("Ошибка: Введено не корректное число.")
            }
            printArray()
            
        case 2:
            print("Введите целое число для вставки: ", terminator: "")
            guard let elementInput = readLine(), let element = Int(elementInput) else {
                print("Ошибка: Некорректное число.")
                continue
            }
            print("Введите индекс (от 0 до \(array.count)): ", terminator: "")
            guard let indexInput = readLine(), let index = Int(indexInput) else {
                print("Ошибка: Некорректный индекс.")
                continue
            }
            
            if index >= 0 && index <= array.count {
                array.insert(element, at: index)
                print("Элемент \(element) успешно вставлен на позицию \(index).")
            } else {
                print("Ошибка: Выход за границы массива. Допустимый диапазон: 0...\(array.count)")
            }
            printArray()
            
        case 3:
            if array.isEmpty {
                print("Ошибка: Массив пуст, удалять нечего.")
                continue
            }
            print("Введите индекс элемента для удаления (от 0 до \(array.count - 1)): ", terminator: "")
            if let indexInput = readLine(), let index = Int(indexInput) {
                if index >= 0 && index < array.count {
                    let removed = array.remove(at: index)
                    print("Элемент \(removed) на позиции \(index) успешно удален.")
                } else {
                    print("Ошибка: Неверный индекс. Допустимый диапазон: 0...\(array.count - 1)")
                }
            } else {
                print("Ошибка: Некорректный ввод индекса.")
            }
            printArray()
            
        case 4:
            let oddNumbers = array.filter { $0 % 2 != 0 }
            if oddNumbers.isEmpty {
                print("В массиве нет нечетных чисел.")
            } else {
                print("Нечетные числа в массиве: \(oddNumbers)")
            }
            
        case 5:
            array.reverse()
            print("Массив успешно инвертирован!")
            printArray()
            
        case 6:
            printArray()
            
        case 0:
            print("Выход из программы...")
            isRunning = false
            
        default:
            print("Ошибка: Неверный пункт меню. Попробуйте еще раз.")
        }
    } else {
        print("Ошибка ввода. Пожалуйста, введите число.")
    }
}
