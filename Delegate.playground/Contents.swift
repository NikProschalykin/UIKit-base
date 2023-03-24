import UIKit

protocol BossDelegate {
    
    func coffee()
    
}

    class Boss {
        
        var delegate: BossDelegate?
        
        func wantCofee(){
            delegate?.coffee()
        }
    }

class Helper:BossDelegate {
    func coffee() {
        print("bring cofee")
    }
}

let boss = Boss()
let helper = Helper()

boss.delegate = helper

boss.wantCofee()
