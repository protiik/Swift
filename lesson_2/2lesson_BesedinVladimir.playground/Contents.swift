import UIKit


//1. Написать функцию, которая определяет, четное число или нет.
func even (_ x:Int) -> Bool {
    return x % 2 == 0
}
even(-2)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func residue (_ x:Int) -> Bool {
    return x % 3 == 0
}
residue(-99)

// 3. Создать возрастающий массив из 100 чисел.

var massive : [Int] = []

for i in 1...100 {
    massive.append(i)
}
// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for (_, value) in massive.enumerated() {
    if even(value) || residue(value) == true {
        massive.remove(at: massive.firstIndex(of: value) ?? 0)
    }
}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
var fibMassive: [Decimal] = []

func fib(_ n: Int) {
    if n == 0 {fibMassive.append(0)}
    if n <= 2 {fibMassive.append(1)}
    if n > 2{
        var x:Decimal = 1
        var y:Decimal = 1
        var ans:Decimal = 0
        var i = 2
        while i < n {
            ans = x + y
            x = y
            y = ans
            i += 1
        }
        fibMassive.append(ans)
    }
}
for i in 1...100 {
    fib(i)
}
// рекурсией не вывозит это норм? так и должно быть?


//6.* Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.
//a
var simpleMassive: [Int] = []

func addMassive (_ n:Int) {
    var testMassive: [Int] = []
    for i in 2...n {
        let count = 2...i
        for j in count{
            if i % j == 0 {
                testMassive.append(i)
            }
        };
        if testMassive.count > 1 {
            testMassive.removeAll()
        }else{
            testMassive.removeAll()
            simpleMassive.append(i)
        }
    }
}

addMassive(550)
print(simpleMassive)
//b
let p = simpleMassive.first
//с Не понял что значит зачеркнуть???







