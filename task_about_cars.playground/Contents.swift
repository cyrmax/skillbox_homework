protocol Car {
func getName() -> String
func getPrice() -> Int
func getColor() -> String
func getEngine() -> Int
}


class CarDecorator: Car {
    private let carToDecorate: Car
    required init(_ car: Car) {
        self.carToDecorate = car
    }
    func getName() -> String {
        carToDecorate.getName()
    }
    func getPrice() -> Int {
        carToDecorate.getPrice()
    }
    func getColor() -> String {
        carToDecorate.getColor()
    }
    func getEngine() -> Int {
        carToDecorate.getEngine()
    }
}


class mediumEquipment: CarDecorator {
    required init(_ car: Car) {
        super.init(car)
    }
    override func getName() -> String {
        super.getName() + " with medium equipment"
    }
    override func getEngine() -> Int {
        super.getEngine() + 1
    }
    override func getColor() -> String {
        return "White"
    }
    override func getPrice() -> Int {
        super.getPrice() + 30
    }
}


class premiumEquipment: CarDecorator {
    required init(_ car: Car) {
        super.init(car)
    }
    override func getName() -> String {
        super.getName() + " with premium equipment"
    }
    override func getPrice() -> Int {
        super.getPrice() + 50
    }
    override func getColor() -> String {
        return "Black"
    }
    override func getEngine() -> Int {
        super.getEngine() + 2
    }
}


class Infinity: Car {
    let name = "Infinity"
let price = 120
    let color = "Yellow"
    let engine = 1
    func getName() -> String {
        return name
    }
    func getPrice() -> Int {
        return price
    }
    func getColor() -> String {
        return color
    }
    func getEngine() -> Int {
        return engine
    }
}


class Volkswagen: Car {
let name = "Volkswagen"
let price = 90
let color = "Green"
    let engine = 1
    func getName() -> String {
        return name
    }
    func getPrice() -> Int {
        return price
    }
    func getColor() -> String {
        return color
    }
    func getEngine() -> Int {
        return engine
    }
}


class Opel: Car {
let name = "Opel"
    let price = 80
    let color = "Gray"
    let engine = 1
    func getName() -> String {
        return name
    }
    func getPrice() -> Int {
        return price
    }
    func getColor() -> String {
        return color
    }
    func getEngine() -> Int {
        return engine
    }
}



var opel: Car = Opel()

opel = premiumEquipment(opel)
opel.getPrice()
opel.getEngine()

var volkswagen: Car = Volkswagen()
volkswagen = mediumEquipment(volkswagen)
volkswagen.getPrice()

var infinity: Car = Infinity()
infinity.getEngine()

infinity = premiumEquipment(infinity)
infinity.getPrice()
