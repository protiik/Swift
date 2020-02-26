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

class Car {
    let color:ColorsCars
    let model:String
    var statusEngine:StateEngine
    init(model: String ,color: ColorsCars, statusEngine:StateEngine) {
        self.model = model
        self.color = color
        self.statusEngine = statusEngine
    }
    
    func changeStatusEngine () {
        
    }
}

class SportCar: Car {
    
    enum ModsSportCar {
        case drift
        case sprint
    }
    
    let brand:BrandsSportСar
    var maxSpeed: Int
    var modif: ModsSportCar
    
    init(brand: BrandsSportСar,
         model: String,
         maxSpeed: Int,
         color: ColorsCars,
         statusEngine: StateEngine = .stop,
        modif: ModsSportCar) {
        self.brand = brand
        self.maxSpeed = maxSpeed
        self.modif = modif
        super.init(model: model, color: color, statusEngine: statusEngine)
    }
    
    override func changeStatusEngine() {
        if statusEngine == .stop{
            self.statusEngine = .start
        }else {
            self.statusEngine = .stop
        }
    }
    
    func changeMod() {
        if modif == .sprint{
            self.modif = .drift
        }else {
            self.modif = .sprint
        }
    }
}

class TruckCar: Car {
    enum HookTruckCar {
        case hook
        case unhook
    }
    
    let brand: BrandsCarTruck
    let maxTraction: Int
    var statusHook: HookTruckCar
    
    init(brand: BrandsCarTruck,
         model: String,
         maxTraction: Int,
         color: ColorsCars,
         statusEngine: StateEngine = .stop,
         statusHook: HookTruckCar = .unhook) {
        self.brand = brand
        self.maxTraction = maxTraction
        self.statusHook = statusHook
        
        super.init(model: model, color: color, statusEngine: statusEngine)
    }
    
    override func changeStatusEngine() {
        if statusEngine == .stop{
            self.statusEngine = .start
        }else {
            self.statusEngine = .stop
        }
    }
    
    func changeHook() {
        if statusHook == .unhook{
            self.statusHook = .hook
        }else {
            self.statusHook = .unhook
        }
    }
}


var newCarAM = SportCar(brand: .AstonMartin, model: "DBS", maxSpeed: 341, color: .purple, modif: .sprint)

newCarAM.changeMod()
newCarAM.maxSpeed = 300
newCarAM.changeStatusEngine()
print("Врум Врум, гонка поехала: \(newCarAM.brand.rawValue) \(newCarAM.maxSpeed) км/ч \(newCarAM.modif) \(newCarAM.statusEngine)")

var newTruck = TruckCar(brand: .KAMAZ, model: "4308", maxTraction: 8000, color: .red)

newTruck.changeStatusEngine()
newTruck.changeHook()
print(newTruck.brand, newTruck.maxTraction, newTruck.statusHook, newTruck.color, newTruck.statusEngine)
