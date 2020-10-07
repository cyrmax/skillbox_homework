import UIKit
import AVFoundation
import CoreData
import MediaPlayer

class ReadBookViewController: UIViewController {
    var dView: ReadBookView!
    let synth = AVSpeechSynthesizer()
var isSpeaking = false



    @objc func back() {
        switch isSpeaking {
        case true:
            isSpeaking = false
            synth.stopSpeaking(at: .immediate)
            guard let utterance = bookManager.previousSentence() else {
                dView.pauseBtn.isEnabled = false
                return
            }
            isSpeaking = true
            synth.speak(utterance)
        case false:
            bookManager.goBack()
     }
    }
    
    @objc func forward() {
        switch isSpeaking {
        case true:
            isSpeaking = false
            synth.stopSpeaking(at: .immediate)
            guard let utterance = bookManager.nextSentence() else {
                dView.pauseBtn.isEnabled = false
                return
            }
            isSpeaking = true
            synth.speak(utterance)
        case false:
            bookManager.goForward()
        }
    }
    
    @objc func play() {
        switch isSpeaking {
        case false:
            guard let utterance = bookManager.getSentence() else {
                dView.pauseBtn.isEnabled = false
                dView.pauseBtn.isSelected = false
isSpeaking = false
setPlaying()
return
            }
            dView.pauseBtn.isSelected = true
        isSpeaking = true
setPlaying()
                     synth.speak(utterance)
        case true:
            dView.pauseBtn.isSelected = false
            isSpeaking = false
            synth.stopSpeaking(at: .immediate)
        }
    }

    @objc func goToStart() {
        switch isSpeaking {
        case false:
            bookManager.goToStart()
        case true:
            dView.pauseBtn.isSelected = false
            isSpeaking = false
            synth.stopSpeaking(at: .immediate)
            bookManager.goToStart()        }
    }
    
    @objc func goToEnd() {
        switch isSpeaking {
        case false:
            bookManager.goTOEnd()
        case true:
            dView.pauseBtn.isSelected = false
            isSpeaking = false
            synth.stopSpeaking(at: .immediate)
            bookManager.goTOEnd()
        }
    }



    let bookManager = BookManager()

    override func loadView() {
        view = ReadBookView()
dView = view as? ReadBookView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        catch let error {
            print("", "audio Session error", error.localizedDescription)
        }
        dView.moveSlider.delegate = self
        dView.pitchSlider.delegate = self
        dView.volumeSlider.delegate = self
        dView.rateSlider.delegate = self
isSpeaking = false
        synth.stopSpeaking(at: .immediate)
        bookManager.delegate = self
        UserDefaults.standard.set(false, forKey: "shouldOpenLastBook")
        synth.delegate = self

        dView.rateSlider.setValue(SettingsManager.shared.speechRate)
        dView.pitchSlider.setValue(SettingsManager.shared.speechPitch)
        dView.volumeSlider.setValue(SettingsManager.shared.speechVolume)
        bookManager.loadLastBook()
        MPRemoteCommandCenter.shared().togglePlayPauseCommand.addTarget { (Event) -> MPRemoteCommandHandlerStatus in
            self.play()
            return .success
        }
                MPRemoteCommandCenter.shared().playCommand.addTarget { (Event) -> MPRemoteCommandHandlerStatus in
                    self.play()
                    return .success
                }
                MPRemoteCommandCenter.shared().pauseCommand.addTarget { (Event) -> MPRemoteCommandHandlerStatus in
                    self.play()
                    return .success
                }
    }
    
    
    func dismissAfterError() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
isSpeaking = false
        synth.stopSpeaking(at: .immediate)
        super.viewWillDisappear(animated)
    }

    func setPlayingInfo() {
        var info = [String: Any]()
        info[MPMediaItemPropertyTitle] = self.title
        var rate = 0.0
        if isSpeaking {
            rate = 1.0
        }
        info[MPNowPlayingInfoPropertyPlaybackRate] = rate
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
    }

    func setPlaying() {
        do {
            if !isSpeaking {
            try AVAudioSession.sharedInstance().setActive(isSpeaking, options: .notifyOthersOnDeactivation)
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
