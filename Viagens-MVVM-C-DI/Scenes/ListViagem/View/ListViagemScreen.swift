//
//  ListViagemScreen.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class ListViagemScreen: UIView {
    
    private lazy var navView: ListViagemNavView = {
        let view = ListViagemNavView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private lazy var collectionView:UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .none
        cv.delaysContentTouches = false
        cv.register(ListViagemCollectionViewCell.self, forCellWithReuseIdentifier: ListViagemCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }()
    
    private func addElemented() {
        self.addSubview(self.navView)
        self.addSubview(self.activityIndicatorView)
        self.addSubview(self.collectionView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.navView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navView.heightAnchor.constraint(equalToConstant: 100),
            
            self.collectionView.topAnchor.constraint(equalTo: self.navView.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.collectionView.centerYAnchor),
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor)
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
    
    public func delegateCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSource
    }
    
    public func reloadCollectionView() {
        self.collectionView.reloadData()
        self.activityIndicatorView.stopAnimating()
    }
}
