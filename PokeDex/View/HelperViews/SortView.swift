//
//  SortView.swift
//  PokemonAPI
//
//  Created by Mehmet Emin Ak on 3.11.2023.
//

import UIKit


protocol SortViewProtocol : AnyObject {
    func sortTypeChanged(newType : SortTypes)
}

class SortView: UIView {
    
    
    weak var mainController : SortViewProtocol?
    
    private var sortLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.attributedText = NSAttributedString(string: "Sort By:",attributes: [
            .foregroundColor : UIColor.white,
            .font : UIFont.systemFont(ofSize: 16,weight: .bold)
        ])
        return label
    }()
    
    private var whiteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var alphabeticalSortButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Name",attributes: [
            .foregroundColor : UIColor(hex: "#DC0A2D", alpha: 1)!,
        ]), for: .normal)
        
        button.addTarget(self, action: #selector(sortAccordingToTheName), for: .touchUpInside)
        return button
    }()
    
    private lazy var idSortButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Number",attributes: [
            .foregroundColor : UIColor(hex: "#DC0A2D", alpha: 1)!]), for: .normal)
        button.addTarget(self, action: #selector(sortAccordingToTheNumber), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "#DC0A2D", alpha: 1)
        self.layer.cornerRadius = 10
        
        whiteView.addSubviews([alphabeticalSortButton,idSortButton])
        self.addSubviews([whiteView,sortLabel])
        setConstraints()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: self.topAnchor,constant: 50),
            whiteView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            whiteView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            sortLabel.topAnchor.constraint(equalTo: self.topAnchor , constant: 15),
            sortLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            sortLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            alphabeticalSortButton.topAnchor.constraint(equalTo: whiteView.topAnchor , constant: 15),
            alphabeticalSortButton.leftAnchor.constraint(equalTo: whiteView.leftAnchor),
            alphabeticalSortButton.rightAnchor.constraint(equalTo: whiteView.rightAnchor,constant: 5),
            
            idSortButton.topAnchor.constraint(equalTo: alphabeticalSortButton.bottomAnchor,constant: 5),
            idSortButton.leftAnchor.constraint(equalTo: alphabeticalSortButton.leftAnchor),
            idSortButton.rightAnchor.constraint(equalTo: alphabeticalSortButton.rightAnchor)
            
        ])
    }

    
    @objc
    func sortAccordingToTheNumber(){
        mainController?.sortTypeChanged(newType: .number)
    }
    
    @objc
    func sortAccordingToTheName(){
        mainController?.sortTypeChanged(newType: .name)
    }
}

enum SortTypes {
    case name
    case number
}
