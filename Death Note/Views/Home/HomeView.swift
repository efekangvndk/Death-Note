//
//  HomeView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit

class HomeView: UIView {
    
    let title = UIComponentsHelper.createCustomLabel(text: "The Note", size: 50 , labelBackGroundColor: .red , textColor: .white, fontName: "The Valentine", cornerRadius: 10 , borderWidth: 2, borderColor: UIColor.yellow.cgColor)
    let addbutton = UIComponentsHelper.creatCustomButton(ButtonName: "Take a note", tintColor: .red , image: , cornerRadius: 20, borderWidth: <#T##CGFloat#>, borderColor: <#T##CGColor#>, backgroundColor: <#T##UIColor#>)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView()  {
        addSubview(title)
        addSubview(addbutton)
        constraintSettings()
        backgroundColor = .darkGray
        
    }
    
    private func constraintSettings() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            title.widthAnchor.constraint(equalToConstant: 120),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    
    
    
    
    
}
