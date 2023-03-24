//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Николай Прощалыкин on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime
        picker.minuteInterval = 5
    }


    @IBAction func pickerAction(_ sender: UIDatePicker) {
        print(sender.date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
        
        formatter.timeZone = TimeZone.current
        print(formatter.string(from: sender.date))
    }
}

