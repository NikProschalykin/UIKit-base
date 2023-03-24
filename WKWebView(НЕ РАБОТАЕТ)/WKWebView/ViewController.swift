//
//  ViewController.swift
//  WKWebView
//
//  Created by Николай Прощалыкин on 04.03.2023.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
        
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        //loadRequest()
        loadPDF()
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.google.com") else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    private func loadPDF() {
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "pdf") else { return }
        
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}

