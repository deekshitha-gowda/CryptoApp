import Foundation
import SwiftUI

class LocalFileManager{
    static let instance = LocalFileManager()
    
    private init(){}
    
    func saveImage (image: UIImage,imageName : String, folderName: String){
        createFolderIfNeeded(folderName: folderName)
         // get path for image
        guard let data = image.pngData(),
              let url = getURLforImage(imageName: imageName, folderName: folderName)
                else { return }
        
        
        // save image to path
        
        do {
            try data.write(to: url)
        } catch {
            print("Error saving image: \(error)")
        }
    }
    
    func getImage(imageName : String, folderName : String) -> UIImage?{
        guard let url = getURLforImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName : String){
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at : url, withIntermediateDirectories: true, attributes: nil)
            } catch  {
                print("Error creating folder: \(error) \(folderName)")
            }
        }
    }
    
    
    private func getURLForFolder(folderName : String) -> URL?{
        guard  let url = FileManager.default.urls(for: .cachesDirectory , in : .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLforImage(imageName : String, folderName : String) -> URL?{
        guard let folderUrl = getURLForFolder(folderName:folderName) else {
            return nil
        }
        return folderUrl.appendingPathComponent(imageName + ".png")
    }
}
