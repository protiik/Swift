import UIKit

enum BrandsSportСar: String{
    case McLaren = "McLaren"
    case AstonMartin = "Aston Martin"
    case Lamborghini = "Lamborghini"
    case Ferrari = "Ferrari"
}
enum BrandsCarTruck: String {
    case KAMAZ = "КАМАЗ"
    case MAN = "MAN"
    case HYUNDAI = "Hyundai"
    case MERCEDES = "Mercedes"
}
enum ColorsCars: String {
    case yellow = "Желтый"
    case red = "Красный"
    case black = "Черный"
    case purple = "Фиолетовый"
}
enum StateEngine {
    case start
    case stop
}
enum StateWindows: String {
    case openWindow
    case closeWindow
}
enum StateDors: String {
    case openDor
    case closeDor
}

protocol Car {
    var model: String {get}
    var year: Int {get}
    var colors: ColorsCars {get}
    func ChangeStatusEngine (_ state: StateEngine)
}

extension Car {
    func changeStatusWindows (_ state: StateWindows) {
        print("Windows \(state)")
    }
    func changeStatusDor (_ state: StateDors) {
        print("Dors \(state)")
    }
}

class SportCar: Car, CustomStringConvertible {
    enum ModsSportCar {
        case drift
        case sprint
    }
    var brand:BrandsSportСar
    var model: String
    var year: Int
    var colors: ColorsCars
    var mod: ModsSportCar
    var maxSpeed: Int
    var description: String {
           "Cоздана новая машина под брендом: \(brand), " +
            "Конфигурация: \(mod)"
       }
    
    init(model: String, year: Int, colors: ColorsCars, brand: BrandsSportСar, maxSpeed: Int, mod: ModsSportCar) {
        self.model = model
        self.year = year
        self.colors = colors
        self.brand = brand
        self.maxSpeed = maxSpeed
        self.mod = mod
    }
    
    func ChangeStatusEngine(_ state: StateEngine) {
        print("Engine \(state)")
    }
}

class TruckCar: Car {

    enum HookTruckCar {
        case hook
        case unhook
    }
    var brand: BrandsCarTruck
    var model: String
    var year: Int
    var colors: ColorsCars
    var maxTraction: Int
    var statusHook: HookTruckCar
    
    init(brand: BrandsCarTruck, model: String, year: Int, colors: ColorsCars, maxTraction: Int, statusHook: HookTruckCar) {
        self.brand = brand
        self.model = model
        self.year = year
        self.colors = colors
        self.maxTraction = maxTraction
        self.statusHook = statusHook
    }
    
    func ChangeStatusEngine(_ state: StateEngine) {
        print("Endine \(state)")
    }
    
    
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        "Создан новый камаз под брендом: \(brand), " +
        "Прицеп: \(statusHook)"
    }
}


var astonM = SportCar(model: "ddd", year: 2000, colors: .purple, brand: .AstonMartin, maxSpeed: 300, mod: .drift)
var kamaz = TruckCar(brand: .KAMAZ, model: "fff", year: 2006, colors: .yellow, maxTraction: 300, statusHook: .unhook)

astonM.ChangeStatusEngine(.start)
astonM.changeStatusDor(.closeDor)
astonM.changeStatusWindows(.openWindow)
print(astonM)

kamaz.ChangeStatusEngine(.start)
kamaz.changeStatusWindows(.openWindow)
kamaz.ChangeStatusEngine(.stop)
print(kamaz)
