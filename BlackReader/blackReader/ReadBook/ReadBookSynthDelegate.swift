import AVFoundation

extension ReadBookViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        switch isSpeaking {
        case true:
            guard let utterance = bookManager.nextSentence() else {
isSpeaking = false
                dView.pauseBtn.isEnabled = false
setPlaying()
                return
            }
            synth.speak(utterance)
        case false:
setPlaying()
        }
setPlayingInfo()
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        dView.pauseBtn.isSelected = false
        isSpeaking = false
setPlaying()
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        dView.pauseBtn.isSelected = true    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        dView.pauseBtn.isSelected = true    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
setPlaying()
        dView.pauseBtn.isSelected = false
    }
}
