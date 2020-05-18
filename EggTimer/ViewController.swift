import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsPast = 0
    var totalTime = 0
    var timer = Timer()
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        timerProgress.progress = 0.0
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        secondsPast = 0
        
        titleText.text = "Cooking..."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPast < totalTime {
            secondsPast += 1
        } else {
            titleText.text = "Done!"
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            timer.invalidate()
        }
        timerProgress.progress = Float(secondsPast)/Float(totalTime)
    }
}
