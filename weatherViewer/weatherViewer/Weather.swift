struct Weather: Decodable {
    let temp: Double
    let pressure: Double
    let humidity: Double
}


struct Wind: Decodable {
    let speed: Double
    let deg: Double
}


struct WeatherResponse: Decodable {
    let main: Weather
    let wind: Wind

    var description: String {
        var str: String = ""
        str += "Temperature: \(self.main.temp)\n"
        str += "Pressure: \(self.main.pressure)\n"
        str += "Humidity: \(self.main.humidity)\n"
        str += "Wind speed: \(self.wind.speed)\n"
return str
    }
}


struct ForecastResponse: Decodable {
    let list: [WeatherResponse]
}
