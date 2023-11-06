//
//  DetailViewControllerExtension.swift
//  PokeDex
//
//  Created by Ali Çolak on 6.11.2023.
//

import UIKit


extension DetailViewController {
    
    func configure() {
        
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        
        let arrowImage = AppIcons.arrowBackIcon
        backButton.setImage(arrowImage, for: .normal)
        
        let name = "  " + pokemons.first(where: {$0.id == pokemonId})!.name
        
        backButton.setTitle(name , for: .normal)
        backButton.setTitleColor(AppColors.whiteColor, for: .normal)
        backButton.titleLabel?.font = AppFonts.titleBoldFont ?? UIFont.boldSystemFont(ofSize: 30)
        
        backButton.addTarget(self, action: #selector(backPreviousScreenButtonTapped), for: .touchUpInside)
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: pokeIdLabel)
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
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
        
        let leftInset = (collectionViewWidth - itemWidth ) / (CGFloat(typeArray.count) + 1)
        let rightInset = (collectionViewWidth - itemWidth) / 2
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        
        
    }
    
    func setupViews() {
        view.addSubview(ballImage)
        view.addSubview(whiteView)
        view.addSubview(pokemonImage)
        view.addSubview(backPokemomButton)
        view.addSubview(nextPokemomButton)
    
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
        
    }
    
    func setConstraints(){
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
            
            backPokemomButton.bottomAnchor.constraint(equalTo: whiteView.topAnchor, constant: -20),
            backPokemomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            nextPokemomButton.bottomAnchor.constraint(equalTo: whiteView.topAnchor, constant: -20),
            nextPokemomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
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


extension DetailViewController {
    
    @objc func backButtonTapped() {
        
        navigationItem.backBarButtonItem?.title = "sdfsdfsdf"

                
        let previousPokemonId = pokemons[(currentPokemonIndex ?? 0) - 1].id
        
        pokemonId = previousPokemonId
        
        self.viewModel.getPokemon(pokemonId: previousPokemonId)
        
    }
    
    @objc func nextButtonTapped() {
        
        navigationItem.backBarButtonItem?.title = "sdfsdfsdf"
                
        let nextPokemonId = pokemons[(currentPokemonIndex ?? 0) + 1].id
        
        pokemonId = nextPokemonId
        
        self.viewModel.getPokemon(pokemonId: nextPokemonId)
    }
}


extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCell.identifier, for: indexPath) as! TypeCell
        cell.pokemonNameLabel.text = typeArray[indexPath.row]
        cell.typeView.backgroundColor = viewModel.getColorFromString(color: typeArray[indexPath.row])
        
        return cell
    }
    
    
}
