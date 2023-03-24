//
//  ViewController.swift
//  UIStepper
//
//  Created by Николай Прощалыкин on 22.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel = UILabel()
    var segmentedControl = UISegmentedControl(items: ["32см","48см","52см"])
    var itemImageView = UIImageView()
    var descriptionLabel = UILabel()
    var stepper = UIStepper()
    var sendButton = UIButton()
    
    var itemDescription = "Пицца Пеперони 32см в количестве - 1шт."{
        didSet{
            descriptionLabel.text = itemDescription
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(segmentedControl)
        view.addSubview(itemImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(stepper)
        view.addSubview(sendButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            
            itemImageView.widthAnchor.constraint(equalToConstant: 300),
            itemImageView.heightAnchor.constraint(equalToConstant: 300),
            itemImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            segmentedControl.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 200),
            
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            stepper.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor),
            
            sendButton.heightAnchor.constraint(equalToConstant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 100),
            sendButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 16),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
        
        titleLabel.text = "Пеперони"
        titleLabel.font = UIFont.systemFont(ofSize: 33)
        titleLabel.textAlignment = .center
        
        
        itemImageView.layer.cornerRadius = 15
        itemImageView.clipsToBounds = true // чтобы картинка не выходила за границы
        itemImageView.contentMode = .scaleAspectFill // чтобы картинка растягивалась
        itemImageView.image = UIImage(named: "pizza")
        
        segmentedControl.selectedSegmentIndex = 0 // 1 index
        segmentedControl.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0 //неограниченность строк внутри себя
        descriptionLabel.text = itemDescription
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 1
        stepper.addTarget(self, action: #selector(stepperAction(sender: )), for: .valueChanged)
        
        sendButton.setTitle("Добавить", for: .normal)
        sendButton.setTitleColor(.black, for: .normal)
        sendButton.setTitleColor(.darkGray, for: .highlighted) //для нажатой кнопки
        sendButton.layer.cornerRadius = 10
        sendButton.backgroundColor = UIColor(red: 220/252, green: 220/252, blue: 220/252, alpha: 0.9) //еще вариант ввода цвета
        sendButton.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
    }

    @objc func segmentAction(sender: UISegmentedControl){
        itemDescription = "Пицца Пеперони \(sender.titleForSegment(at: segmentedControl.selectedSegmentIndex)!) в количестве - \(stepper.value)шт."
    }
    
    @objc func stepperAction(sender: UIStepper){
        itemDescription = "Пицца Пеперони \(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!) в количестве - \(sender.value)шт."
    }
    
    @objc func sendAction(){
        print("Добавлено")
    }
}

