//
//  ListViagemNavView.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class ListViagemNavView: UIView {

    private struct Constants {
        static let titleHeader = NSLocalizedString(Localizable.SHeaderNavListViagem, comment: "")
        static let spaceHeader: CGFloat = 20.0
        static let spaceTitleLabel: CGFloat = 10.0
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
    
    private lazy var headerBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.secundary
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.titleHeader
        label.textColor = CustomColor.appText
        return label
    }()
    
    private func addElemented() {
        self.addSubview(self.navBackGroundView)
        self.navBackGroundView.addSubview(self.navBar)
        self.navBar.addSubview(self.headerBar)
        self.navBar.addSubview(self.titleLabel)
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
            
            self.headerBar.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: Constants.spaceHeader),
            self.headerBar.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.headerBar.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -Constants.spaceHeader),
            self.headerBar.heightAnchor.constraint(equalToConstant: 45),
            
            self.titleLabel.centerYAnchor.constraint(equalTo: self.headerBar.centerYAnchor),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.headerBar.centerXAnchor)
            
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
