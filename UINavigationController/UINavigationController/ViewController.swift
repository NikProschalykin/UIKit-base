//
//  ViewController.swift
//  UINavigationController
//
//  Created by Николай Прощалыкин on 10.03.2023.
//

import UIKit

class ViewController: UIViewController {

    let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "ViewController"
        configurePushButton()
        
    }


}

extension ViewController {
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
        
        let controller = OnePushViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension UIButton{
    func makeMePushButton() {
        self.setTitle("Push", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .red
    }
    
    func makeMePopButton() {
        self.setTitle("Pop", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .blue
    }
    
    func makeMePopToRootButton() {
        self.setTitle("PopToRoot", for: .normal)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .green
    }
}
