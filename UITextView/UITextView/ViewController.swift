//
//  ViewController.swift
//  UITextView
//
//  Created by Николай Прощалыкин on 23.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTV: UITextView!
    
    let toTopButton = UIButton()
    var mode = Mode.edit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTF.borderStyle = .none
        
        titleTF.layer.borderWidth = 1
        titleTF.layer.cornerRadius = 10
        titleTF.layer.borderColor = UIColor.gray.cgColor
        
        descriptionTV.delegate = self
        descriptionTV.layer.borderWidth = 1
        descriptionTV.layer.cornerRadius = 10
        descriptionTV.layer.borderColor = UIColor.gray.cgColor
        
        descriptionTV.dataDetectorTypes = [.link, .phoneNumber]
        
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.green
        shadow.shadowBlurRadius = 15
        
        descriptionTV.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.shadow: shadow
        ]
        
        descriptionTV.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //descriptionTV.allowsEditingTextAttributes = true
        
        view.addSubview(toTopButton)
        toTopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toTopButton.topAnchor.constraint(equalTo: descriptionTV.bottomAnchor,constant: 20),
            toTopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            toTopButton.heightAnchor.constraint(equalToConstant: 20),
            toTopButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        toTopButton.setTitle("to top", for: .normal)
        toTopButton.setTitleColor(.blue, for: .normal)
        toTopButton.addTarget(self, action: #selector(toTop), for: .touchUpInside)
        
        
        descriptionTV.keyboardDismissMode = .onDrag //если скролить то будет пропадать клавиатура
    }

    @objc func toTop(){
        descriptionTV.scrollRangeToVisible(NSRange(location: 0, length: 0))
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        mode.togle()
        let buttonTitle = mode == .preview ? "Edit" : "Preview"
        let toValue: CGFloat = mode == .preview ? 0 : 1
        
        UIView.animate(withDuration: 1) {
            sender.setTitle(buttonTitle, for: .normal)
        }
        
        titleTF.animateBorderWidth(toValue: toValue, duration: 0.5)
        descriptionTV.animateBorderWidth(toValue: toValue, duration: 0.5)
        descriptionTV.isEditable = mode == .edit
        
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch mode {
        case .edit: return true
        default: return false
        }
    }
    
}


extension ViewController: UITextViewDelegate {
    //чтобы нельзя было редактировать пост если находится в состоянии Edit
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        switch mode {
        case .edit: return true
        default: return false
        }

    }
    //чтобы нельзя было тыкнуть на ссылку
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
}

// создание анимации
extension UIView {
    func animateBorderWidth(toValue: CGFloat, duration: Double) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "borderWidth") //что будет анимироваться
        animation.fromValue = layer.borderWidth //от какого значения
        animation.toValue = toValue // до какого значения
        animation.duration = duration //длительность анимации
        layer.add(animation, forKey: "Width") // добавление анимации на лейер
        layer.borderWidth = toValue // фиксирование анимации
    }
}

enum Mode {
    case preview
    case edit
    
    mutating func togle(){
        switch self {
        case .preview: self = .edit
        case .edit: self = .preview
        }
    }
}
