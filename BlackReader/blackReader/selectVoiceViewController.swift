import UIKit
import AVFoundation

class selectVoiceViewController: UITableViewController {

    var voiceList: [AVSpeechSynthesisVoice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "voiceCell")
        voiceList = AVSpeechSynthesisVoice.speechVoices().filter({$0.language == AVSpeechSynthesisVoice.currentLanguageCode()})

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voiceList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "voiceCell", for: indexPath)
        cell.textLabel?.text = voiceList[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let voice = voiceList[indexPath.row]
        UserDefaults.standard.set(voice.identifier, forKey: "currentVoice")
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
