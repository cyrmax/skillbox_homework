import UIKit.UIView

extension ReadBookViewController: SliderViewDelegate {
    func valueDecremented(_ sender: SliderView) {
        switch sender {
        case dView.moveSlider:
            bookManager.fastBack()
        case dView.pitchSlider:
            SettingsManager.shared.speechPitch -= 0.05
        case dView.volumeSlider:
            SettingsManager.shared.speechVolume -= 0.05
        case dView.rateSlider:
            SettingsManager.shared.speechRate -= 0.05
        default:
            break
        }
        sender.value -= 0.05
    }

    func valueIncremented(_ sender: SliderView) {
        switch sender {
        case dView.moveSlider:
            bookManager.fastForward()
        case dView.pitchSlider:
            SettingsManager.shared.speechPitch += 0.05
        case dView.volumeSlider:
            SettingsManager.shared.speechVolume += 0.05
        case dView.rateSlider:
            SettingsManager.shared.speechRate += 0.05
        default:
            break
        }
        sender.value += 0.05
    }
}
