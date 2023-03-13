//
//  MainView.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    //MARK: - Subview's
    
    let backgroundImage = createMainImageView(with: "background")
    let setupLabel = createMainLabel(with: "You wanna a joke?")
    let punchLabel = createMainLabel(with: "Poor bustard!")
    lazy var getJokeButton = createMainButton(cornerRadius: 25)
    lazy var getToFavoriteButton = createMainButton(cornerRadius: 25)
    let jokeShadowView = createShadowView(cornerRadius: 25)
    let favoriteShadowView = createShadowView(cornerRadius: 25)
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupHierarchy()
        buttonsConfigurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Hierarchy
    
    private func setupHierarchy() {
        addSubview(backgroundImage)
        sendSubviewToBack(backgroundImage)
        addSubview(setupLabel)
        addSubview(punchLabel)
        addSubview(jokeShadowView)
        addSubview(getJokeButton)
        addSubview(favoriteShadowView)
        addSubview(getToFavoriteButton)
    }
    
    //MARK: - Setup Layout
    
    private func setupLayout() {
        
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(75)
        }
        
        setupLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        punchLabel.snp.makeConstraints { make in
            make.top.equalTo(setupLabel).inset(25)
            make.centerX.equalToSuperview()
        }
        
        jokeShadowView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(150)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
            make.width.equalTo(getJokeButton)
        }
        
        getJokeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(150)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
        }
        
        favoriteShadowView.snp.makeConstraints { make in
            make.top.equalTo(getJokeButton).inset(65)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
            make.width.equalTo(getToFavoriteButton)
        }
        
        getToFavoriteButton.snp.makeConstraints { make in
            make.top.equalTo(getJokeButton).inset(65)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
        }
    }
    
    //MARK: - Button's Configuration
    
    private func buttonsConfigurate() {
        
        var getConfiguration = UIButton.Configuration.filled()
        getConfiguration.baseBackgroundColor = .purple
        getConfiguration.title = "Get new statement"
        getConfiguration.titleAlignment = .center
        
        var favoriteConfigutation = UIButton.Configuration.filled()
        favoriteConfigutation.baseBackgroundColor = .orange
        favoriteConfigutation.title = "Add To Favorites"
        favoriteConfigutation.titleAlignment = .center
        
        getJokeButton.configuration = getConfiguration
        getToFavoriteButton.configuration = favoriteConfigutation
    }
}
