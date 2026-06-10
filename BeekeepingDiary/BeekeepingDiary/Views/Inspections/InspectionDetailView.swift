import SwiftUI

struct InspectionDetailView: View {
    @State private var viewModel: InspectionDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                HeaderCard(inspection: viewModel.inspection)
                
                OverviewCard(inspection: viewModel.inspection)
                
                ResourcesCard(inspection: viewModel.inspection)
                
                HealthCard(inspection: viewModel.inspection)
                
                if !viewModel.inspection.notes.isEmpty {
                    NotesCard(notes: viewModel.inspection.notes)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Inspection")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(inspection: Inspections) {
        self.viewModel = InspectionDetailViewModel(inspection: inspection)
    }
}

struct CardView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct HeaderCard: View {
    let inspection: Inspections

    var body: some View {
        CardView {
            VStack(alignment: .leading, spacing: 12) {

                Text(inspection.dateOfCreation.formatted(
                    date: .abbreviated,
                    time: .omitted
                ))
                .font(.subheadline)
                .foregroundStyle(.secondary)

                HStack(spacing: 12) {

                    StatusPill(
                        title: inspection.haveQueen
                        ? "Queen Present"
                        : "No Queen",
                        systemImage: "crown.fill",
                        tint: inspection.haveQueen ? .yellow : .red
                    )

                    if let strength = inspection.colonyStrenght {
                        StatusPill(
                            title: strength.rawValue,
                            systemImage: "bolt.heart.fill",
                            tint: .orange
                        )
                    }
                }

                HStack {
                    Label(
                        "\(inspection.numbersOfOccupiedFrames) occupied frames",
                        systemImage: "square.grid.3x3.fill"
                    )

                    Spacer()

                    Text(inspection.numberOfFreeFrames.rawValue)
                        .foregroundStyle(.secondary)
                }
                .font(.subheadline)
            }
        }
    }
}

struct OverviewCard: View {
    let inspection: Inspections

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        CardView {
            SectionTitle(
                title: "Colony Overview",
                icon: "hexagon.fill"
            )

            LazyVGrid(columns: columns, spacing: 12) {

                MetricTile(
                    title: "Eggs",
                    value: inspection.areEggsPresented ? "Yes" : "No",
                    icon: "circle.fill"
                )

                MetricTile(
                    title: "Queen Cells",
                    value: inspection.areQueenCellsPresented ? "Yes" : "No",
                    icon: "crown"
                )

                MetricTile(
                    title: "Drone Cells",
                    value: inspection.areDroneCellsPresented ? "Yes" : "No",
                    icon: "ladybug.fill"
                )

                MetricTile(
                    title: "Swarming",
                    value: inspection.swormingState?.rawValue ?? "Unknown",
                    icon: "wind"
                )
            }
        }
    }
}

struct ResourcesCard: View {
    let inspection: Inspections

    var body: some View {
        CardView {
            SectionTitle(
                title: "Resources & Brood",
                icon: "leaf.fill"
            )

            ResourceRow(
                title: "Pollen",
                icon: "leaf.fill",
                value: inspection.pollen
            )

            ResourceRow(
                title: "Honey",
                icon: "drop.fill",
                value: inspection.honey
            )

            ResourceRow(
                title: "Capped Brood",
                icon: "circle.hexagongrid.fill",
                value: inspection.cappedBrood
            )

            ResourceRow(
                title: "Uncapped Brood",
                icon: "circle.dotted",
                value: inspection.uncappedBrood
            )
        }
    }
}

struct HealthCard: View {
    let inspection: Inspections

    var body: some View {
        CardView {
            SectionTitle(
                title: "Health & Behavior",
                icon: "heart.text.square.fill"
            )

            DetailRow(
                title: "Behavior",
                value: inspection.beeBehavior?.rawValue
            )

            DetailRow(
                title: "Brood Pattern",
                value: inspection.broodPattern?.rawValue
            )

            DetailRow(
                title: "Pests",
                value: inspection.pestsAndDiseases?.rawValue
            )

            DetailRow(
                title: "Hive Hygiene",
                value: inspection.hiveHygiene?.rawValue
            )
        }
    }
}

struct NotesCard: View {
    let notes: String

    var body: some View {
        CardView {
            SectionTitle(
                title: "Notes",
                icon: "note.text"
            )

            Text(notes)
                .font(.body)
        }
    }
}

struct SectionTitle: View {
    let title: String
    let icon: String

    var body: some View {
        Label(title, systemImage: icon)
            .font(.headline)
            .foregroundStyle(.primary)
    }
}

struct StatusPill: View {
    let title: String
    let systemImage: String
    let tint: Color

    var body: some View {
        Label(title, systemImage: systemImage)
            .font(.subheadline.weight(.medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(tint.opacity(0.15))
            .foregroundStyle(tint)
            .clipShape(Capsule())
    }
}

struct MetricTile: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(.orange)

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.tertiarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct DetailRow: View {
    let title: String
    let value: String?

    var body: some View {
        HStack {
            Text(title)

            Spacer()

            Text(value ?? "Unknown")
                .foregroundStyle(.secondary)
        }
    }
}

struct ResourceRow: View {
    let title: String
    let icon: String
    let value: Inspections.FramesCount

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Label(title, systemImage: icon)

                Spacer()

                Text(value.rawValue)
                    .foregroundStyle(.secondary)
            }

            ProgressView(value: value.progress)
        }
    }
}

extension Inspections.FramesCount {
    var progress: Double {
        switch self {
        case .none:
            return 0
        case .oneFrame:
            return 0.2
        case .fewFrames:
            return 0.4
        case .severalFrames:
            return 0.6
        case .manyFrames:
            return 0.8
        case .all:
            return 1.0
        }
    }
}

#Preview {
    InspectionDetailView(
        inspection: .init(
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
        )
    )
}
