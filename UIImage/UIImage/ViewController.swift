//
//  ViewController.swift
//  UIImage
//
//  Created by Николай Прощалыкин on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImageView.layer.cornerRadius = 10
        ImageView.layer.borderWidth = 2
        ImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        //let image = UIImage(named: "2")! // из папки assets
        
        //let image = UIImage(systemName: "sunrise") // из системных символов
        
        //из интернета
        /*
        let imageUrl = URL(string: "https://img.freepik.com/premium-vector/silhouette-pig-vector-icon-pig-vector-icon-white-background_664675-399.jpg?w=2000")!
        let data = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: data)
        */
        
        //множество переключающихся фотографий
        
        //let image = UIImage.animatedImage(with: [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!], duration: 3)
        
        ImageView.animationDuration = 32
        ImageView.animationImages = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!,UIImage(named: "4")!,UIImage(named: "5")!,UIImage(named: "6")!,UIImage(named: "7")!,UIImage(named: "8")!]
        ImageView.startAnimating()
        animation()
        
        func animation() {
            UIView.animate(withDuration: 2, delay: 2, options: [.repeat, .autoreverse, .curveEaseIn], animations: {
                self.ImageView.alpha = 0
            })
        }
        /*
         withDuration - продолжительность анимации
         delay - задержка
         options - доп настройки
         .repeat, .autoreverse, .curveEaseIn - повторение анимации, чтобы в обратную сторону шла анимация, работа анимации(.curveEaseIn)
         animations - что будет анимированно
         */
        
       // ImageView.image = image создание изображения
    }


}

