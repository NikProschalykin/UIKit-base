//
//  TwoPushViewController.swift
//  UINavigationController
//
//  Created by Николай Прощалыкин on 10.03.2023.
//

import Foundation
import UIKit

class TwoPushViewController: UIViewController {
    
    let pushButton = UIButton()
    let popToRootButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        title = "TwoPushViewController"
        
        configurePopButton()
        
    }
    
}

extension TwoPushViewController {
    func configurePopButton() {
        popToRootButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popToRootButton)
        NSLayoutConstraint.activate([
        
            popToRootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popToRootButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 40),
            popToRootButton.widthAnchor.constraint(equalToConstant: 200),
            popToRootButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        popToRootButton.makeMePopToRootButton()
        popToRootButton.addTarget(self, action: #selector(popToRootButtonAction), for: .touchUpInside)
        
        
    }
    
    @objc func popToRootButtonAction() {
//        let controller = PresentedViewController()
//        present(controller,animated: true)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
