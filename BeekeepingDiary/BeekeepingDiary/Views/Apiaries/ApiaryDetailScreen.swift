//
//  ApiaryDetailView.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 11.02.26.
//

import SwiftUI

struct ApiaryDetailScreen: View {
    
    @State private var viewModel: ApiaryDetailViewModel
    
    init(apiary: Apiary) {
        viewModel = ApiaryDetailViewModel(apiary: apiary)
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Label(viewModel.apiary.name, systemImage: "leaf")
                    Label(viewModel.apiary.city, systemImage: "mappin.and.ellipse")
                    Label(viewModel.apiary.registrationNumber, systemImage: "number")
                    Label(viewModel.apiary.hiveDescription, systemImage: "text.alignleft")
                    Label(viewModel.apiary.hives.count.description, systemImage: "square.grid.2x2")
                }
                
                Section("Hives") {
                    ForEach(viewModel.sortedHivesByFrames) { hive in
                        NavigationLink {
                            HiveDetailScreen(hive: hive)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(hive.hiveType.rawValue)
                                    .fontWeight(.bold)
                                Text("number of frames: \(hive.numberOfFrames)")
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ApiaryDetailScreen(
        apiary: .init(
            name: "Apiary Name",
            city: "Sofia",
            registrationNumber: "123qwerty456",
            hiveDescription: "The best apiary",
            hives: [.init(
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
                image: ""
            )]
        )
    )
}
