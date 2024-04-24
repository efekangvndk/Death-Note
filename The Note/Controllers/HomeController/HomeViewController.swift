import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var homeControllerView: HomeView!
    var titleNoteView: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeControllerView = HomeView(frame: view.bounds)
        view.addSubview(homeControllerView)
        setupController()
        getData()
    }
    
    private func setupController() {
        title = "Home"
        navigationController?.navigationBar.tintColor = .systemRed
        homeControllerView.addbutton.addTarget(self, action: #selector(addButtonDown), for: .touchDown)
        homeControllerView.addbutton.addTarget(self, action: #selector(addButtonUp), for: [.touchUpInside , .touchUpOutside])
        homeControllerView.tableView.delegate = self
        homeControllerView.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
     // MARK: Save işlemleri. Ve veri çekme ile animasyon.
    @objc func getData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print("Error: Couldn't get AppDelegate")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Nots")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            titleNoteView = results as! [NSManagedObject]
            homeControllerView.tableView.reloadData()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNoteView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let note = titleNoteView[indexPath.row]
        cell.textLabel?.text = note.value(forKey: "title") as? String

        // Hücreye buton eklemek
        let editButton = UIButton(type: .system)
        editButton.setTitle("+", for: .normal)
        editButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        editButton.setTitleColor(UIColor.blue, for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
        editButton.frame = CGRect(x: cell.frame.width - 10, y: 5, width: 60, height: 34)
        cell.contentView.addSubview(editButton)

        return cell
    }

    
    @objc func editButtonTapped(_ sender: UIButton) {
        let edithVC = EdithViewController()
        navigationController?.pushViewController(edithVC, animated: true)
        print("edit button Tapped")
    }
    
    @objc func addButtonDown() {
        UIView.animate(withDuration: 0.2) {
            self.homeControllerView.addbutton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        homeControllerView.addbutton.alpha = 0.5
        homeControllerView.addbutton.backgroundColor = .black
    }
    
    @objc func addButtonUp() {
        UIView.animate(withDuration: 0.2) {
            self.homeControllerView.addbutton.transform = CGAffineTransform.identity
        }
        homeControllerView.addbutton.alpha = 1.0
        homeControllerView.addbutton.backgroundColor = .red
        let VC = NotesViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    // MARK: Silme işlemleri.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{ // kaydırarak silme işlemi. y
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let objectToDelete = titleNoteView[indexPath.row]
           
            do{
                context?.delete(objectToDelete)
                try context?.save()
                titleNoteView.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }catch{
                print("Error deleting item : \(error)")
            }
        }
    }
}


// MARK:  edith screen yapılacak ve özellikler düzenlenecek...

