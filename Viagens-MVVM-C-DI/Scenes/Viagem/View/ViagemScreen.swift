//
//  ViagemScreen.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

protocol ViagemScreenProtocol: AnyObject {
    func actionBackButton()
}

class ViagemScreen: UIView {

    private struct Metrics {
        static let heightImage: CGFloat = 220.0
        static let spaceComponents: CGFloat = 10.0
    }

    weak var delegate: ViagemScreenProtocol?
    
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textColor = CustomColor.appText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = CustomColor.appText
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = .systemGreen
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var numberOfSplitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = CustomColor.appText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = CustomColor.primary
        label.numberOfLines = 1
        return label
    }()
    
    private func addElemented() {
        self.addSubview(self.imageView)
        self.addSubview(self.backButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.priceLabel)
        self.addSubview(self.numberOfSplitLabel)
        self.addSubview(self.typeLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: Metrics.heightImage),
            
            self.backButton.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: Metrics.spaceComponents),
            self.backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Metrics.spaceComponents),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.spaceComponents),
            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: Metrics.spaceComponents),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.spaceComponents),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.spaceComponents),
            self.priceLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.numberOfSplitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.spaceComponents),
            self.numberOfSplitLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.numberOfSplitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.typeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.spaceComponents),
            self.typeLabel.topAnchor.constraint(equalTo: self.numberOfSplitLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.typeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.spaceComponents)
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addElemented()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func backButtonPressed() {
        self.delegate?.actionBackButton()
    }
    
    public func setup(_ viagem: Viagem) {
        self.imageView.image = viagem.Image
        self.titleLabel.text = viagem.title
        self.descriptionLabel.text = viagem.description
        self.priceLabel.attributedText = getPriceLabelAttributedText(viagem)
        self.numberOfSplitLabel.text = "\(CustomTextLabel.parceladoEmXVezes) \(viagem.numberOfSplit)x"
        self.typeLabel.text = viagem.type.text
    }
}
