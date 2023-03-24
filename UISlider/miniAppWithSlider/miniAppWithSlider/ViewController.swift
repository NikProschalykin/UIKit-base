//
//  ViewController.swift
//  miniAppWithSlider
//
//  Created by Николай Прощалыкин on 20.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CommonAmountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var periodSlider: UISlider!
    @IBOutlet weak var percentSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = "10000 р."
        periodLabel.text = "5 мес."
        percentLabel.text = "5 %"
        
        
    }

    @IBAction func amountSliderAction(_ sender: UISlider) {
        switch sender.tag{
        case 0: amountLabel.text = "\(Int(sender.value)) р."
        case 1: periodLabel.text = "\(Int(sender.value)) мес."
        case 2: percentLabel.text = "\(Int(sender.value)) %"
        default: return
        }
        
        setCommonAmount()
    }
    
    func setCommonAmount() {
        let percentAmount = amountSlider.value / 100 * percentSlider.value / 12
        let periodAmount = percentAmount * periodSlider.value
        CommonAmountLabel.text = "\(amountSlider.value + periodAmount) р."
    }
    
}

