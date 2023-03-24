//
//  ViewController.swift
//  UIProgressView
//
//  Created by Николай Прощалыкин on 03.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let progressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: 300, height: 10))
    let progress = Progress(totalUnitCount: 11)
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.addSubview(progressView)
        progressView.center = view.center
        progressView.progress = 0.1
        progressView.progressTintColor = .red
        progressView.trackTintColor = .green
        
        progressView.observedProgress = progress
        
        progress.cancellationHandler = {
            print("progress was stopped")
        }
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //sleep(2)
        //progressView.progress = 1
        //progressView.setProgress(1, animated: true)
        var count: Int64 = 0
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            
            if self.progress.isCancelled {
                timer.invalidate()
            }
            
            if self.progress.fractionCompleted == 1 {
                self.progress.cancel()
            }
            
            self.progress.completedUnitCount = count
            count += 1
        }
    }

}

