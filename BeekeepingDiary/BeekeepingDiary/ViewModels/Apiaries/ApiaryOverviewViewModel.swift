//
//  DashboardViewModel.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 4.02.26.
//

import Foundation
import Observation

@Observable
class ApiaryOverviewViewModel {
    var allApiaries: [Apiary] = []
    
    init() { }
    
    func load() {
        mockSomeInitialData()
    }
    
    private func mockSomeInitialData() {
        allApiaries = [
            .init(
                name: "ApiaryName",
                city: "Sofia",
                registrationNumber: "123qwerty456",
                hiveDescription: "Veri nice Apiary",
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
                hiveDescription: "Veri hot Apiary",
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
                hiveDescription: "Veri salty Apiary",
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
