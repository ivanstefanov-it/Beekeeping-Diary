import SwiftData
import Foundation
import _PhotosUI_SwiftUI

@Observable
class CreateNewHiveViewModel {
    var hiveType: HiveTypes = .other
    var numberOfFrames: Int = 0
    var imageData: Data? = nil
    var previewImage: UIImage? = nil
    
    func setImage(_ image: UIImage?) {
        guard let image else {
            previewImage = nil
            imageData = nil
            return
        }
        
        let processed = processImage(image)
        previewImage = processed
        imageData = processed.jpegData(compressionQuality: 0.7)
    }
    
    func processImage(_ image: UIImage) -> UIImage {
        let targetSize = CGSize(width: 800, height: 600)
        return image.centerCropped(to: targetSize) ?? image
    }
    
    func loadImage(from item: PhotosPickerItem?) {
        guard let item else { return }
        
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                await MainActor.run {
                    self.setImage(uiImage)
                }
            }
        }
    }
    
    func save(context: ModelContext, apiary: Apiary) {
        let hive = Hive(
            inspections: [],
            hiveType: hiveType,
            numberOfFrames: numberOfFrames,
            image: imageData
        )
        
        hive.apiary = apiary
        context.insert(hive)
        
        do {
            try context.save()
        } catch {
            print("Failed to save hive:", error)
        }
    }
}

extension UIImage {
    func centerCropped(to size: CGSize) -> UIImage? {
        let scale = max(size.width / self.size.width,
                        size.height / self.size.height)
        
        let newSize = CGSize(
            width: self.size.width * scale,
            height: self.size.height * scale
        )
        
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { _ in
            let x = (size.width - newSize.width) / 2
            let y = (size.height - newSize.height) / 2
            self.draw(in: CGRect(origin: CGPoint(x: x, y: y), size: newSize))
        }
    }
}
