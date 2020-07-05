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
}
