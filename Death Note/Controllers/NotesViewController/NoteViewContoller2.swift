import UIKit
import CoreData
import SwiftUI


class NoteViewController2: UICollectionViewController {
    
    //MARK: Variable
    var note = UITextView()
    let baslikLabel2 = UILabel()
    let cellId = "cellId"
    var noteView = NotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    func setupController() {
        noteView = NotesView(frame: view.bounds)
        self.view.addSubview(noteView)
        collectionView.register(NoteViewController2.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .blue
            return cell
        default:
            fatalError()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
}

