//
//  BeekeepingDiaryApp.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 5.12.25.
//

import SwiftUI
import SwiftData

@main
struct BeekeepingDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            ApiaryOverviewScreen()
        }
        .modelContainer(for: [Apiary.self, Hive.self, Inspections.self])
    }
}
