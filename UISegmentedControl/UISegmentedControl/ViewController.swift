//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Николай Прощалыкин on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {

    var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let titles = ["one","two","three"]
        segmentedControl = UISegmentedControl(items: titles)
        
        segmentedControl.insertSegment(withTitle: "four", at: 3, animated: true) //создать
        
        segmentedControl.setTitle("first", forSegmentAt: 0) //задать название
        print(segmentedControl.titleForSegment(at: 0)!) // получить название
        
        segmentedControl.setImage(UIImage(systemName: "circle")!, forSegmentAt: 0)// задать изображение
        segmentedControl.selectedSegmentIndex = 0 //изначально выбранный
        segmentedControl.selectedSegmentTintColor = UIColor.red //цвет выбраного сегмента
        
        //segmentedControl.setWidth(150, forSegmentAt: 1) //задать размер сегмента
        
        segmentedControl.setTitle("SetLongTitleText", forSegmentAt: 1)
        segmentedControl.apportionsSegmentWidthsByContent = true //сегмент подстраиваться под размер сегмента
        
        print(segmentedControl.numberOfSegments) //кол-во сегментов
        
        segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged) //добавление действия при применении сегмента
        
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
                                     segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
                                     segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)])
    }
    

    @objc func segmentAction(sender: UISegmentedControl) {
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)) //получить название сегмента
    }
}

