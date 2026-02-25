//
//  DashboardViewModel.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 4.02.26.
//

import Foundation
import Observation

@Observable
class DashboardViewModel {
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
                description: "Veri nice Apiary",
                hives: [
                    .init(
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    ),
                    .init(
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    ),
                    .init(
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
                description: "Veri hot Apiary",
                hives: [
                    .init(
                        hiveType: .dadant,
                        numberOfFrames: 12,
                        image: "Image"
                    ),
                    .init(
                        hiveType: .dadant,
                        numberOfFrames: 12,
                        image: "Image"
                    ),
                    .init(
                        hiveType: .dadant,
                        numberOfFrames: 10,
                        image: "Image"
                    ),
                    .init(
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
                description: "Veri salty Apiary",
                hives: [
                    .init(
                        hiveType: .dadant,
                        numberOfFrames: 8,
                        image: "Image"
                    )
                ]
            )
        ]
    }
}
