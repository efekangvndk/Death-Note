//
//  HomeView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit
import SwiftUI

class HomeView: UIView , UITabBarDelegate{
    
    var nots = [String]()
    
    var tableView = UITableView()
    let title = UIComponentsHelper.createCustomLabel(text: "The Note", size: 10 , labelBackGroundColor: .red , textColor: .white, fontName: "The-Valentine", cornerRadius: 10 , borderWidth: 2, borderColor: UIColor.yellow.cgColor, addshadow: false)
    var addbutton = UIComponentsHelper.creatCustomButton(ButtonName: "Take a note", tintColor: .white , image: nil , cornerRadius: 5, borderWidth: 2, borderColor: UIColor.yellow.cgColor , backgroundColor: .red, addshadow: true, fontName: "Themundayfreeversion-Regular")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView2()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView2()  {
        addSubview(title)
        addSubview(addbutton)
        addSubview(tableView)
        constraintSettings()
        tableView.layer.borderWidth = 2
        tableView.layer.cornerRadius = 20
        tableView.layer.borderColor = UIColor.yellow.cgColor
        backgroundColor = .darkGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func constraintSettings() {
        
        // title constrainst
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 110),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.widthAnchor.constraint(equalToConstant: 120),
            title.heightAnchor.constraint(equalToConstant: 50)
        ])
        // tableView constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            tableView.leftAnchor.constraint(equalTo: leftAnchor,constant: 0),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])
        // addbutton constraints
        NSLayoutConstraint.activate([
            addbutton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            addbutton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addbutton.widthAnchor.constraint(equalToConstant: 120),
            addbutton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
#Preview(body: {
    HomeView()
})
