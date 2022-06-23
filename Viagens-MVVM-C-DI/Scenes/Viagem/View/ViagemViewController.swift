//
//  ViagemViewController.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class ViagemViewController: LibViewController, ViagemViewControllerProtocol {

    private var screen: ViagemScreen?
    private var viewModel: ViagemViewModelProtocol
    
    init(viewModel: ViagemViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.screen = ViagemScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screen?.delegate = self
        
        if let viagem = viewModel.viagem {
            self.screen?.setup(viagem)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel.delegateCoordinator?.navigationController.setNavigationBarHidden(true, animated: false)
    }
}

extension ViagemViewController: ViagemScreenProtocol {
    func actionBackButton() {
        self.viewModel.delegateCoordinator?.navigationController.popViewController(animated: true)
    }
}
