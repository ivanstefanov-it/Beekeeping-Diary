import SwiftUI

struct ApiaryDetailScreen: View {
    
    @State private var viewModel: ApiaryDetailViewModel
    @State private var isAddNewHiveOpened = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Apiary card
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.apiary.name)
                                .font(.title3.bold())

                            Text("\(viewModel.apiary.city) • Hives: \(viewModel.apiary.hives.count)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image(systemName: "box.truck.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }

                    Text("Reg. No. \(viewModel.apiary.registrationNumber)")
                        .foregroundColor(.secondary)
                }
                .padding(24)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color(.secondarySystemGroupedBackground))
                )
                .padding(.horizontal)

                // Hives section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Hives")
                        .font(.title2.bold())
                        .padding(.horizontal)

                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.sortedHivesByFrames) { hive in
                            NavigationLink {
                                HiveDetailScreen(hive: hive)
                            } label: {
                                HStack(spacing: 12) {

                                    if let data = hive.image,
                                       let uiImage = UIImage(data: data) {

                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))

                                    } else {
                                        Image("default_image")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                    }

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(hive.hiveType.rawValue)
                                            .font(.headline)

                                        Text("Number of frames: \(hive.numberOfFrames)")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }

                                    Spacer()
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(.secondarySystemGroupedBackground))
                                )
                                .padding(.horizontal)
                            }
                            .buttonStyle(.plain)
                            .contextMenu {
                                Button(role: .destructive) {
                                    if let index = viewModel.sortedHivesByFrames.firstIndex(where: { $0.id == hive.id }) {
                                        withAnimation {
                                            viewModel.delete(
                                                modelContext: modelContext,
                                                IndexSet(integer: index)
                                            )
                                        }
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top)
        }
        .background(Color(.systemGroupedBackground))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add new hive") {
                    isAddNewHiveOpened.toggle()
                }
            }
        }
        .sheet(isPresented: $isAddNewHiveOpened) {
            NavigationStack {
                AddNewHiveScreen(apiary: viewModel.apiary)
            }
        }
    }

    init(apiary: Apiary) {
        _viewModel = State(initialValue: ApiaryDetailViewModel(apiary: apiary))
    }
}

#Preview {
    ApiaryDetailScreen(
        apiary: .init(
            name: "Apiary Name",
            city: "Sofia",
            registrationNumber: "123qwerty456",
            hives: [.init(
                inspections: [.init(
                    haveQueen: false,
                    numbersOfOccupiedFrames: 10,
                    areEggsPresented: false,
                    areQueenCellsPresented: false,
                    areDroneCellsPresented: false,
                    numberOfFreeFrames: .none,
                    pollen: .none,
                    honey: .none,
                    cappedBrood: .none,
                    uncappedBrood: .none,
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
                image: nil
            )]
        )
    )
}
