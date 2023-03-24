//
//  ViewController.swift
//  UIPageControl
//
//  Created by Николай Прощалыкин on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    let scrollview = UIScrollView()
    let pageControl = UIPageControl()
    
    let strings = ["one", "two", "three"]
    // let strings = ["one"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateScrollView()
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            pageControl.topAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pageControl.numberOfPages = strings.count
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        
        pageControl.hidesForSinglePage = false // true - если 1 страница только, то pageControl не будет отображаться
        
        pageControl.backgroundStyle = .prominent
        
        pageControl.allowsContinuousInteraction = false // взаимодействие с контроллом, в плане зажать и вращать хз надо видеть
        
        print(pageControl.interactionState) // какое-то get свойство
        
        //pageControl.preferredIndicatorImage = UIImage(systemName: "paperplane") // изменить начальные кружочки
        
        pageControl.setIndicatorImage(UIImage(systemName: "paperplane"), forPage: 0)
        pageControl.indicatorImage(forPage: 0)
        
        pageControl.addTarget(self, action: #selector(pageDidChanged(sender:)), for: .valueChanged)
        
        scrollview.delegate = self
    }

    @objc func pageDidChanged(sender: UIPageControl) {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        scrollview.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
    
    
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollview.contentOffset.x / UIScreen.main.bounds.width)
    }
}

extension ViewController {
    func configurateScrollView() {
        
        view.addSubview(scrollview)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollview.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        scrollview.backgroundColor = .systemGray
        scrollview.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * strings.count, height: 200)
        scrollview.isPagingEnabled = true //автоматически доскроливать
        
        addLabel(title: strings[0],position: 0)
        addLabel(title: strings[1],position: 1)
        addLabel(title: strings[2],position: 2)
    }
    
    func addLabel(title: String, position: CGFloat) {
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        
        scrollview.addSubview(label)
        let screenWidth = UIScreen.main.bounds.width
        label.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 200)
    }
}
