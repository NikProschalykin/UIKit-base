//
//  ViewController.swift
//  UIButton
//
//  Created by Николай Прощалыкин on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var TitleLable: UILabel!
    
    
    @IBOutlet weak var TrueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TrueButton.layer.borderColor = UIColor.red.cgColor
        TrueButton.layer.borderWidth = 1
        TrueButton.layer.cornerRadius = 10
        TrueButton.setTitleColor(.purple, for: .normal)
        TrueButton.setTitleColor(.green, for: .highlighted)
        
        let actionButton = UIButton()
        view.addSubview(actionButton)
        
        actionButton.layer.borderColor = UIColor.red.cgColor
        actionButton.layer.borderWidth = 1
        actionButton.layer.cornerRadius = 10
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false //чтобы добавлять констеинты с кода
        NSLayoutConstraint.activate([actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93), actionButton.widthAnchor.constraint(equalToConstant: 145),
                                     actionButton.heightAnchor.constraint(equalToConstant: 109)])
        
        
        actionButton.setTitle("Действие", for: .normal)
        actionButton.setTitleColor(.purple, for: .normal)
        actionButton.setTitleColor(.green, for: .highlighted)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 31)
        //actionButton.showsTouchWhenHighlighted = true перестало работать в IOS16
        
        actionButton.addTarget(self, action: #selector(letAction), for: .touchUpInside)
    }

    @IBAction func trueAction(_ sender: Any) {
        TitleLable.text = Source.getInfo(type: .word)
    }
    
    @objc func letAction() {
        TitleLable.text = Source.getInfo(type: .action)
    }
}

