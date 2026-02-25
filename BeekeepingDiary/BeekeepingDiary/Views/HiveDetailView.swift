//
//  HiveDetailView.swift
//  BeekeepingDiary
//
//  Created by Ivan Stefanov on 25.02.26.
//

import SwiftUI

struct HiveDetailView: View {
    let hive: Hive
    @State private var isAddNewInspectionOpened = false
    
    init(hive: Hive) {
        self.hive = hive
    }
    
    var body: some View {
//        Text(hive.hiveType.rawValue)
//        Text(hive.numberOfFrames.description)
        NavigationStack {
            List {
                Section {
                    Label("viewModel.apiary.name", systemImage: "leaf")
                    Text(hive.hiveType.rawValue)
                    Text(hive.numberOfFrames.description)
                }
                
                if ((hive.inspections?.isEmpty) != nil) {
                    Section("Inspections") {
                        ForEach(hive.inspections ?? []) { inspection in
                            NavigationLink {
//                                InspectionDetailView(inspection: inspection)
                                Text("InspectionDetailView")
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(inspection.dateOfCreation.formatted())
                                        .fontWeight(.bold)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddNewInspectionOpened.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
//                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddNewInspectionOpened) {
//                AddNewInspectionView()
                Text("AddNewInspectionView()")
            }
        }
    }
}

#Preview {
    HiveDetailView(
        hive: .init(
            inspections: [.init(
                haveBrood: true,
                haveQueen: true,
                haveHoney: true,
                havePolen: true,
                numbersOfFrames: 10,
                haveFreeFrames: false,
                numberOfFreeFrames: 0,
                areEggsPresented: true,
                areQueenCellsPresented: false,
                areDroneCellsPresented: true,
                colonyStrenght: .medium,
                broodPattern: .solid,
                beeBehavior: .calm,
                pestsAndDiseases: .none,
                hiveHygiene: .cleanHive,
                swormingState: .none,
                notes: "some Notes"
            )],
            hiveType: .dadant,
            numberOfFrames: 10,
            image: "String"
        )
    )
}
