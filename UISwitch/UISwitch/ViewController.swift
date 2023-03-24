//
//  ViewController.swift
//  UISwitch
//
//  Created by Николай Прощалыкин on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {

   // @IBOutlet weak var someSwitch: UISwitch!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var sendButton: UIButton!
    
    let mySwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.alpha = 0
        sendButton.alpha = 0
        
        view.addSubview(mySwitch)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mySwitch.topAnchor.constraint(equalTo: label.topAnchor),
                                     mySwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor,constant: 8)])
        
        mySwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        
     /*   print(someSwitch.isOn) //Включен или выключен
        someSwitch.isOn = false // выключает
        print(someSwitch.isOn)
    */
    }
    
    @objc func switchAction(sender: UISwitch){
        if sender.isOn {
            UIView.animate(withDuration: 0.5){
                self.segmentedControl.alpha = 1
                self.sendButton.alpha = 1
            }
            }else{
                UIView.animate(withDuration: 0.5){
                    self.segmentedControl.alpha = 0
                    self.sendButton.alpha = 0
            }
        }
    }
    
    @IBAction func sendAction(_ sender: UIButton) {
        print("Спасибо за ваш отзыв - \(segmentedControl.selectedSegmentIndex+1)")
        
    }
    
    
/*
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        sleep(1)//пауза в 1 секунду
        someSwitch.isOn = true
        
        someSwitch.setOn(true, animated: true) //переключает анимированно
 }
    */
/*
    @IBAction func switchAction(_ sender: UISwitch) {
        
        print("switch changed")
    }
*/
 }

