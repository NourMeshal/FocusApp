//
//  ViewController.swift
//  Focus
//
//  Created by Nour Altunaib on 4/30/21.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var timerLable: UILabel!
     
    var timer:Timer? = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    var cell = TableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(times)
        self.navigationController?.isNavigationBarHidden = true
        stopBtn.layer.borderWidth = 1
        stopBtn.layer.cornerRadius = 10
        stopBtn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 0.9016166329, alpha: 1)
        print("my timer = " )
        // Setup
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults.standard.setValue(0, forKey: "time")
        }
        print(IndexPath.self)
       update()
        
    }
    func update(){
        
        guard let timerr = UserDefaults().value(forKey: "time") as? Int else{
            print(times)
            return
        }
        
        
        for x in 0..<timerr{
            if let timerr = UserDefaults().value(forKey: "time_\(x+1)") as? String  {
                
                times.append(timerr)
                
            }
            
        }
    }
    @objc func fireTimer() {
        print("Timer fired!")
    }

    @IBAction func stop(_ sender: Any) {
        if(timerCounting) {
            timerCounting = false
            timer?.invalidate()
            stopBtn.setTitle("Start", for: .normal)
            
            print(times)
            //cell.cellLable.text = String(count)
            //cell.cellLable.text = times[0]
            
        }
        else {
            timerCounting = true
            stopBtn.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func rest(_ sender: Any) {
        let alert = UIAlertController(title: "Rest Timer?", message: "Are you sure you would like to reset the Timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (_) in
            self.count = 0
            self.timer?.invalidate()
            self.timerLable.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.stopBtn.setTitle("Start", for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func timerCounter() {
        count = count + 1
        let time = secondsToHoursMinutesSecond(secondes: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLable.text = timeString
        
    }
    func secondsToHoursMinutesSecond(secondes: Int) -> (Int, Int, Int) {
        return ((secondes / 3600), ((secondes % 3600) / 60), ((secondes % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

