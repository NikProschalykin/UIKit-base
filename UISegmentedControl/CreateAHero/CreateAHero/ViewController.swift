//
//  ViewController.swift
//  CreateAHero
//
//  Created by Николай Прощалыкин on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroImage: UIImageView!
    var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let heroes = ["Warrior","Hunter","Mage"]
        segmentedControl = UISegmentedControl(items: heroes)
        
        heroImage.contentMode = .scaleAspectFill
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 18)!,NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 30)!,NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
        
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: heroImage.bottomAnchor,constant: 16),//вверх
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),//лево
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),//право
            segmentedControl.heightAnchor.constraint(equalToConstant: 50)])//низ
    }

    @objc func segmentedAction(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: 1)
        case 1: changeHero(for: 2)
        case 2: changeHero(for: 3)
        default: break
        }
    }
    
    func changeHero(for index: Int){
        UIView.animate(withDuration: 0.5, animations: {
            self.heroImage.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: {
                self.heroImage.alpha = 1
                self.heroImage.image = UIImage(named: "\(index)")!
            })
        })
    }
}

