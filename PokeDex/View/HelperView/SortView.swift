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
    
    private var whiteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.whiteColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    let sortLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppTexts.sortTitleText
        label.textColor = AppColors.whiteColor
        label.font = AppFonts.regulerBoldFont
        label.textAlignment = .center
        return label
    }()
    
    let numberSortedRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(AppTexts.numberSortText, for: .normal)
        button.setTitleColor(AppColors.blackColor, for: .normal)
        button.titleLabel?.font = AppFonts.placeholderFont
        button.setImage(AppIcons.radioButtonCheched, for: .normal)
        button.addTarget(self, action: #selector(sortAccordingToTheNumber), for: .touchUpInside)
        return button
    }()
    let nameSortRadioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(AppColors.blackColor, for: .normal)
        button.setTitle(AppTexts.nameSortText, for: .normal)
        button.titleLabel?.font = AppFonts.placeholderFont
        button.setImage(AppIcons.radioButtonUncheched, for: .normal)
        button.addTarget(self, action: #selector(sortAccordingToTheName), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = AppColors.appRedColor
        self.layer.cornerRadius = 10
        
        whiteView.addSubviews([numberSortedRadioButton,nameSortRadioButton])
        
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
            
            nameSortRadioButton.topAnchor.constraint(equalTo: self.whiteView.topAnchor , constant: 20),
            nameSortRadioButton.leftAnchor.constraint(equalTo: self.whiteView.leftAnchor, constant: -14),
            nameSortRadioButton.rightAnchor.constraint(equalTo: self.whiteView.rightAnchor,constant: 5),
            
            numberSortedRadioButton.topAnchor.constraint(equalTo: self.nameSortRadioButton.bottomAnchor,constant: 15),
            numberSortedRadioButton.leftAnchor.constraint(equalTo: self.whiteView.leftAnchor),
            numberSortedRadioButton.rightAnchor.constraint(equalTo: self.whiteView.rightAnchor,constant: 5)
            
        ])
    }
    
    
    
    
    @objc
    func sortAccordingToTheNumber(){
        numberSortedRadioButton.setImage(AppIcons.radioButtonCheched, for: .normal)
        nameSortRadioButton.setImage(AppIcons.radioButtonUncheched, for: .normal)
        mainController?.sortTypeChanged(newType: .number)
    }
    
    @objc
    func sortAccordingToTheName(){
        numberSortedRadioButton.setImage(AppIcons.radioButtonUncheched, for: .normal)
        nameSortRadioButton.setImage(AppIcons.radioButtonCheched, for: .normal)
        mainController?.sortTypeChanged(newType: .name)
    }
}

enum SortTypes {
    case name
    case number
}
