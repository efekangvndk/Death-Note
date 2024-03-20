//
//  ViewController.swift
//  Death Note
//
//  Created by Efekan Güvendik on 6.02.2024.

///Buton işlevi diğer sayfa, coredata ya safe ve collections view .

import UIKit
import CoreData
import SwiftUI

class HomeViewController: UIViewController {
    
    private var homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView = HomeView(frame: view.bounds)
        view.addSubview(homeView)

        
        /// OTHERS SETTİNGS--------
//        let setImage = UIImage.SymbolConfiguration(pointSize: 40,weight: .medium)
//        let addImage = UIImage(systemName: "plus.app", withConfiguration: setImage)
//        addButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        addButton.center = CGPoint(x: 385, y: 800)
//        addButton.setImage(addImage, for: .normal)
//        addButton.tintColor = .systemGray4
//        addButton.addTarget(self, action: #selector(didTapButton) , for: .touchUpInside) //Self: kendisine işlem atandı actions #selector: Target yapımında @object func'dan tanım için kullanırız.
//        
        title = "Home"                                                                   //NavigationsController'ın button adı. 
        navigationController?.navigationBar.tintColor = .systemRed                     //Burda navigationContoller'ın oluşturduğu butonun rengini değiştirdi.
        
//        self.view.addSubview(addButton)
        
    }
     
    
    @objc func didTapButton() {
        let secVC = SecondViewController()                                               //Burda #selector için çağırlması gereken func'ı oluşturduk.
        navigationController?.pushViewController(secVC, animated: true)                  //navigationController : Bu terim pageler arası kontrol için gerekli üst button olumunu yapar.
                                                                                         //pushViewController : BU ifade adından da anlaşılacağı gibi diğer sdpsayfaya atmaya sebep olan kod dizimidir.
       
    }
    
}

#Preview(body: {
    HomeViewController()
})

