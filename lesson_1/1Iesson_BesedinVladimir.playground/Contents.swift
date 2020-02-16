import UIKit

//
// 1. Решить квадратное уравнение.
let a:Int = 1
var b:Int = 12
let c:Int = 36

// b в квадрате
let pw:Int = Int(pow(Double(b), 2))
//Дискриминант
let d:Int = pw - 4 * a * c
if d > 0 {
    // корень b^2 - 4ac
    let sqr:Int = Int(sqrt(Double(pw - (4 * a * c))))
    
    let x1 = (-(b) + sqr) / 2 * a
    let x2 = (-(b) - sqr) / 2 * a
    print("Уравнение имеет два корня")
    print("x1: " + String(x1))
    print("x2: " + String(x2))
}else if d == 0 {
    let sqr:Int = Int(sqrt(Double(pw - (4 * a * c))))
    
    let x1 = (-(b) + sqr) / 2 * a
    
    print("уравнение имеет один корень")
    print("x1: " + String(x1))
    
}else {
    print("Нет действительных корней")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// Катет А
let katetA = 3
// Катет B
let katetB = 4
// Площадь
let area = (1 * katetA * katetB) / 2
print("Площадь: " +  String(area))
//Гипотенуза
let powA = Int(pow(Double(katetA), 2))
let powB = Int(pow(Double(katetB), 2))
let gipot = Int(sqrt(Double(powA + powB)))
print("Гипотенуза: " + String(gipot))
// Периметр
let perim = katetA + katetB + gipot
print("Периметр: " + String(perim))


// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

let deposit:Int = 100000
let percent:Float = 0.14
var sum = Float(deposit)
for _ in 1...5 {
    sum += sum * percent
}
var total = Int(sum)
print("Сумма после 5 лет: " + String(total))
