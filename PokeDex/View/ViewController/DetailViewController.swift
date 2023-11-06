//
//  DetailViewController.swift
//  PokemonAPI
//
//  Created by Kadirhan Keles on 3.11.2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, DetailViewModelDelegate{
    
    let viewModel : DetailViewModel
    
    var pokemon : PokemonDetailExtensionDto?
    var pokemonId : Int?
    var pokemons : [PokemonDto] = []
    
    var currentPokemonIndex : Int?
    
    var typeCollectionView: UICollectionView?
    var typeArray = [String]()
    
    lazy var pokeIdLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.whiteColor
        label.font =  AppFonts.regulerBoldFont
        return label
    }()
    
    lazy var ballImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppIcons.appLogoLarge
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let endY: CGFloat = 50.0
        
        let animationDuration = 1.5
        
        UIView.animate(withDuration: animationDuration, delay: 0, options: [.autoreverse, .repeat], animations: {
            imageView.frame.origin.y = endY
        }) { (finished) in
            
        }
        
        return imageView
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var aboutLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = AppFonts.regulerBoldFont
        label.text = AppTexts.aboutText
        return label
    }()
    
    lazy var mainHorizantalStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 0
        view.alignment = .center
        return view
    }()
    
    lazy var mainWeightStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 15
        view.alignment = .center
        return view
    }()
    
    lazy var weightStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 10
        view.alignment = .center
        return view
    }()
    
    lazy var weightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppIcons.weightIcon
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var kgLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.blackColor
        label.font = AppFonts.mediumFont
        return label
    }()
    
    lazy var weightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.placeHolderColor
        label.font = AppFonts.smallFont
        label.text = AppTexts.weightText
        return label
    }()
    
    lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.placeHolderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gray2View: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.placeHolderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gray3View: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.placeHolderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var heightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppIcons.heightIcon
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var mLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.blackColor
        label.font = AppFonts.mediumFont
        return label
    }()
    
    lazy var heightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.placeHolderColor
        label.font = AppFonts.smallFont
        label.text = AppTexts.heightText
        return label
    }()
    
    lazy var mainHeightStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 15
        view.alignment = .center
        return view
    }()
    
    lazy var heightStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 10
        view.alignment = .center
        return view
    }()
    
    lazy var moves2Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        label.font = AppFonts.mediumFont
        return label
    }()
    
    lazy var mainMovesStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 15
        view.alignment = .center
        return view
    }()
    
    lazy var movesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = AppColors.placeHolderColor
        label.font = AppFonts.smallFont
        label.text = AppTexts.movesText
        return label
    }()
    
    lazy var descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 4
        label.font = AppFonts.cardIdFont
        return label
    }()
    
    lazy var statsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .black)
        label.text = AppTexts.statsTitleText
        return label
    }()
    
    lazy var statsHorizantalStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 10
        view.alignment = .center
        return view
    }()
    
    lazy var statsLabelStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 15
        view.alignment = .center
        return view
    }()
    
    lazy var hpLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "HP"
        return label
    }()
    
    lazy var atkLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "ATK"
        return label
    }()
    
    lazy var defLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "DEF"
        return label
    }()
    
    lazy var satkLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "SATK"
        return label
    }()
    
    lazy var sdefLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "SDEF"
        return label
    }()
    
    lazy var spdLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "SPD"
        return label
    }()
    lazy var numberStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 15
        view.alignment = .center
        return view
    }()
    
    lazy var numberHPLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var numberATKLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var numberDEFLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var numberSATKLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var numberSDEFLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var numberSPDLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var progressStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 28
        view.alignment = .center
        return view
    }()
    
    lazy var progressView1: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.0 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView2: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.0 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView3: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.0 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView4: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.0 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView5: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.0 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView6: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.0 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var backPokemomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.backPokomonIcon, for: .normal)
        button.tintColor = AppColors.whiteColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var nextPokemomButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppIcons.nextPokomonIcon, for: .normal)
        button.tintColor = AppColors.whiteColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    init(viewModel : DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getPokemon(pokemonId: pokemonId!)
        
        configure()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        setConstraints()
    }
    
    
    func updatePokemon(pokemon: PokemonDetailExtensionDto) {
        
        self.pokemon = pokemon
        
        self.currentPokemonIndex = pokemons.firstIndex(where: { $0.id == pokemonId })
        
        DispatchQueue.main.async { [self] in
            let backButton = UIButton(type: .custom)
            backButton.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
            
            let arrowImage = AppIcons.arrowBackIcon
            backButton.setImage(arrowImage, for: .normal)
            
            backButton.setTitle("  " + pokemon.pokemonDetailDto.name!, for: .normal)
            backButton.setTitleColor(AppColors.whiteColor, for: .normal)
            backButton.titleLabel?.font = AppFonts.titleBoldFont ?? UIFont.boldSystemFont(ofSize: 30)
            
            backButton.addTarget(self, action: #selector(backPreviousScreenButtonTapped), for: .touchUpInside)
            
            let backButtonItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = backButtonItem
            
        }
        
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self else {
                return
            }
            
            self.typeCollectionView?.reloadData()
            
            
            if (currentPokemonIndex == 0) {
                self.backPokemomButton.isHidden = true
            } else {
                self.backPokemomButton.isHidden = false
            }
            
            if (((currentPokemonIndex ?? 0) + 1) == pokemons.count) {
                self.nextPokemomButton.isHidden = true
            } else {
                self.nextPokemomButton.isHidden = false
            }
            
            self.view.backgroundColor = pokemon.color
            self.pokeIdLabel.text = "\(pokemon.pokemonDetailDto.idString)"
            self.pokemonImage.kf.setImage(with: URL(string: pokemon.pokemonDetailDto.imageUrl))
            self.typeArray = pokemon.pokemonDetailDto.types!
            updateTypeCollectionViewLayout()
            self.aboutLabel.textColor = pokemon.color
            self.kgLabel.text = "\(pokemon.pokemonDetailDto.weight!) kg"
            self.mLabel.text = "\(pokemon.pokemonDetailDto.height!) m"
            let abilities = pokemon.pokemonDetailDto.abilities
            let combinedText = abilities!.joined(separator: "\n")
            self.moves2Label.text = combinedText
            self.descLabel.text = pokemon.description
            self.statsLabel.textColor = pokemon.color
            self.hpLabel.textColor = pokemon.color
            self.atkLabel.textColor = pokemon.color
            self.defLabel.textColor = pokemon.color
            self.satkLabel.textColor = pokemon.color
            self.sdefLabel.textColor = pokemon.color
            self.spdLabel.textColor = pokemon.color
            self.progressView1.progressTintColor = pokemon.color
            self.progressView1.trackTintColor = pokemon.color!.withAlphaComponent(0.4)
            self.progressView2.progressTintColor = pokemon.color
            self.progressView2.trackTintColor = pokemon.color!.withAlphaComponent(0.4)
            self.progressView3.progressTintColor = pokemon.color
            self.progressView3.trackTintColor = pokemon.color!.withAlphaComponent(0.4)
            self.progressView4.progressTintColor = pokemon.color
            self.progressView4.trackTintColor = pokemon.color!.withAlphaComponent(0.4)
            self.progressView5.progressTintColor = pokemon.color
            self.progressView5.trackTintColor = pokemon.color!.withAlphaComponent(0.4)
            self.progressView6.progressTintColor = pokemon.color
            self.progressView6.trackTintColor = pokemon.color!.withAlphaComponent(0.4)
            self.numberHPLabel.text = "\(pokemon.pokemonDetailDto.stats![0].base_stat)"
            self.numberATKLabel.text = "\(pokemon.pokemonDetailDto.stats![1].base_stat)"
            self.numberDEFLabel.text = "\(pokemon.pokemonDetailDto.stats![2].base_stat)"
            self.numberSATKLabel.text = "\(pokemon.pokemonDetailDto.stats![3].base_stat)"
            self.numberSDEFLabel.text = "\(pokemon.pokemonDetailDto.stats![4].base_stat)"
            self.numberSPDLabel.text = "\(pokemon.pokemonDetailDto.stats![5].base_stat)"
            
            let animationDuration = 1.5
            
            let hp = viewModel.getProgressValue(stat: pokemon.pokemonDetailDto.stats![0].base_stat)
            UIView.animate(withDuration: animationDuration) {
                self.progressView1.setProgress(hp, animated: true)
            }
            
            let atk = viewModel.getProgressValue(stat: pokemon.pokemonDetailDto.stats![1].base_stat)
            UIView.animate(withDuration: animationDuration) {
                self.progressView2.setProgress(atk, animated: true)
            }
            
            let def = viewModel.getProgressValue(stat: pokemon.pokemonDetailDto.stats![2].base_stat)
            UIView.animate(withDuration: animationDuration) {
                self.progressView3.setProgress(def, animated: true)
            }
            
            let satk = viewModel.getProgressValue(stat: pokemon.pokemonDetailDto.stats![3].base_stat)
            UIView.animate(withDuration: animationDuration) {
                self.progressView4.setProgress(satk, animated: true)
            }
            
            let sdef = viewModel.getProgressValue(stat: pokemon.pokemonDetailDto.stats![4].base_stat)
            UIView.animate(withDuration: animationDuration) {
                self.progressView5.setProgress(sdef, animated: true)
            }
            
            let spd = viewModel.getProgressValue(stat: pokemon.pokemonDetailDto.stats![5].base_stat)
            UIView.animate(withDuration: animationDuration) {
                self.progressView6.setProgress(spd, animated: true)
            }
            
            
        }
        
    }
    
    private func updateTypeCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (view.bounds.width * 0.2 ), height: (view.bounds.width) * 0.08 )
        
        let collectionViewWidth = view.bounds.width
        let itemWidth = collectionViewWidth * 0.2
        
        let leftInset = (collectionViewWidth - itemWidth ) / (CGFloat(typeArray.count) + 1)
        let rightInset = (collectionViewWidth - itemWidth) / 2
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
        typeCollectionView?.setCollectionViewLayout(layout, animated: true)
        
        
    }
    
    @objc func backPreviousScreenButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
