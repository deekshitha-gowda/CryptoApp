//
//  CoinImageService.swift
//  SwiftuiCrypto
//
//  Created by ATEU on 09/01/25.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin : CoinModel
    private let fileManager = LocalFileManager.instance
    private let folerName : String = "coin_images"
    private let imageName : String
    
    init(coin : CoinModel){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    private func getCoinImage(){
        if let savedImage =   fileManager.getImage(imageName: imageName, folderName: folerName){
            image = savedImage
            print("Retreiving image from file Manager")} else{
                downloadcoinImage()
                print("Downloading image now")
            }
            
        }
    
    
    private func downloadcoinImage(){
        print("Dowloading images now")
        guard let url = URL(string: coin.image) else { return }
         
         imageSubscription =    NetworkingManager.download(url: url)
            .tryMap({
                (data) -> UIImage? in
                return UIImage(data: data)
            })
             .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: {[weak self] (returnedImage) in
                 guard let self = self , let downmloadedImage = returnedImage else {
                     return
                 }
                 self.image = returnedImage
                 self.imageSubscription?.cancel()
                 self.fileManager.saveImage(image: downmloadedImage, imageName: self.imageName, folderName: self.folerName)
             })
    }
}
