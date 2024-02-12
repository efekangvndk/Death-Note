//
//  secViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 9.02.2024.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
       
    
    /// VARS------------------
    var note = UITextField()
    let baslikLabel2 = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        
        /// LABEL SETTİNGS-------
        baslikLabel2.text = "RULES"
        
        
        /// TEXTFİELD SETTİNGS---
        note.backgroundColor = .white
        note.font = UIFont(name: "Helvetica", size: 15)
        note.leftViewMode = .always
        note.frame = CGRect(x: 0, y: 0, width: 300 , height: 35)
        note.center = CGPoint(x: view.frame.width / 2, y: 150)
        note.layer.cornerRadius = 20
        note.layer.borderWidth = 1.0
        note.layer.borderColor = UIColor.systemRed.cgColor
        note.layer.shadowColor = UIColor.black.cgColor
        note.layer.shadowOpacity = 2.99
        note.layer.shadowOffset = CGSize(width: 1, height: 2)
        note.layer.shadowRadius = 10
        note.delegate = self
    
        
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
