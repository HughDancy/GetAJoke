//
//  MainView.swift
//  GetAJole
//
//  Created by Борис Киселев on 13.03.2023.
//

import UIKit
import SnapKit

class MainView: UIView {

    // MARK: - Subview's
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let setupLabel = createSimpleLabel(with: "Do you want a joke?", size: 25)
    lazy var getJokeButton = MainButton(radius: 25, text: "Get a new Joke", color: .systemPurple)
    let jokeShadowView = ShadowView(cornerRadius: 25)
    lazy var favoriteIcon: UIImageView = {
        let starImage = UIImage(named: "star")
        let taapedImage = UIImage(named: "starYellow")
        let imageView = UIImageView(image: starImage, highlightedImage: taapedImage)
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Hierarchy
    private func setupHierarchy() {
        addSubview(backgroundImage)
        sendSubviewToBack(backgroundImage)
        addSubview(setupLabel)
        addSubview(favoriteIcon)
        addSubview(jokeShadowView)
        addSubview(getJokeButton)
    }

    //MARK: - Setup Layout

    private func setupLayout() {
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(75)
        }

        setupLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(65)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }

        favoriteIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height / 5)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }

        jokeShadowView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(180)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
            make.width.equalTo(getJokeButton)
        }

        getJokeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(180)
            make.trailing.equalToSuperview().inset(35)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }

    }
}
