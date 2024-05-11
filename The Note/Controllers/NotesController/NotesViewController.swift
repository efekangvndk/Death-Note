import UIKit
import CoreData

class NotesViewController: UIViewController {
    
    private var notesView = NotesView()
    var chooesingNotes = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        if !chooesingNotes.isEmpty {
            getData()
        }
    }
    
    @objc func getData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("AppDelegate bulunamadı.")
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Nots")
        fetchRequest.predicate = NSPredicate(format: "title = %@ OR nots = %@", chooesingNotes, chooesingNotes)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try managedContext.fetch(fetchRequest)
            if let result = results.first as? NSManagedObject {
                if let title = result.value(forKey: "title") as? String {
                    notesView.noteTextField.text = title
                }
                if let nots = result.value(forKey: "nots") as? String {
                    notesView.noteTextView.text = nots
                }
            } else {
                print("Kayıt bulunamadı.")
            }
        } catch {
            print("Veri getirme hatası: \(error)")
        }
    }

    
    func setupController() {
        notesView = NotesView(frame: view.bounds)
        notesView.saveButton.addTarget(self, action: #selector(didTapButtonForSave), for: .touchUpInside)
        self.view.addSubview(notesView)
    }
    
    @objc func didTapButtonForSave() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Nots", in: managedContext) {
            let note = NSManagedObject(entity: entity, insertInto: managedContext)
            note.setValue(notesView.noteTextField.text, forKey: "title")
            note.setValue(notesView.noteTextView.text, forKey: "nots")

            do {
                try managedContext.save()
                print("Kayıt başarılı.")
            } catch let error as NSError {
                print("Kayıt hatası: \(error), \(error.userInfo)")
            }
        } else {
            print("Entity bulunamadı.")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("NewDataSaved"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
