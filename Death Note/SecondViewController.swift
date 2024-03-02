import UIKit
import CoreData

class SecondViewController: UIViewController, UITextFieldDelegate , UITextViewDelegate{
    
    
    /// VARS------------------
    var note = UITextView()                                                                // Oluşturulan değişkenler
    let baslikLabel2 = UILabel()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        
        /// LABEL SETTİNGS-------
        baslikLabel2.text = "RULES"
        baslikLabel2.textColor = .darkGray
        self.view.addSubview(baslikLabel2)
        baslikLabel2.frame = CGRect(x: 0 , y: 0, width: 70, height: 50)
        baslikLabel2.center = CGPoint(x: view.frame.size.width / 2, y: 100)
        
        
        /// TEXTFİELD SETTİNGS---
        note.text = "WHO WİLL KİLL BE"
        note.textContainerInset = UIEdgeInsets(top: 8, left: 50, bottom: 8, right: 8)
        note.textColor = UIColor.lightGray
        note.backgroundColor = .white
        note.font = UIFont(name: "Helvetica", size: 15)
        note.layer.cornerRadius = 20
        note.layer.borderWidth = 1.0
        note.layer.borderColor = UIColor.systemRed.cgColor                                  // cgColor düşük seviye apiler içindir.
        note.layer.shadowRadius = 10
        note.layer.shadowColor = UIColor.black.cgColor
        self.view.addSubview(note)
        note.translatesAutoresizingMaskIntoConstraints = false
        
        
        /// Button Settings------
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        saveButton.tintColor = UIColor.red
        saveButton.layer.borderWidth = 2
        saveButton.layer.cornerRadius = 10
        saveButton.translatesAutoresizingMaskIntoConstraints = false                        // Düzgün çalışması için yapılan bir method
        self.view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 650),  // güvenli düzen oluşturma adına safeAreaLayoutGuide
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        
        /*
          BU KISIM TEXTFİEL İÇİN YAZILDI
         let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))      // Padding oluşturup ona view yani bir görünüm veriyoruz.
         note.leftView = leftPaddingView                                                     // Oluşturduğumuz padding için konumu sol tarafa çekiyoruz.
         note.leftViewMode = .always                                                         // Görünümün hep orda oluşması
         */
    
        
    
        NSLayoutConstraint.activate([
            note.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            note.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            note.widthAnchor.constraint(equalToConstant: 300),
            note.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        note.delegate = self
        
    }
    
    
    
    // Büyüme animasyon ekleniyor.
    func textViewDidBeginEditing(_ textView: UITextView){
        if note.textColor == UIColor.lightGray {
            note.text = nil
            note.textColor = UIColor.black
        }
        UIView.animate(withDuration: 1.2, animations: {
            textView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
    }
    
    // Düzenleme modundan çıkıldığında animasyonu geri al
    func textViewDidEndEditing(_ textView : UITextView) {
        if note.text.isEmpty {
            note.text = "WHO WİLL KİLL BE"
            note.textColor = UIColor.lightGray
        }
           UIView.animate(withDuration: 1.0, animations: {
               textView.transform = CGAffineTransform.identity    // Normal boyua geri dönüş.
           })
       }
    
   }
