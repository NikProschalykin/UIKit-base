//
//  PresenredViewController.swift
//  UINavigationController
//
//  Created by Николай Прощалыкин on 10.03.2023.
//

import Foundation
import UIKit

class PresentedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let label = UILabel(frame: .init(origin: .init(x: 60, y: 100), size: .init(width: 300, height: 300)))
        view.addSubview(label)
        label.text = "I'm presented ViewController"
    }
    
    
}
