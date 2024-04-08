import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var homeControllerView: HomeView!
    var titleNoteView: [String] = []
    
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
            titleNoteView = []
            for result in results as! [NSManagedObject] {
                if let not = result.value(forKey: "nots") as? String {
                    titleNoteView.append(not)
                }
            }
            homeControllerView.tableView.reloadData()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNoteView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleNoteView[indexPath.row]
        return cell
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
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Nots")
           
            do{
                let result = try context?.fetch(fetchRequest)
                if let object = result as?[NSManagedObject]{
                    let objectToDelete = object[indexPath.row]
                    context?.delete(objectToDelete)
                    try context?.save()
                    titleNoteView.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }catch{
                print("Error deleting item : \(error)")
            }
        }
    }
}
