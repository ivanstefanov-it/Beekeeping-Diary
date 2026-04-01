//
//  HiveDetailViewModel.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 4.03.26.
//

import Foundation
import Observation

@Observable
class HiveDetailViewModel {
    var hive: Hive
        
        init(hive: Hive) {
            self.hive = hive
        }
}
