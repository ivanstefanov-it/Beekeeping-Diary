import SwiftUI

struct AddNewInspectionScreen: View {
    @State private var viewModel = CreateNewInspectionViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Amount of frames occupied with bees")
                        .font(.headline)
                    
                    //                    TextField("0", value: $viewModel.inspection.numbersOfOccupiedFrames, format: .number)
                    //                        .keyboardType(.numberPad)
                    //                        .padding()
                    //                        .background(
                    //                            RoundedRectangle(cornerRadius: 14)
                    //                                .fill(Color.gray.opacity(0.1))
                    //                        )
                    
                    Stepper(
                        "\(viewModel.inspection.numbersOfOccupiedFrames)",
                        value: $viewModel.inspection.numbersOfOccupiedFrames,
                        in: 0...30
                    )
                    .padding()
                }
                
                frameCountSection(title: "Capped Brood", subtitle: "How many frames have capped brood?", selection: $viewModel.inspection.cappedBrood)
                
                frameCountSection(title: "Uncapped Brood", subtitle: "How many frames have uncapped brood?", selection: $viewModel.inspection.uncappedBrood)
                
                frameCountSection(title: "Honey", subtitle: "How many frames contain honey?", selection: $viewModel.inspection.honey)
                
                frameCountSection(title: "Polen", subtitle: "How many frames contain pollen?", selection: $viewModel.inspection.pollen)
                
                frameCountSection(title: "Free space", subtitle: "How many frames have free space left?", selection: $viewModel.inspection.numberOfFreeFrames)
                
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
                
                TextField("Notes", text: $viewModel.inspection.notes,  axis: .vertical)
                    .lineLimit(5...10)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.gray.opacity(0.1))
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
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
    
    func frameCountSection(title: String, subtitle: String, selection: Binding<Inspections.FramesCount>) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.title3.bold())
            
            Text(subtitle)
                .foregroundStyle(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(Inspections.FramesCount.allCases) { option in
                        let isSelected = selection.wrappedValue == option
                        
                        Button {
                            withAnimation(.smooth(duration: 0.2)) {
                                selection.wrappedValue = option
                            }
                        } label: {
                            Text(option.rawValue)
                                .font(.subheadline.weight(.medium))
                                .foregroundStyle(
                                    isSelected ? .white : .primary
                                )
                                .padding(.horizontal, 18)
                                .padding(.vertical, 12)
                                .background(
                                    Capsule()
                                        .fill(
                                            isSelected
                                            ? Color.orange
                                            : Color.gray.opacity(0.12)
                                        )
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewInspectionScreen()
}
