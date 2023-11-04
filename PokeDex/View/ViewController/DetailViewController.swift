//
//  DetailViewController.swift
//  PokemonAPI
//
//  Created by Kadirhan Keles on 3.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    private var typeCollectionView: UICollectionView?
    var emptyArray = [String]()
    
    lazy var ballImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokeball")
         imageView.backgroundColor = .clear
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
         imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
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
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 16, weight: .black)
        label.text = "About"
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
        imageView.image = UIImage(named: "weight")
         imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    lazy var kgLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "6,9 kg"
       return label
   }()
    
    lazy var weightLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.text = "Weight"
       return label
   }()
    
    lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gray2View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gray3View: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var heightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "straighten")
         imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    lazy var mLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "0,7 m"
       return label
   }()
    
    lazy var heightLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.text = "Height"
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
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = """
        Chlorophyll
        Overgrow
        """
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
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.text = "Moves"
       return label
   }()
    
    lazy var descLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger."
       return label
   }()
    
    lazy var statsLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 16, weight: .black)
        label.text = "Base Stats"
       return label
   }()
    
    lazy var statsHorizantalStack: UIStackView =  {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 0
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
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "HP"
       return label
   }()
    
    lazy var atkLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "ATK"
       return label
   }()
    
    lazy var defLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "DEF"
       return label
   }()
    
    lazy var satkLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "SATK"
       return label
   }()
    
    lazy var sdefLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemOrange
        label.font = UIFont.systemFont(ofSize: 14, weight: .black)
        label.text = "SDEF"
       return label
   }()
    
    lazy var spdLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .systemOrange
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
        label.text = "060"
       return label
   }()
    
    lazy var numberATKLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "045"
       return label
   }()
    
    lazy var numberDEFLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "050"
       return label
   }()
    
    lazy var numberSATKLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "090"
       return label
   }()
    
    lazy var numberSDEFLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "080"
       return label
   }()
    
    lazy var numberSPDLabel : UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "070"
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
        progressView.progressTintColor = .systemOrange
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.5 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView2: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .systemOrange
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.5 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView3: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .systemOrange
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.5 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView4: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .systemOrange
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.5 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView5: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .systemOrange
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.5 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    lazy var progressView6: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .default
        progressView.progressTintColor = .systemOrange
        progressView.trackTintColor = .systemOrange.withAlphaComponent(0.4)
        progressView.progress = 0.5 // İsterseniz başlangıç değerini buradan ayarlayabilirsiniz (0 ile 1 arasında)
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        emptyArray.append("Deneme")
        emptyArray.append("Deneme2")
        configure()
        setupViews()
    }
    
    private func configure() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (view.bounds.width * 0.2 ), height: (view.bounds.width) * 0.08 )
        typeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        typeCollectionView!.dataSource = self
        typeCollectionView!.delegate = self
        typeCollectionView!.register(TypeCell.self, forCellWithReuseIdentifier: TypeCell.identifier)
        typeCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        typeCollectionView?.isScrollEnabled = false
        let collectionViewWidth = view.bounds.width
        let itemWidth = collectionViewWidth * 0.2
        let itemSpacing: CGFloat = 20
        
        let leftInset = (collectionViewWidth - (itemWidth + itemSpacing)) / (CGFloat(emptyArray.count) + 1)
        let rightInset = (collectionViewWidth - (itemWidth + itemSpacing)) / 2

        layout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
        
    }
    
    private func setupViews() {
        view.addSubview(ballImage)
        view.addSubview(whiteView)
        view.addSubview(pokemonImage)
        whiteView.addSubview(typeCollectionView!)
        whiteView.addSubview(aboutLabel)
        whiteView.addSubview(mainHorizantalStack)
        mainHorizantalStack.addArrangedSubview(mainWeightStack)
        mainWeightStack.addArrangedSubview(weightStack)
        weightStack.addArrangedSubview(weightImage)
        weightStack.addArrangedSubview(kgLabel)
        mainWeightStack.addArrangedSubview(weightLabel)
        mainHorizantalStack.addArrangedSubview(grayView)
        mainHorizantalStack.addArrangedSubview(mainHeightStack)
        mainHeightStack.addArrangedSubview(heightStack)
        heightStack.addArrangedSubview(heightImage)
        heightStack.addArrangedSubview(mLabel)
        mainHeightStack.addArrangedSubview(heightLabel)
        mainHorizantalStack.addArrangedSubview(gray2View)
        mainHorizantalStack.addArrangedSubview(mainMovesStack)
        mainMovesStack.addArrangedSubview(moves2Label)
        mainMovesStack.addArrangedSubview(movesLabel)
        whiteView.addSubview(descLabel)
        whiteView.addSubview(statsLabel)
        whiteView.addSubview(statsHorizantalStack)
        statsHorizantalStack.addArrangedSubview(statsLabelStack)
        statsLabelStack.addArrangedSubview(hpLabel)
        statsLabelStack.addArrangedSubview(atkLabel)
        statsLabelStack.addArrangedSubview(defLabel)
        statsLabelStack.addArrangedSubview(satkLabel)
        statsLabelStack.addArrangedSubview(sdefLabel)
        statsLabelStack.addArrangedSubview(spdLabel)
        statsHorizantalStack.addArrangedSubview(gray3View)
        statsHorizantalStack.addArrangedSubview(numberStack)
        numberStack.addArrangedSubview(numberHPLabel)
        numberStack.addArrangedSubview(numberATKLabel)
        numberStack.addArrangedSubview(numberDEFLabel)
        numberStack.addArrangedSubview(numberSATKLabel)
        numberStack.addArrangedSubview(numberSDEFLabel)
        numberStack.addArrangedSubview(numberSPDLabel)
        statsHorizantalStack.addArrangedSubview(progressStack)
        progressStack.addArrangedSubview(progressView1)
        progressStack.addArrangedSubview(progressView2)
        progressStack.addArrangedSubview(progressView3)
        progressStack.addArrangedSubview(progressView4)
        progressStack.addArrangedSubview(progressView5)
        progressStack.addArrangedSubview(progressView6)
        
        NSLayoutConstraint.activate([
            ballImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            ballImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            ballImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            ballImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            whiteView.topAnchor.constraint(equalTo: ballImage.bottomAnchor),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            pokemonImage.bottomAnchor.constraint(equalTo: whiteView.topAnchor, constant: 90),
            pokemonImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            pokemonImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            typeCollectionView!.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            typeCollectionView!.widthAnchor.constraint(equalTo: whiteView.widthAnchor),
            typeCollectionView!.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1),
            
            aboutLabel.topAnchor.constraint(equalTo: typeCollectionView!.bottomAnchor, constant: 16),
            aboutLabel.widthAnchor.constraint(equalTo: whiteView.widthAnchor),
            aboutLabel.heightAnchor.constraint(equalToConstant: 20),
            
            mainHorizantalStack.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 16),
            mainHorizantalStack.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 32),
            mainHorizantalStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -32),
            //mainHorizantalStack.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            
            
            
            grayView.widthAnchor.constraint(equalToConstant: 1),
            grayView.heightAnchor.constraint(equalTo: mainHorizantalStack.heightAnchor),
            
            gray2View.widthAnchor.constraint(equalToConstant: 1),
            gray2View.heightAnchor.constraint(equalTo: mainHorizantalStack.heightAnchor),

            descLabel.topAnchor.constraint(equalTo: mainHorizantalStack.bottomAnchor, constant: 24),
            descLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 24),
            descLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -24),
            descLabel.bottomAnchor.constraint(equalTo: statsLabel.topAnchor, constant: -24),
            descLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            
            statsLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 24),
            statsLabel.bottomAnchor.constraint(equalTo: statsHorizantalStack.topAnchor, constant: -24),
            statsLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            statsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor),
            
            
            statsHorizantalStack.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -24),
            statsHorizantalStack.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
            statsHorizantalStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
            statsHorizantalStack.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            gray3View.widthAnchor.constraint(equalToConstant: 1),
            gray3View.heightAnchor.constraint(equalTo: statsHorizantalStack.heightAnchor),
            
            statsLabelStack.widthAnchor.constraint(equalTo: whiteView.widthAnchor, multiplier: 0.2),
            progressView1.widthAnchor.constraint(equalTo: statsHorizantalStack.widthAnchor, multiplier: 0.6),
            progressView2.widthAnchor.constraint(equalTo: statsHorizantalStack.widthAnchor, multiplier: 0.6),
            progressView3.widthAnchor.constraint(equalTo: statsHorizantalStack.widthAnchor, multiplier: 0.6),
            progressView4.widthAnchor.constraint(equalTo: statsHorizantalStack.widthAnchor, multiplier: 0.6),
            progressView5.widthAnchor.constraint(equalTo: statsHorizantalStack.widthAnchor, multiplier: 0.6),
            progressView6.widthAnchor.constraint(equalTo: statsHorizantalStack.widthAnchor, multiplier: 0.6),
        ])
    }
    


}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emptyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCell.identifier, for: indexPath) as! TypeCell
        cell.pokemonNameLabel.text = emptyArray[indexPath.row]
        
        return cell
    }
    

}

