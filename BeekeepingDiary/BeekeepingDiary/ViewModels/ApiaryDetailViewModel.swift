//
//  ApiaryDetailViewModel.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 11.02.26.
//

import Foundation
import Observation

@Observable
class ApiaryDetailViewModel {
    var apiary: Apiary
    
    init(apiary: Apiary) {
        self.apiary = apiary
    }
    
    var sortedHivesByType: [Hive] {
        apiary.hives.sorted { $0.hiveType.rawValue < $1.hiveType.rawValue }
    }
    
    var sortedHivesByFrames: [Hive] {
        apiary.hives.sorted { $0.numberOfFrames < $1.numberOfFrames }
    }
}
