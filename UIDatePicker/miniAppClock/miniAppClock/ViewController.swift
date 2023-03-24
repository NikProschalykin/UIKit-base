//
//  ViewController.swift
//  miniAppClock
//
//  Created by Николай Прощалыкин on 21.02.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var label = UILabel()
    var datePicker = UIDatePicker()
    var button = UIButton()
    
    var alarmDate = 0.0
    var count = 0
    var timer: Timer?
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 200, width: 200, height: 100)
        label.center.x = view.center.x
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2
        label.font = UIFont.systemFont(ofSize: 30)
        
        view.addSubview(datePicker)
        datePicker.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        datePicker.center = view.center
        datePicker.addTarget(self, action: #selector(datePickerAction(sender:)), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .compact
        
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: view.frame.height - 300, width: 110, height: 48)
        button.setTitle("Start", for: .normal)
        button.center.x = view.center.x
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(sender: )), for: .touchUpInside)
         button.layer.cornerRadius = 15
         button.layer.borderColor = UIColor.red.cgColor
         button.layer.borderWidth = 2
    }
    
    func creatTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.count == 0 {
                self.stopTimer()
                self.playsSound()
            } else {
                self.count -= 1
                self.label.text = "\(self.count)"
            }
        })
    }
    
    func playsSound() {
        guard let url = Bundle.main.url(forResource: "June", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error")
        }
        player.play()
    }
    
    func stopSound() {
        player.stop()
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    @objc func datePickerAction(sender: UIDatePicker){
        alarmDate = sender.date.timeIntervalSince1970
    }
    
    @objc func buttonAction(sender: UIButton){
        if sender.title(for: .normal) == "Start"{
            sender.setTitle("Stop", for: .normal)
            count = Int(self.alarmDate) - Int(Date().timeIntervalSince1970)
            creatTimer()
        } else {
            sender.setTitle("Start", for: .normal)
            stopSound()
        }
    }
}

