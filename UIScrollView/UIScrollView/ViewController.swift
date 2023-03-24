//
//  ViewController.swift
//  UIScrollView
//
//  Created by Николай Прощалыкин on 24.02.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        scrollView.center = view.center
        view.addSubview(scrollView)
        
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = UIColor.black.cgColor
        
        scrollView.contentSize = CGSize(width: 600, height: 600)
        imageView = UIImageView(image: UIImage(systemName: "pencil.circle.fill"))
        scrollView.addSubview(imageView)
        imageView.frame.size = scrollView.contentSize
        
    
       // scrollView.contentOffset = CGPoint(x: 150, y: 150)
        
       // scrollView.contentInset = UIEdgeInsets(top: -150, left: 15, bottom: 15, right: 15)
        
       // scrollView.isDirectionalLockEnabled = true //запрет на скролл во все направления
        
        
        // отключение индикаторов скролла
        // scrollView.showsVerticalScrollIndicator = false
        // scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
    }

    override func viewDidAppear(_ animated: Bool) {
        sleep(1)
        //scrollView.setContentOffset(CGPoint(x: 150, y: 150), animated: true)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}

