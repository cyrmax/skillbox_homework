import Foundation
import AVFoundation


class SettingsManager {
    var preferedVoice: AVSpeechSynthesisVoice {
        get {
            guard let identifier = UserDefaults.standard.string(forKey: "currentVoice") else {
                return AVSpeechSynthesisVoice(language: AVSpeechSynthesisVoice.currentLanguageCode())!
            }
            guard let voice = AVSpeechSynthesisVoice(identifier: identifier) else {
                return AVSpeechSynthesisVoice(identifier: AVSpeechSynthesisVoice.currentLanguageCode())!
            }
return voice
        }
        set {
            UserDefaults.standard.set(newValue.identifier, forKey: "currentVoice")
        }
    }

    var speechSettings: (Float, Float, Float) {
        get {
            guard let settingsArray = UserDefaults.standard.array(forKey: "speechSettings") as? [Float] else {
                return (0.5, 0.5, 1.0)
            }
return (settingsArray[0], settingsArray[1], settingsArray[2])
        }
        set {
            let (rate, pitch, volume) = newValue
            let array: [Float] = [rate, pitch, volume]
            UserDefaults.standard.set(array, forKey: "speechSettings")
        }
    }

    var speechRate: Float {
        get {
            return self.speechSettings.0
        }
        set {
            self.speechSettings.0 = newValue
        }
    }

    var speechPitch: Float {
        get {
            return self.speechSettings.1
        }
        set {
            self.speechSettings.1 = newValue
        }
    }

    var speechVolume: Float {
        get {
            return self.speechSettings.2
        }
        set {
            self.speechSettings.2 = newValue
        }
    }

static let shared = SettingsManager()
    private init() {}
}
