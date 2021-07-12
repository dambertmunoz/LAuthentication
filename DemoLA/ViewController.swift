//
//  ViewController.swift
//  DemoLA
//
//  Created by Dambert Munoz on 12/07/21.
//

import UIKit
import LAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LAButtonTouchUp(_ sender: Any) {
        LAuthentication.shared.evaluatePolicy(reason: "Ajam!! Pium pium") { (success) in
            if(success){
                self.showAlert(title: "Success" , message: "You can look some secrets properties")
            }else{
                self.showAlert(title: "Authentication failed" , message: "You could not be verified; please try again.")
            }
        } rejected: { (error) in
            self.showAlert(title: "Biometry unavailable" , message: "Your device is not configured for biometric authentication.")
        }
    }
    

}

extension ViewController{
    
    func showAlert(title:String, message: String){
        
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
    }
}

