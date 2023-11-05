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
    
    init(viewModel : HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updatePokemonList(pokemonList: [PokemonDto]) {
        pokemons = pokemonList
        DispatchQueue.main.async {
            self.pokemonsCollectionView.reloadData()
        }
    }
    
    lazy var searchPokemonBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: AppTexts.searchBarPlaceholderText,attributes: [
            .font : UIFont.systemFont(ofSize: 15),
            .foregroundColor : AppColors.placeHolderColor ?? UIColor.darkGray
        ])
        searchBar.searchTextField.layer.cornerRadius = 16
        searchBar.searchTextField.layer.masksToBounds = true
        let searchIcon = searchBar.searchTextField.leftView as! UIImageView
        searchIcon.tintColor = AppColors.appRedColor
        searchBar.searchTextField.leftView = searchIcon
        return searchBar
    }()
    
    var pokemonsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.deviceWidth * 0.25, height: AppConstants.deviceHeight * 0.15)
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    var whiteView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
    
    lazy var sortButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "#",attributes: [
            .foregroundColor : UIColor.red,
            .font : UIFont.systemFont(ofSize: 16)
        ]), for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(sortButtonPressed), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfig()
        view.backgroundColor = UIColor(hex: "#DC0A2D", alpha: 1)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
}



