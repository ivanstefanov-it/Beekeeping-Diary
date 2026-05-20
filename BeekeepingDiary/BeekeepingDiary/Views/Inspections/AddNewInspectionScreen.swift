import SwiftUI

struct AddNewInspectionScreen: View {
    @State private var viewModel = CreateNewInspectionViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                
                // The View should look like:
                // TextField for how many frame are occupied with bees
                // Slider for CappedBrood
                // Slider for UncappedBrood
                // Slider for Honey
                // Slider for Pollen
                // Slider for NumberOfFreeFrames
                // Yes/No for Queen ✅
                // Yes/No for Eggs ✅
                // Yes/No for QueenCells ✅
                // Yes/No for DroneCells ✅
                // Menu for ColonyStrenght ✅
                // Menu for BroodPattern ✅
                // Menu for BeeBehavior ✅
                // Menu for Pets ✅
                // Menu for HiveHigiene ✅
                // Menu for SwarmState  ✅
                // TextField for Notes
                // DatePicker for DateOfCreation
                
                
                // ✅ TODO: Extract this chips into a component
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("Free space")
//                        .font(.title3.bold())
//
//                    Text("How many frames have free space left?")
//                        .foregroundStyle(.secondary)
//
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 10) {
//                            ForEach(Inspections.ColonyStrenght.allCases) { option in
//                                let isSelected = viewModel.inspection.colonyStrenght == option
//
//                                Button {
//                                    withAnimation(.smooth(duration: 0.2)) {
//                                        viewModel.inspection.colonyStrenght = option
//                                    }
//                                } label: {
//                                    Text(option.rawValue)
//                                        .font(.subheadline.weight(.medium))
//                                        .foregroundStyle(
//                                            isSelected ? .white : .primary
//                                        )
//                                        .padding(.horizontal, 18)
//                                        .padding(.vertical, 12)
//                                        .background(
//                                            Capsule()
//                                                .fill(
//                                                    isSelected
//                                                    ? Color.orange
//                                                    : Color.gray.opacity(0.12)
//                                                )
//                                        )
//                                }
//                                .buttonStyle(.plain)
//                            }
//                        }
//                    }
//                }
                // ✅
                
                HStack {
                    Text("Is the queen presented?")
                    Spacer()
                    Picker("", selection: $viewModel.inspection.haveQueen) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                HStack {
                    Text("Are eggs presented?")
                    Spacer()
                    Picker("", selection: $viewModel.inspection.areEggsPresented) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                HStack {
                    Text("Are queen cells presented?")
                    Spacer()
                    Picker("", selection: $viewModel.inspection.areQueenCellsPresented) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                HStack {
                    Text("Are drone cells presented?")
                    Spacer()
                    Picker("", selection: $viewModel.inspection.areDroneCellsPresented) {
                        Text("Yes").tag(true)
                        Text("No").tag(false)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("How strong do you estimate the colony?")
                        .font(.title3.bold())

                    Menu {
                        ForEach(Inspections.ColonyStrenght.allCases) { option in
                            Button {
                                viewModel.inspection.colonyStrenght = option
                            } label: {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.inspection.colonyStrenght?.rawValue
                                 ?? "Select...")
                                .foregroundStyle(
                                    viewModel.inspection.colonyStrenght == nil
                                    ? .secondary
                                    : .primary
                                )

                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Brood pattern")
                        .font(.title3.bold())

                    Menu {
                        ForEach(Inspections.BroodPattern.allCases) { option in
                            Button {
                                viewModel.inspection.broodPattern = option
                            } label: {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.inspection.broodPattern?.rawValue
                                 ?? "Select...")
                                .foregroundStyle(
                                    viewModel.inspection.broodPattern == nil
                                    ? .secondary
                                    : .primary
                                )

                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Bee behavior")
                        .font(.title3.bold())

                    Menu {
                        ForEach(Inspections.BeeBehavior.allCases) { option in
                            Button {
                                viewModel.inspection.beeBehavior = option
                            } label: {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.inspection.beeBehavior?.rawValue
                                 ?? "Select...")
                                .foregroundStyle(
                                    viewModel.inspection.beeBehavior == nil
                                    ? .secondary
                                    : .primary
                                )

                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Pets and diseases")
                        .font(.title3.bold())

                    Menu {
                        ForEach(Inspections.PestsAndDiseases.allCases) { option in
                            Button {
                                viewModel.inspection.pestsAndDiseases = option
                            } label: {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.inspection.pestsAndDiseases?.rawValue
                                 ?? "Select...")
                                .foregroundStyle(
                                    viewModel.inspection.pestsAndDiseases == nil
                                    ? .secondary
                                    : .primary
                                )

                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Hive higiene")
                        .font(.title3.bold())

                    Menu {
                        ForEach(Inspections.HiveHygiene.allCases) { option in
                            Button {
                                viewModel.inspection.hiveHygiene = option
                            } label: {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.inspection.hiveHygiene?.rawValue
                                 ?? "Select...")
                                .foregroundStyle(
                                    viewModel.inspection.hiveHygiene == nil
                                    ? .secondary
                                    : .primary
                                )

                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Swarm state")
                        .font(.title3.bold())

                    Menu {
                        ForEach(Inspections.SwormState.allCases) { option in
                            Button {
                                viewModel.inspection.swormingState = option
                            } label: {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        HStack {
                            Text(viewModel.inspection.swormingState?.rawValue
                                 ?? "Select...")
                                .foregroundStyle(
                                    viewModel.inspection.swormingState == nil
                                    ? .secondary
                                    : .primary
                                )

                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        // Add to the list of inspections
                    }, label: {
                        Text("Add")
                    })
                }
            }
        }
    }
}

#Preview {
    AddNewInspectionScreen()
}

//
//import SwiftUI
//
//enum FreeSpace: String, CaseIterable, Identifiable {
//    case none = "None"
//    case oneFrame = "One frame"
//    case fewFrames = "Few frames"
//    case severalFrames = "Several frames"
//    case manyFrames = "Many frames"
//    case all = "All"
//
//    var id: Self { self }
//}
//
//struct ContentView: View {
//
//    @State private var selected: FreeSpace = .none
//
//    var body: some View {
//
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Free space")
//                .font(.title3.bold())
//
//            Text("How many frames have free space left?")
//                .foregroundStyle(.secondary)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 10) {
//                    ForEach(FreeSpace.allCases) { option in
//
//                        let isSelected = selected == option
//
//                        Button {
//                            withAnimation(.smooth(duration: 0.2)) {
//                                selected = option
//                            }
//                        } label: {
//                            Text(option.rawValue)
//                                .font(.subheadline.weight(.medium))
//                                .foregroundStyle(
//                                    isSelected ? .white : .primary
//                                )
//                                .padding(.horizontal, 18)
//                                .padding(.vertical, 12)
//                                .background(
//                                    Capsule()
//                                        .fill(
//                                            isSelected
//                                            ? Color.orange
//                                            : Color.gray.opacity(0.12)
//                                        )
//                                )
//                        }
//                        .buttonStyle(.plain)
//                    }
//                }
//            }
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
