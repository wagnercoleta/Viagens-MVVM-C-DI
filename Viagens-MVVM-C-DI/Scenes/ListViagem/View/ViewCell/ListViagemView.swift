//
//  ListViagemView.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class ListViagemView: UIView {
    
    private struct Metrics {
        static let spaceBoxView: CGFloat = 10.0
        static let spaceComponents: CGFloat = 11.0
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = CustomColor.secundary.cgColor
        view.layer.borderWidth = 1.0
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.08).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.hidesWhenStopped = true
        activity.color = CustomColor.primary
        activity.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
        activity.startAnimating()
        return activity
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = CustomColor.appText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = CustomColor.appText
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGreen
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var numberOfSplitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = CustomColor.appText
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemOrange
        label.numberOfLines = 1
        return label
    }()
    
    
    private func addElemented() {
        self.addSubview(self.boxView)
        self.boxView.addSubview(self.imageView)
        self.imageView.addSubview(self.activityIndicatorView)
        self.boxView.addSubview(self.titleLabel)
        self.boxView.addSubview(self.descriptionLabel)
        self.boxView.addSubview(self.priceLabel)
        self.boxView.addSubview(self.numberOfSplitLabel)
        self.boxView.addSubview(self.typeLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.spaceBoxView),
            self.boxView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.spaceBoxView),
            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.spaceBoxView),
            self.boxView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.spaceBoxView),
            
            self.imageView.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.boxView.topAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 180),
            
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: Metrics.spaceComponents),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor, constant: Metrics.spaceComponents),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor, constant: Metrics.spaceComponents),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor, constant: Metrics.spaceComponents),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.numberOfSplitLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.numberOfSplitLabel.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor, constant: Metrics.spaceComponents),
            self.numberOfSplitLabel.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor, constant: -Metrics.spaceComponents),
            
            self.typeLabel.topAnchor.constraint(equalTo: self.numberOfSplitLabel.bottomAnchor, constant: Metrics.spaceComponents),
            self.typeLabel.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor, constant: Metrics.spaceComponents),
            self.typeLabel.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor, constant: -Metrics.spaceComponents),
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
    
    public func setup(_ viagem: Viagem) {
        self.titleLabel.text = viagem.title
        self.descriptionLabel.text = viagem.description
        self.priceLabel.attributedText = getPriceLabelAttributedText(viagem)
        self.numberOfSplitLabel.text = "\(CustomTextLabel.parceladoEmXVezes) \(viagem.numberOfSplit)x"
        self.typeLabel.text = viagem.type.text
        self.imageView.image = viagem.Image
        if (viagem.Image == nil) {
            self.activityIndicatorView.startAnimating()
        } else {
            self.activityIndicatorView.stopAnimating()
        }
    }
}
