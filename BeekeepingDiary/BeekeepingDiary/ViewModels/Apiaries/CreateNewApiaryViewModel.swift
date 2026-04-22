import SwiftData
import Foundation

@Observable
class CreateNewApiaryViewModel {
    var name: String = ""
    var city: String = ""
    var registrationNumber: String = ""
    var apiaryDescription: String = ""
    
    func save(context: ModelContext) {
        let apiary: Apiary = .init(
            name: name,
            city: city,
            registrationNumber: registrationNumber,
            apiaryDescription: apiaryDescription,
            hives: []
        )
        
        context.insert(apiary)
        
        do {
            try context.save()
        } catch {
            print("Failed to save hive:", error)
        }
    }
}
