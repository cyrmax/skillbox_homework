import Foundation
import Alamofire

class WeatherService {
    let cityID: String = "524901"
    let apiUrl: String = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeather(handler: @escaping WeatherCompletionHandler) {
        URLSession.shared.dataTask(with: URL(string: apiUrl + "?id=" + cityID + "&appid=" + apiKey)!, completionHandler: {
            data, response, error in
            if let error = error {
                print(error.localizedDescription)
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
handler(weatherResponse)
                }
            } catch {
                print(error.localizedDescription)
            }
        }).resume()
    }

    func fetchForecast(handler: @escaping ForecastCompletionHandler) {
        let params: [String: Any] = [
            "id": cityID,
            "cnt": 7,
            "appid": apiKey
        ]



        AF.request("https://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&appid=\(apiKey)").validate().response {
            response in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let decoder = JSONDecoder()
                guard let decoded = try? decoder.decode(ForecastResponse.self, from: data!) else {
                    print("decoding error")
                    return
                }

handler(decoded)
            }
        }
    }

static let shared = WeatherService()

    private init() {}
typealias WeatherCompletionHandler = (WeatherResponse) -> Void
typealias ForecastCompletionHandler = (ForecastResponse) -> Void
}
