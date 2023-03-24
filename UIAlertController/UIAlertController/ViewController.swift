//
//  ViewController.swift
//  UIAlertController
//
//  Created by Николай Прощалыкин on 23.02.2023.
//

import UIKit

class ViewController: UIViewController {
    var game = Game()
    var button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        button.center = view.center
        button.backgroundColor = .red
        button.setTitle("Alert", for: .normal)
        button.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }

    @objc func startGame() {
        showAlert()
    }
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Рулетка", message: "Угадай число от 1 до 5", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { textfield in
            textfield.delegate = self
        })
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            print(self.game.isRight(answer: self.game.answer))
        })
        alertController.addAction(okAction)
        
        let canselAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(canselAction)
    
        
        
        present(alertController, animated: true, completion: {
            self.game.generate()
            // print("alert controller is presented")
            
        })
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            game.answer = number
        }
    }
}

class Game {
    var secret: Int
    var answer: Int
    init() {
        secret = 0
        answer = 0
    }
    
    func generate() {
        secret = Int.random(in: 1...5)
    }
    
    func isRight(answer: Int) -> Bool {
        secret == answer
    }
    
}
