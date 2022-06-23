//
//  ListViagemNavView.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class ListViagemNavView: UIView {

    private struct Constants {
        static let spaceHeader: CGFloat = 15.0
        static let spaceTitleLabel: CGFloat = 7.0
    }
    
    private lazy var navBackGroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.primary
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner] //borda inferior direita
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var navBar:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.SHeaderNavListViagem
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.SSubHeaderNavListViagem
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private func addElemented() {
        self.addSubview(self.navBackGroundView)
        self.navBackGroundView.addSubview(self.navBar)
        self.navBar.addSubview(self.titleLabel)
        self.navBar.addSubview(self.subTitleLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.navBackGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBackGroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navBackGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBackGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.titleLabel.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: Constants.spaceHeader),
            self.titleLabel.topAnchor.constraint(equalTo: self.navBar.topAnchor, constant: Constants.spaceHeader),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -Constants.spaceHeader),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: Constants.spaceHeader * 2),
            self.subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Constants.spaceTitleLabel),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: -Constants.spaceHeader),
            self.subTitleLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElemented()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
