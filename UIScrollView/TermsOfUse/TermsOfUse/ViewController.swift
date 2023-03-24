//
//  ViewController.swift
//  TermsOfUse
//
//  Created by Николай Прощалыкин on 24.02.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView = UIScrollView()
    var label = UILabel()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.addSubview(label)
        view.addSubview(button)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            label.topAnchor.constraint(equalTo: scrollView.topAnchor),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -16)
        ])
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Содержание сайта (далее – Содержание) - охраняемые результаты интеллектуальной деятельности, включая тексты литературных произведений, их названия, предисловия, аннотации, статьи, иллюстрации, обложки, музыкальные произведения с текстом или без текста, графические, текстовые, фотографические, производные, составные и иные про"
        
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
        button.setTitle("ok", for: .normal)
        
        
        scrollView.delegate = self
       // scrollView.scrollsToTop = false
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scroll to top")
    }

}

