import RealmSwift

class Weather: Object, Decodable {
    @objc dynamic var temp: Double = 0
    @objc dynamic var pressure: Double = 0
    @objc dynamic var humidity: Double = 0

    enum codingKeys: String, CodingKey {
        case temp, pressure, humidity
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.pressure = try container.decode(Double.self, forKey: .pressure)
        self.humidity = try container.decode(Double.self, forKey: .humidity)
    }
}


class Wind: Object, Decodable {
    @objc dynamic var speed: Double = 0
    @objc dynamic var deg: Double = 0

    enum codingKeys: String, CodingKey {
case speed, deg
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.speed = try container.decode(Double.self, forKey: .speed)
        self.deg = try container.decode(Double.self, forKey: .deg)
    }
}


class WeatherResponse: Object, Decodable {
    @objc dynamic var main: Weather?
    @objc dynamic var wind: Wind?

    enum codingKeys: String, CodingKey {
case main, wind
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.main = try container.decode(Weather.self, forKey: .main)
        self.wind = try container.decode(Wind.self, forKey: .wind)
    }

    override var description: String {
        var str: String = ""
        str += "Temperature: \(self.main?.temp)\n"
        str += "Pressure: \(self.main?.pressure)\n"
        str += "Humidity: \(self.main?.humidity)\n"
        str += "Wind speed: \(self.wind?.speed)\n"
        return str
    }
}
