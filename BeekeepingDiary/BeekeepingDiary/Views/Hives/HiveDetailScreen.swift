import SwiftUI

struct HiveDetailScreen: View {
    @State private var viewModel: HiveDetailViewModel
    @State private var isAddNewInspectionOpened = false
    @Environment(\.modelContext) private var modelContext
    
    private var sortedInspections: [Inspections] {
        viewModel.hive.inspections
            .sorted {
                $0.dateOfCreation > $1.dateOfCreation
            }
    }

    private var latestInspection: Inspections? {
        sortedInspections.first
    }
    
    
    // TODO: Fix the UI before Commit/Push ✅✅✅
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                HiveHeaderCard(hive: viewModel.hive)

                HiveStatsCard(hive: viewModel.hive)

                VStack(alignment: .leading, spacing: 12) {

                    HStack {
                        Text("Inspections")
                            .font(.title2.bold())
                            .padding(.horizontal)

                        Spacer()

                        Text("\(viewModel.hive.inspections.count)")
                            .foregroundStyle(.secondary)
                    }

                    if sortedInspections.isEmpty {

                        ContentUnavailableView(
                            "No inspections yet",
                            systemImage: "doc.text.magnifyingglass",
                            description: Text(
                                "Add your first hive inspection to start tracking colony health."
                            )
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)

                    } else {

                        LazyVStack(spacing: 12) {
                            ForEach(sortedInspections) { inspection in

                                NavigationLink {
                                    InspectionDetailView(
                                        inspection: inspection
                                    )
                                } label: {
                                    InspectionTimelineRow(
                                        inspection: inspection
                                    )
                                }
                                .buttonStyle(.plain)
                                .swipeActions {
                                    Button(
                                        role: .destructive
                                    ) {
                                        withAnimation {
                                            viewModel.delete(
                                                modelContext: modelContext,
                                                IndexSet(
                                                    integer: viewModel
                                                        .hive
                                                        .inspections
                                                        .firstIndex(where: {
                                                            $0.id == inspection.id
                                                        }) ?? 0
                                                )
                                            )
                                        }
                                    } label: {
                                        Label(
                                            "Delete",
                                            systemImage: "trash"
                                        )
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Hive")
//        .navigationBarTitleDisplayMode(.inline)

        // MARK: Add Inspection Button
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isAddNewInspectionOpened.toggle()
                } label: {
                    Text("Add new inspection")
                }
            }
        }
//        .safeAreaInset(edge: .bottom) {
//            Button {
//                isAddNewInspectionOpened = true
//            } label: {
//                Label(
//                    "Add Inspection",
//                    systemImage: "plus"
//                )
//                .frame(maxWidth: .infinity)
//            }
//            .buttonStyle(.borderedProminent)
//            .controlSize(.large)
//            .padding(.horizontal)
//            .padding(.top, 8)
//            .background(.ultraThinMaterial)
//        }

        .sheet(isPresented: $isAddNewInspectionOpened) {
            NavigationStack {
                AddNewInspectionScreen(
                    hive: viewModel.hive
                )
            }
        }
    }
    
    struct HiveHeaderCard: View {
        let hive: Hive
        @Environment(\.colorScheme) var colorScheme
        
        var cardGradient: LinearGradient {
            if colorScheme == .dark {
                LinearGradient(
                    colors: [
                        Color.orange.opacity(0.35),
                        Color(red: 0.45, green: 0.25, blue: 0.05).opacity(0.45)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            } else {
                LinearGradient(
                    colors: [.yellow.opacity(0.3), .orange.opacity(0.2)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }

        var body: some View {
            ZStack(alignment: .bottomLeading) {
                if let data = hive.image,
                   let image = UIImage(data: data) {

                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()

                } else {
                    cardGradient

                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Image("queen_bee")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 52, height: 52)

                                Circle()
                                    .fill(hive.queenColor.swiftUIColor)
                                    .frame(width: 18, height: 18)
                            }
                            
                            Image(systemName: "shippingbox.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(.orange.opacity(0.6))
                                .padding()
                        }
                    }
                }

                VStack(alignment: .leading) {
                    Text(hive.hiveType.rawValue)
                        .font(.title2.bold())

                    Text("\(hive.numberOfFrames) frames")

                    if let apiary = hive.apiary?.name {
                        Label(apiary, systemImage: "leaf.fill")
                    }
                }
                .padding()
                .foregroundStyle(.white)
            }
            .frame(height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 28))
        }
    }
    
    struct HiveStatsCard: View {
        let hive: Hive

        var latestInspection: Inspections? {
            hive.inspections
                .sorted { $0.dateOfCreation > $1.dateOfCreation }
                .first
        }

        var body: some View {
            CardView {
                HStack {

                    StatItem(
                        title: "Inspections",
                        value: "\(hive.inspections.count)"
                    )

                    Divider()

                    StatItem(
                        title: "Last Check",
                        value: latestInspection?
                            .dateOfCreation
                            .formatted(date: .abbreviated,
                                       time: .omitted)
                        ?? "-"
                    )

                    Divider()

                    StatItem(
                        title: "Strength",
                        value: latestInspection?
                            .colonyStrenght?
                            .rawValue
                        ?? "-"
                    )
                }
            }
        }
    }
    
    struct StatItem: View {
        let title: String
        let value: String
        var systemImage: String? = nil

        var body: some View {
            VStack(spacing: 8) {

                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.headline)
                }

                Text(value)
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct InspectionTimelineRow: View {
        let inspection: Inspections

        var body: some View {
            HStack(alignment: .top, spacing: 14) {

                Circle()
                    .fill(.orange)
                    .frame(width: 10)

                VStack(alignment: .leading, spacing: 6) {

                    Text(
                        inspection.dateOfCreation.formatted(
                            date: .abbreviated,
                            time: .omitted
                        )
                    )
                    .font(.headline)

                    Text(
                        inspection.colonyStrenght?
                            .rawValue
                        ?? "Unknown colony"
                    )
                    .foregroundStyle(.secondary)

                    if inspection.haveQueen {
                        Label(
                            "Queen Present",
                            systemImage: "crown.fill"
                        )
                        .font(.caption)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.tertiary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.secondarySystemGroupedBackground))
            )
        }
    }
    
    init(hive: Hive) {
        viewModel = HiveDetailViewModel(hive: hive)
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
            image: nil,
            queenColor: .red
        )
    )
}
