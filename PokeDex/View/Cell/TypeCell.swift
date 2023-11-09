//
//  TypeCell.swift
//  PokemonAPI
//
//  Created by Kadirhan Keles on 3.11.2023.
//

import UIKit

class TypeCell: UICollectionViewCell {
    
    static let identifier = "typeCell"
    
    lazy var typeView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var pokemonNameLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
       return label
   }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(typeView)
        typeView.addSubview(pokemonNameLabel)
        
        NSLayoutConstraint.activate([
            typeView.topAnchor.constraint(equalTo: topAnchor),
            typeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            typeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            typeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: topAnchor),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}

