import SwiftData
import Foundation

@Observable
class CreateNewHiveViewModel {
    var hiveType: HiveTypes = .other
    var numberOfFrames: Int = 0
    var image: String = ""
    
    func save(context: ModelContext, apiary: Apiary) {
        let hive: Hive = .init(
            inspections: [],
            hiveType: hiveType,
            numberOfFrames: numberOfFrames,
            image: image
        )
        
        hive.apiary = apiary
        
        context.insert(hive)
        
        do {
            try context.save()
            print("OKOKOK")
        } catch {
            print("Failed to save hive:", error)
        }
    }
}
