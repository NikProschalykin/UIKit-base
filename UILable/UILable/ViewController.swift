//
//  ViewController.swift
//  UILable
//
//  Created by Николай Прощалыкин on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var welcome: UILabel!
    
    let codeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(codeLabel)
        
        codeLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 150)
        codeLabel.text = "some text for codeLabel generated from code"
        codeLabel.textColor = UIColor.green
        codeLabel.numberOfLines = 0 // растягивается на сколько угодно
        
        codeLabel.shadowColor = .gray
        codeLabel.shadowOffset = CGSize(width: 1, height: 1)
        
        //layer - это сам блок обьекта
        codeLabel.layer.cornerRadius = 5
        codeLabel.layer.borderColor = UIColor.red.cgColor
        codeLabel.layer.borderWidth = 2
        
    }

   

}

