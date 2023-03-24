//
//  ViewController.swift
//  UIActivityIndicatorView
//
//  Created by Николай Прощалыкин on 03.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var activityIndicatorView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
       // activityIndicatorView.style = .large
        activityIndicatorView.color = .green
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.activityIndicatorView.stopAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.activityIndicatorView.startAnimating()
            }
        }
    }

}

