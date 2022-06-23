//
//  ListViagemViewModel.swift
//  Viagens-MVVM-C-DI
//
//  Created by Wagner Coleta on 23/06/22.
//

import Foundation
import UIKit

final class ListViagemViewModel: BaseViewModel {
    
    private let _viagens: LibObservable<[Viagem]> = LibObservable([])
    private let viagemService: ViagemServiceProtocol
    private var _lstViagens = [Viagem]()
    
    weak var delegateAlertView: LibAlertViewProtocol?
    
    init(viagemService: ViagemServiceProtocol) {
        self.viagemService = viagemService
    }
    
    func getListViagens(viagensDTO: [ViagemDTO]) -> [Viagem] {
        var lstViagens = [Viagem]()
        
        viagensDTO.forEach { viagemDTO in
            var type = TypeViagemEnum.N
            if (viagemDTO.type == TypeViagemEnum.I.rawValue) {
                type = TypeViagemEnum.I
            }

            let priceFinal: Decimal = (viagemDTO.price - viagemDTO.discountPrice)
            var priceNumberOfSplit: Decimal = 0
            if (viagemDTO.numberOfSplit > 0) {
                let numberOfSplitDecimal = Decimal(viagemDTO.numberOfSplit)
                priceNumberOfSplit = (priceFinal / numberOfSplitDecimal)
            }

            let viagem = Viagem(id: viagemDTO.id,
                                title: viagemDTO.title,
                                description: viagemDTO.description,
                                urlImage: viagemDTO.urlImage,
                                type: type,
                                price: viagemDTO.price,
                                discountPrice: viagemDTO.discountPrice,
                                numberOfSplit: viagemDTO.numberOfSplit,
                                priceFinal: priceFinal,
                                priceNumberOfSplit: priceNumberOfSplit)
            
            lstViagens.append(viagem)
        }
        
        return lstViagens
    }
    
    private func notifiesUpdateViagens(_ lstViagem: [Viagem]) {
        self._viagens.value?.removeAll()
        self._viagens.value?.append(contentsOf: self._lstViagens)
    }
    
    private func loadViagensInternal() {
        self.viagemService.fetchViagens { viagensDTO, error in
            if let error = error {
                self.delegateAlertView?.showMessage(title: LibConstants.libTitleError, message: error.localizedDescription)
            } else if let viagensDTO = viagensDTO {
                self._lstViagens = self.getListViagens(viagensDTO: viagensDTO)
                self._lstViagens.sort {
                    $0.title < $1.title
                }
                self.notifiesUpdateViagens(self._lstViagens)
                self.loadImagemViagemInternal(viagens: self._lstViagens)
            }
        }
    }
    
    private func loadImagemViagemInternal(viagens: [Viagem]) {
        viagens.forEach { viagem in
            self.getViagemItem(viagem: viagem) { imagemViagem in
                if let imagemViagem = imagemViagem {
                    self.setImageViagem(with: imagemViagem)
                }
            }
        }
    }
    
    private func getViagemItem(viagem: Viagem, completion: @escaping (ImagemViagem?) -> Void) {
        if (!viagem.urlImage.isEmpty) {
            self.viagemService.getData(url: viagem.urlImage) { data in
                if let dataImg = data {
                    let image = UIImage(data: dataImg)
                    let imagemViagem = ImagemViagem(idViagem: viagem.id, imagem: image)
                    completion(imagemViagem)
                }
                else {
                    completion(nil)
                }
            }
        } else {
            completion(nil)
        }
    }
    
    private func setImageViagem(with imagemViagem: ImagemViagem) {
        let findViagemById = self._lstViagens.first { viagem in
            return viagem.id == imagemViagem.idViagem
        }
        
        if (findViagemById != nil) {
            findViagemById?.Image = imagemViagem.imagem
            
            self.notifiesUpdateViagens(self._lstViagens)
        }
    }
}

extension ListViagemViewModel: ListViagemViewModelProtocol {
    
    var viagens: LibObservable<[Viagem]> {
        get { return _viagens }
    }
    
    func loadViagens() {
        loadViagensInternal()
    }
}
