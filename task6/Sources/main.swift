import Foundation

// Структура для покупателя
struct Customer {
    var id: Int
    var name: String
    var email: String
}

// Структура для заказа
struct Order {
    var orderId: Int
    var customerId: Int
    var item: String
    var price: Double
}

// Словари для хранения данных
var customers: [Int: Customer] = [:]
var orders: [Int: Order] = [:]

// Функция для вывода меню
func printMenu() {
    print("\n--- ИНТЕРАКТИВНОЕ МЕНЮ (ЗАДАНИЕ 6) ---")
    print("1. Добавить покупателя")
    print("2. Добавить заказ")
    print("3. Показать всех покупателей")
    print("4. Показать все заказы")
    print("5. Найти заказы покупателя по ID")
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
            print("Введите ID покупателя: ", terminator: "")
            guard let idInput = readLine(), let id = Int(idInput) else {
                print("Ошибка: Некорректный ID")
                continue
            }
            if customers[id] != nil {
                print("Ошибка: Покупатель с таким ID уже существует!")
                continue
            }
            print("Введите имя покупателя: ", terminator: "")
            let name = readLine() ?? "Без имени"
            print("Введите email покупателя: ", terminator: "")
            let email = readLine() ?? "Нет email"
            
            customers[id] = Customer(id: id, name: name, email: email)
            print("Покупатель успешно добавлен!")
            
        case 2:
            print("Введите ID заказа: ", terminator: "")
            guard let orderIdInput = readLine(), let orderId = Int(orderIdInput) else {
                print("Ошибка: Некорректный ID заказа")
                continue
            }
            if orders[orderId] != nil {
                print("Ошибка: Заказ с таким ID уже существует!")
                continue
            }
            print("Введите ID покупателя для этого заказа: ", terminator: "")
            guard let custIdInput = readLine(), let customerId = Int(custIdInput) else {
                print("Ошибка: Некорректный ID покупателя")
                continue
            }
            if customers[customerId] == nil {
                print("Предупреждение: Покупатель с ID \(customerId) не найден в базе, но заказ будет создан.")
            }
            print("Введите наименование товара: ", terminator: "")
            let item = readLine() ?? "Товар"
            print("Введите цену товара: ", terminator: "")
            let price = Double(readLine() ?? "0.0") ?? 0.0
            
            orders[orderId] = Order(orderId: orderId, customerId: customerId, item: item, price: price)
            print("Заказ успешно добавлен!")
            
        case 3:
            if customers.isEmpty {
                print("Список покупателей пуст.")
            } else {
                print("\n=== Список покупателей ===")
                for (_, customer) in customers {
                    print("ID: \(customer.id) | Имя: \(customer.name) | Email: \(customer.email)")
                }
            }
            
        case 4:
            if orders.isEmpty {
                print("Список заказов пуст.")
            } else {
                print("\n=== Список всех заказов ===")
                for (_, order) in orders {
                    print("Заказ №\(order.orderId) | Покупатель ID: \(order.customerId) | Товар: \(order.item) | Цена: \(order.price) BYN")
                }
            }
            
        case 5:
            print("Введите ID покупателя для поиска его заказов: ", terminator: "")
            guard let searchIdInput = readLine(), let searchId = Int(searchIdInput) else {
                print("Ошибка: Некорректный ID")
                continue
            }
            
            let customerOrders = orders.values.filter { $0.customerId == searchId }
            if customerOrders.isEmpty {
                print("У покупателя с ID \(searchId) нет заказов.")
            } else {
                if let customer = customers[searchId] {
                    print("\nЗаказы покупателя \(customer.name) (ID: \(searchId)):")
                } else {
                    print("\nЗаказы неизвестного покупателя (ID: \(searchId)):")
                }
                for order in customerOrders {
                    print("- Заказ №\(order.orderId): \(order.item) за \(order.price) BYN")
                }
            }
            
        case 0:
            print("Выход из программы...")
            isRunning = false
            
        default:
            print("Ошибка: Неверный пункт меню. Попробуйте снова.")
        }
    } else {
        print("Ошибка ввода. Введите число.")
    }
}
