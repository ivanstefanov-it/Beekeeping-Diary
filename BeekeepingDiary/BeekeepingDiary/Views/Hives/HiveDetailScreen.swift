import SwiftUI

struct HiveDetailScreen: View {
    @State private var viewModel: HiveDetailViewModel
    @State private var isAddNewInspectionOpened = false
    @Environment(\.modelContext) private var modelContext
    
    init(hive: Hive) {
        viewModel = HiveDetailViewModel(hive: hive)
    }
    
    var body: some View {
        List {
            Section {
                Label("viewModel.apiary.name", systemImage: "leaf")
                Text(viewModel.hive.hiveType.rawValue)
                Text(viewModel.hive.numberOfFrames.description)
            }
            
            if viewModel.hive.inspections.isEmpty {
                Text("No inspections yet")
            } else {
                Section("Inspections") {
                    ForEach(viewModel.hive.inspections) { inspection in
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
                    .onDelete { item in
                        viewModel.delete(modelContext: modelContext, item)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAddNewInspectionOpened.toggle()
                } label: {
                    Text("Add new inspection")
                }
            }
        }
        .sheet(isPresented: $isAddNewInspectionOpened) {
            NavigationStack {
                AddNewInspectionScreen(hive: viewModel.hive)
            }
        }
    }
}

#Preview {
    HiveDetailScreen(
        hive: .init(
            inspections: [.init(
                haveQueen: true,
                numbersOfOccupiedFrames: 10,
                areEggsPresented: true,
                areQueenCellsPresented: false,
                areDroneCellsPresented: true,
                numberOfFreeFrames: .none,
                pollen: .none,
                honey: .none,
                cappedBrood: .none,
                uncappedBrood: .none,
                colonyStrenght: .medium,
                broodPattern: .solid,
                beeBehavior: .calm,
                pestsAndDiseases: .none,
                hiveHygiene: .cleanHive,
                swormingState: .none,
                notes: "some Notes",
                dateOfCreation: .now
            )],
            hiveType: .dadant,
            numberOfFrames: 10,
            image: nil
        )
    )
}
