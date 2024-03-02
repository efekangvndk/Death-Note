import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
       
    
    /// VARS------------------
    var note = UITextField()                                                                // Oluşturulan değişkenler
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
        note.layer.borderWidth = 1.0
        note.layer.borderColor = UIColor.systemRed.cgColor                                  // cgColor düşük seviye apiler içindir.
        note.layer.shadowRadius = 10
        note.layer.shadowColor = UIColor.black.cgColor
        
        self.view.addSubview(note)                                                          // view'e note'u ekliyoruz
        note.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            note.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            note.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            note.widthAnchor.constraint(equalToConstant: 300),
            note.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    func textFieldDidBeginEditing(_ textField : UITextField){
            // Düzenleme moduna başladığında animasyon uygula
            UIView.animate(withDuration: 1.0){
                self.note.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
        
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            // Düzenleme modundan çıkıldığında animasyonu geri al
            UIView.animate(withDuration: 1.0){
                self.note.transform = CGAffineTransform.identity
            }
        }
    }
