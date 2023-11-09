//
//  ViewController.swift
//  PokemonAPI
//
//  Created by Mehmet Emin Ak on 3.11.2023.
//

import UIKit

class HomeViewController: UIViewController, HomeViewModelDelegate  {
    
    
    let viewModel : HomeViewModel
    
    var pokemons : [PokemonDto] = []
    
    var lastRequestTime: Date?
    
    lazy var searchPokemonBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = AppColors.whiteColor
        searchBar.delegate = self

        let searchIconImageView = UIImageView(image: AppIcons.searchBarSearchIcon)
        searchBar.searchTextField.leftView = searchIconImageView

        if let clearButton = searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
            let templateImage = AppIcons.searchBarClearIcon
            clearButton.setImage(templateImage, for: .normal)
        }

        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: AppFonts.placeholderFont ?? UIFont.systemFont(ofSize: 15),
            .foregroundColor: AppColors.placeHolderColor ?? UIColor.darkGray
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: AppTexts.searchBarPlaceholderText, attributes: placeholderAttributes)
        searchBar.searchTextField.layer.cornerRadius = 16
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.searchTextField.autocapitalizationType = .none


        return searchBar

    }()
    
    lazy var pokemonsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.27, height: AppConstants.deviceHeight * 0.15)
        layout.minimumInteritemSpacing = 10

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white

        return collectionView
    }()
    
    
    let whiteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.whiteColor
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.gray.cgColor
        return view
    }()
    
    lazy var sortView : SortView = {
        let view = SortView()
        view.mainController = self
        view.isHidden = true
        view.layer.zPosition = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sortButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.backgroundColor = AppColors.whiteColor

        button.layer.cornerRadius = 20

        let image = AppIcons.numberSortIcon
        button.setImage(image, for: .normal)

        button.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)

        return button
    }()
    
    init(viewModel : HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfig()
        view.backgroundColor = AppColors.appRedColor
    }
    
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
    func updatePokemonList(pokemonList: [PokemonDto]) {
        pokemons = pokemonList
        DispatchQueue.main.async {
            self.pokemonsCollectionView.reloadData()
        }
    }
    
}



