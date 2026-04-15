import SwiftUI
import SwiftData

struct ApiaryOverviewScreen: View {
    @Environment(\.modelContext) private var context
    @State private var viewModel = ApiaryOverviewViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.allApiaries.isEmpty {
                HStack {
                    Button {
                        print("Open add new apiary screen")
                    } label: {
                        HStack {
                            Text("Add new apiary")
                            Image(systemName: "flame")
                        }
                        .frame(width: 190, height: 46)
                        .foregroundColor(.black)
                        .background(
                            LinearGradient(
                                colors: [.pink, .indigo],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(.capsule)
                    }
                }
            } else {
                List {
                    ForEach(viewModel.allApiaries) { apiary in
                        NavigationLink {
                            ApiaryDetailScreen(apiary: apiary)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(apiary.name)
                                    .fontWeight(.bold)
                                Text("number of hives: \(apiary.hives.count)")
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Beekeeping diary")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            viewModel.load(context: context)
        }
    }
}

#Preview {
    ApiaryOverviewScreen()
}
