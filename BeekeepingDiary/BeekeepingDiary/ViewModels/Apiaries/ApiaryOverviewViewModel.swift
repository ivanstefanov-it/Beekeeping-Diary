import SwiftData
import Foundation
import Observation

@Observable
class ApiaryOverviewViewModel {
    var allApiaries: [Apiary] = []
    
    init() { }
    
    func load(context: ModelContext) {
        do {
            let descriptor = FetchDescriptor<Apiary>()
            let fetched = try context.fetch(descriptor)
            
            if fetched.isEmpty {
                // 👉 Seed initial data ONLY ONCE
                seedInitialData(context: context)
                
                // Fetch again after inserting
                allApiaries = try context.fetch(descriptor)
            } else {
                allApiaries = fetched
            }
        } catch {
            print("❌ Fetch failed:", error)
        }
    }
    
    private func seedInitialData(context: ModelContext) {
        let apiaries = mockApiaries()
        
        for apiary in apiaries {
            context.insert(apiary)
        }
        
        do {
            try context.save()
        } catch {
            print("❌ Save failed:", error)
        }
    }
    
    private func mockApiaries() -> [Apiary] {
        return [
            .init(
                name: "ApiaryName",
                city: "Sofia",
                registrationNumber: "123qwerty456",
                apiaryDescription: "Veri nice Apiary",
                hives: [
                    .init(
                        inspections: [.init(
                        haveBrood: false,
                        haveQueen: false,
                        haveHoney: false,
                        havePolen: false,
                        numbersOfFrames: 10,
                        haveFreeFrames: false,
                        numberOfFreeFrames: 0,
                        areEggsPresented: false,
                        areQueenCellsPresented: false,
                        areDroneCellsPresented: false,
                        colonyStrenght: .medium,
                        broodPattern: .solid,
                        beeBehavior: .calm,
                        pestsAndDiseases: .ants,
                        hiveHygiene: .cleanHive,
                        swormingState: .none,
                        notes: "",
                        dateOfCreation: .now
                    )],
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    ),
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    ),
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    )
                ]
            ),
            .init(
                name: "SecondApiaryName",
                city: "Plovdiv",
                registrationNumber: "123qwerty456",
                apiaryDescription: "Veri hot Apiary",
                hives: [
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 12,
                        image: "Image"
                    ),
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 12,
                        image: "Image"
                    ),
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    ),
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    )
                ]
            ),
            .init(
                name: "ThirdApiaryName",
                city: "Varna",
                registrationNumber: "123qwerty456",
                apiaryDescription: "Veri salty Apiary",
                hives: [
                    .init(
                        inspections: [.init(
                            haveBrood: false,
                            haveQueen: false,
                            haveHoney: false,
                            havePolen: false,
                            numbersOfFrames: 10,
                            haveFreeFrames: false,
                            numberOfFreeFrames: 0,
                            areEggsPresented: false,
                            areQueenCellsPresented: false,
                            areDroneCellsPresented: false,
                            colonyStrenght: .medium,
                            broodPattern: .solid,
                            beeBehavior: .calm,
                            pestsAndDiseases: .ants,
                            hiveHygiene: .cleanHive,
                            swormingState: .none,
                            notes: "",
                            dateOfCreation: .now
                        )],
                        hiveType: .dadant,
                        numberOfFrames: 8,
                        image: "Image"
                    )
                ]
            )
        ]
    }
}
