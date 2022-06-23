//
//  ListViagemCollectionViewCell.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class ListViagemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ListViagemCollectionViewCell"
        
    private var viewCell: ListViagemView!
    
    private func addElemented() {
        self.viewCell = ListViagemView()
        self.viewCell.translatesAutoresizingMaskIntoConstraints = false
        addSubview(self.viewCell)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.contentView.leadingAnchor.constraint(equalTo: self.viewCell.leadingAnchor),
            self.contentView.topAnchor.constraint(equalTo: self.viewCell.topAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.viewCell.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.viewCell.bottomAnchor)
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
        self.viewCell.setup(viagem)
    }
}
