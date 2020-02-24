import UIKit

enum BrandеTruck: String {
    case KAMAZ = "КАМАЗ"
    case MAN = "MAN"
    case HYUNDAI = "Hyundai"
    case MERCEDES = "Mercedes"
}
enum BrandСar: String{
    case HONDA = "Honda"
    case LADA = "Lada"
    case CITROEN = "Citroen"
    case NISSAN = "Nissan"
}
enum Engine {
    case start
    case stop
}
enum Windows {
    case open
    case close
}
enum Volume{
    case load(volume:Int)
    case unload(volume:Int)
}

struct Truck {
    var brand: BrandеTruck
    var model: String
    var year: Int               //Год выппуска
    var stateEngine: Engine     //Состояние двигателя
    var stateWindows: Windows   //Состояние окон
    var fullVolume: Int         //Объем
    var loadVolume: Volume      //Значение загрузить/разгрузить
    
    var freePlace: Int = 0{
    willSet{
            print("Будет изменен груз кузова на: \(newValue)" )
        }didSet{
            print("Был изменен груз кузова с на \(freePlace)")
        }
    }
    
    
    init(brand: BrandеTruck, model: String, year: Int, stateEngine: Engine = .stop, stateWindows: Windows = .close, fullVolume: Int, loadVolume: Volume = .load(volume: 0)) {
        self.brand = brand
        self.model = model
        self.year = year
        self.stateEngine = stateEngine
        self.stateWindows = stateWindows
        self.fullVolume = fullVolume
        self.loadVolume = loadVolume
    }
    
    
    mutating func changePlaceVolume() {
        let changeVolume = loadVolume
            switch changeVolume {
            case .load(let volume):
                freePlace += volume
            case .unload(let volume):
                freePlace -= volume
        }
    }
    
    
    mutating func changeStatusEngine() {
        if stateEngine == .stop{
            self.stateEngine = .start
        }else{
            self.stateEngine = .stop
        }
    }
}

struct Car {
    var brand: BrandСar
    var model: String
    var year: Int               //Год выпуска
    var stateEngine: Engine     //Состояние двигателя
    var stateWindows: Windows   //Состояние окон
    var fullVolume: Int         //Обьем кузова
    var loadVolume: Volume      //Значение загрузить/разгрузить
    var freePlace: Int = 0{
    willSet{
            print("Будет изменена загруженность багажника на \(newValue)")
        }didSet{
            print("Груз багажника \(freePlace)")
        }
    }
    
    init(brand: BrandСar, model: String, year: Int, stateEngine: Engine = .stop, stateWindows: Windows = .close, fullVolume: Int, loadVolume: Volume = .load(volume: 0)) {
        self.brand = brand
        self.model = model
        self.year = year
        self.stateEngine = stateEngine
        self.stateWindows = stateWindows
        self.fullVolume = fullVolume
        self.loadVolume = loadVolume
    }
    
    
    mutating func changePlaceVolume() {
        let changeVolume = loadVolume
            switch changeVolume {
            case .load(let volume):
                freePlace += volume
            case .unload(let volume):
                freePlace -= volume
        }
    }
    
    
    mutating func changeStatusWindows() {
        if stateWindows == .close{
            self.stateWindows = .open
        }else{
            self.stateWindows = .close
        }
    }
}

var car = Car(brand: .CITROEN, model: "C4", year: 1997, stateEngine: .stop, stateWindows: .close, fullVolume: 100)
var carTruck = Truck(brand: .MERCEDES, model: "666", year: 1999, stateEngine: .start, stateWindows: .close, fullVolume: 100)


var newTruck = Truck(brand: .MAN, model: "555", year: 2005, fullVolume: 300)
var newCar = Car(brand: .NISSAN, model: "Terrano", year: 2000, fullVolume: 100)



//Именение свойств
newTruck.model = "222"
newTruck.fullVolume = 500
newTruck.changeStatusEngine()
newTruck.year = 3000

newTruck.loadVolume = .load(volume: 200)
newTruck.changePlaceVolume()
newTruck.loadVolume = .load(volume: 200)
newTruck.changePlaceVolume()


newCar.changeStatusWindows()
newCar.loadVolume = .load(volume: 20)
newCar.changePlaceVolume()
newCar.loadVolume = .load(volume: 40)
newCar.changePlaceVolume()
newCar.loadVolume = .unload(volume: 30)
newCar.changePlaceVolume()

print("\\\\\\")
print(newTruck.brand, newTruck.model, newTruck.year, newTruck.stateEngine, newTruck.stateWindows, newTruck.fullVolume, newTruck.freePlace)
print(newCar.brand, newCar.model, newTruck.year, newCar.stateEngine, newCar.stateWindows, newCar.fullVolume, newCar.freePlace)

