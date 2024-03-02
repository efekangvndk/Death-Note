//
//  secViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 9.02.2024.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
       
    
    /// VARS------------------
    var note = UITextField()                                                                //oluşturulan değişkenler
    let baslikLabel2 = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray5
        
        /// LABEL SETTİNGS-------
        baslikLabel2.text = "RULES"
        
        
        /// TEXTFİELD SETTİNGS---
        note.backgroundColor = .white
        note.font = UIFont(name: "Helvetica", size: 15)
        note.layer.cornerRadius = 20
        note.layer
        
            NSLayoutConstraint.activate([
                
                ])
        
        /// ADD TO VİEW-----------
        self.view.addSubview(note)
    }
    
    
    func textFieldDidBeginEditing(_ textField : UITextField){
        UIView.animate(withDuration: 1.0){
            self.note.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1.0){
            self.note.transform = CGAffineTransform.identity
        }
    }
   
}
