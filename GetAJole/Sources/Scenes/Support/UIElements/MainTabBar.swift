//
//  MainTabBar.swift
//  GetAJole
//
//  Created by Борис Киселев on 05.09.2024.
//

import UIKit

final class MainTabBar: UITabBarController {
    // MARK: - Outlets
    private let assemblyBuilder = AssemblyIBuilder()
    private let tabbarItemBackgroundView = UIView()
    private var centerConstraint: NSLayoutConstraint?
    private let tabBarView = UIView()
    private var buttons = [UIButton]()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView() {
        tabBarView.addSubview(tabbarItemBackgroundView)
        view.addSubview(tabBarView)
        tabBarView.backgroundColor = .systemGray5
        setupLayout()
        setupViewControllers()
        setupButtons()
    }

    // MARK: - Setup Layout
    private func setupLayout() {
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        tabBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -60).isActive = true
        tabBarView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        tabBarView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        tabBarView.layer.cornerRadius = 30

        tabbarItemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        tabbarItemBackgroundView.widthAnchor.constraint(equalTo: tabBarView.widthAnchor, multiplier: 1/CGFloat(2), constant: -10).isActive = true
        tabbarItemBackgroundView.heightAnchor.constraint(equalTo: tabBarView.heightAnchor, constant: -10).isActive = true
        tabbarItemBackgroundView.centerYAnchor.constraint(equalTo: tabBarView.centerYAnchor).isActive = true
        tabbarItemBackgroundView.layer.cornerRadius = 25
        tabbarItemBackgroundView.backgroundColor = .systemPurple
    }

    // MARK: - Setup ViewControllers
    private func setupViewControllers() {
        let mainView = self.generateViewController(imageName: "face.smiling.inverse", controller: assemblyBuilder.createMainModule())
        let favoritesControoler = self.generateViewController(imageName: "star.fill", controller: assemblyBuilder.createFavoriteModuler())
        self.viewControllers = [mainView, favoritesControoler]
    }

    // MARK: - Generate ViewControllers
    private func generateViewController(imageName: String, controller: UIViewController) -> UIViewController {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemPurple
        let image = UIImage(systemName: imageName)
        image?.resize(targetSize: CGSize(width: 25, height: 25)).withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        self.buttons.append(button)
        return controller
    }

    // MARK: - Setup buttons
    private func setupButtons() {
        for index in 0..<buttons.count {
            view.addSubview(buttons[index])
            buttons[index].tag = index
            buttons[index].translatesAutoresizingMaskIntoConstraints = false
            buttons[index].centerYAnchor.constraint(equalTo: tabBarView.centerYAnchor).isActive = true
            buttons[index].widthAnchor.constraint(equalTo:  tabBarView.widthAnchor, multiplier: 1/CGFloat(buttons.count)).isActive = true
            buttons[index].heightAnchor.constraint(equalTo: tabBarView.heightAnchor).isActive = true
            buttons[index].addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            if index == 0 {
                buttons[index].leftAnchor.constraint(equalTo: tabBarView.leftAnchor).isActive = true
            } else {
                buttons[index].leftAnchor.constraint(equalTo: buttons[index - 1].rightAnchor).isActive = true
            }
        }
        self.centerConstraint = tabbarItemBackgroundView.centerXAnchor.constraint(equalTo: buttons[0].centerXAnchor)
        self.centerConstraint?.isActive = true
    }

    // MARK: - Button Actions
    @objc func buttonTapped(sender: UIButton) {
        selectedIndex = sender.tag
        for button in buttons {
            button.tintColor = .systemPurple
        }

        UIView.animate(withDuration: 0.5, delay: 0 , options: .beginFromCurrentState) {
            self.centerConstraint?.isActive = false
            self.centerConstraint = self.tabbarItemBackgroundView.centerXAnchor.constraint(equalTo: self.buttons[sender.tag].centerXAnchor)
            self.centerConstraint?.isActive = true
            self.buttons[sender.tag].tintColor = .black
            self.tabBarView.layoutIfNeeded()
        }
    }
}
