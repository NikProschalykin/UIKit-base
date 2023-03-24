//
//  OnePushViewController.swift
//  UINavigationController
//
//  Created by Николай Прощалыкин on 10.03.2023.
//

import Foundation
import UIKit

class OnePushViewController: UIViewController {
    
    let pushButton = UIButton()
    let popButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        title = "OnePushViewController"
        
        configurePushButton()
        configurePopButton()
    }
    
}

extension OnePushViewController {
    func configurePushButton() {
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pushButton)
        NSLayoutConstraint.activate([
        
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -40),
            pushButton.widthAnchor.constraint(equalToConstant: 200),
            pushButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        pushButton.makeMePushButton()
        pushButton.addTarget(self, action: #selector(pushButtonAction), for: .touchUpInside)
        
        
    }
    
    @objc func pushButtonAction() {
//        let controller = PresentedViewController()
//        present(controller,animated: true)
        
        let controller = TwoPushViewController()
       navigationController?.pushViewController(controller, animated: true)
       // navigationController?.viewControllers.append(controller)
    }
    
}

extension OnePushViewController {
    func configurePopButton() {
        popButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popButton)
        NSLayoutConstraint.activate([
        
            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 40),
            popButton.widthAnchor.constraint(equalToConstant: 200),
            popButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        popButton.makeMePopButton()
        popButton.addTarget(self, action: #selector(popButtonAction), for: .touchUpInside)
        
        
    }
    
    @objc func popButtonAction() {
//        let controller = PresentedViewController()
//        present(controller,animated: true)
        
        navigationController?.popViewController(animated: true)
        //navigationController?.viewControllers.removeLast()
    }
    
}
