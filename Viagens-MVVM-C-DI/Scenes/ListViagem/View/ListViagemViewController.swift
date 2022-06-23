//
//  ListViagemViewController.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

final class ListViagemViewController: LibViewController, ListViagemViewControllerProtocol {

    private var screen: ListViagemScreen?
    private var viewModel: ListViagemViewModelProtocol
    private var viagens: [Viagem] = []
    private func configCollectionView() {
        self.screen?.delegateCollectionView(delegate: self, dataSource: self)
    }
    
    init(viewModel: ListViagemViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.screen = ListViagemScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configCollectionView()
        
        self.viewModel.viagens.bind { [weak self] viagens in
            if let lstViagens = viagens {
                self?.viagens = lstViagens

                if (!lstViagens.isEmpty) {
                    DispatchQueue.main.async {
                        self?.screen?.reloadCollectionView()
                    }
                }
            }
        }

        self.viewModel.loadViagens()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension ListViagemViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListViagemCollectionViewCell.identifier, for: indexPath) as? ListViagemCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        let viagem = self.viagens[indexPath.row]
        cell.setup(viagem)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let viagem = self.viagens[indexPath.row]
//        self.viewModel.delegateCoordinator?.goToViagem(viagem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 330)
    }
}
