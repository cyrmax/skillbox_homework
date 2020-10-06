import Foundation

class WeatherService {
    let cityID: String = "524901"
    let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeather(handler: @escaping WeatherCompletionHandler) {
        URLSession.shared.dataTask(with: URL(string: apiUrl + "?id=" + cityID + "&appid=" + apiKey)!, completionHandler: {
            data, response, error in
            if let error = error {
                DispatchQueue.main.sync {
                    handler(Result.failure(error))
                }
                return
            }
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else { return }

            let decoder = JSONDecoder()
            do {
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                DispatchQueue.main.sync {
                    handler(Result.success(weatherResponse))
                }
            } catch {
                DispatchQueue.main.sync {
                    handler(Result.failure(error))
                }
            }
        }).resume()
    }

    static let shared = WeatherService()

    private init() {}
    typealias WeatherCompletionHandler = (Result<WeatherResponse, Error>) -> Void
}
