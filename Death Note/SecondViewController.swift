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
        baslikLabel2.textColor = .black
        self.view.addSubview(baslikLabel2)
        baslikLabel2.frame = CGRect(x: 0 , y: 0, width: 70, height: 50)
        baslikLabel2.center = CGPoint(x: view.frame.size.width / 2, y: 100)
        
        
        /// TEXTFİELD SETTİNGS---
        note.text = "WHO WİLL KİLL BE"
        note.textContainerInset = UIEdgeInsets(top: 8, left: 50, bottom: 8, right: 8)
        note.textColor = UIColor.systemGray5
        note.backgroundColor = .systemGray5
        note.font = UIFont(name: "Helvetica", size: 15)
        note.layer.cornerRadius = 20
        note.layer.borderWidth = 1.0
        note.layer.borderColor = UIColor.systemRed.cgColor                                  // cgColor düşük seviye apiler içindir.
        note.layer.shadowRadius = 10
        note.layer.shadowColor = UIColor.black.cgColor
        self.view.addSubview(note)
        note.translatesAutoresizingMaskIntoConstraints = false
        note.delegate = self
        
        NSLayoutConstraint.activate([
            note.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            note.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            note.widthAnchor.constraint(equalToConstant: 300),
            note.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
        
        
        /// Button Settings------
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        saveButton.tintColor = UIColor.red
        saveButton.layer.borderWidth = 2
        saveButton.layer.cornerRadius = 10
        saveButton.translatesAutoresizingMaskIntoConstraints = false                        // Düzgün çalışması için yapılan bir method
        self.view.addSubview(saveButton)
        saveButton.addTarget(self, action: didTapButton, for: touchUpInside)
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
        
        
    }
    
    // Büyüme animasyon ekleniyor.
    func textViewDidBeginEditing(_ textView: UITextView){
        if note.textColor == UIColor.systemGray5 {
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
            note.textColor = UIColor.systemGray5
        }
        UIView.animate(withDuration: 1.0, animations: {
            textView.transform = CGAffineTransform.identity    // Normal boyua geri dönüş.
        })
    }
    
    @objc func didTabButton(){
        guard let text = note.text , !text.isEmpty else {  // Gurad let ile çözümleme işlemi olmassa kod bloğunu terk etmesi adına oluşturduk.
            return // Return ise işlem olmassa yani metin boş ise işlem sona ersin diye kullanıldı.
        }
        
        // Metni CoreData ya kaydetme fonksiyonu
        saveTextToCoreData(text:text)
        
    }
    
    
    func saveTextToCoreData(text : String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
        }
        let managedContext = appDelegate.persistentContainer.viewContext            // CoreData için kullanılması gereken persistentContainer yönetmeliği sağlar.
        let entity = NSEntityDescription.entity(forEntityName: "saves", in: managedContext)!
        let record = NSManagedObject(entity: entity, insertInto: managedContext)
        record.setValue(text, forKeyPath: "saves")
    }
    // Do try Catch yapılcak galiba...
    
}
