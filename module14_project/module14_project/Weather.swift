import RealmSwift

class Weather: Object, Decodable {
    @objc dynamic var temp: Double = 0
    @objc dynamic var pressure: Double = 0
    @objc dynamic var humidity: Double = 0
}


class Wind: Object, Decodable {
    @objc dynamic var speed: Double = 0
    @objc dynamic var deg: Double = 0
}


class WeatherResponse: Object, Decodable {
    @objc dynamic var main: Weather
    @objc dynamic var wind: Wind

    override var description: String {
        var str: String = ""
        str += "Temperature: \(self.main.temp)\n"
        str += "Pressure: \(self.main.pressure)\n"
        str += "Humidity: \(self.main.humidity)\n"
        str += "Wind speed: \(self.wind.speed)\n"
        return str
    }
}
