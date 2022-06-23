//
//  LibViewController.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class LibViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LibViewController: LibAlertViewProtocol {
    func showMessage(title: String, message: String) {
        guard Thread.isMainThread else { return DispatchQueue.main.async {
            self.showMessageInternal(title: title, message: message)
        }}
        showMessageInternal(title: title, message: message)
    }
    
    private func showMessageInternal(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LibConstants.libTitleOk, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
