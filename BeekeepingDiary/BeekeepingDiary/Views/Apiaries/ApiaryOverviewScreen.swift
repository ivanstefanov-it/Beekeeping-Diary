import SwiftUI
import SwiftData

struct ApiaryOverviewScreen: View {
    @Environment(\.modelContext) private var context
//    @State private var viewModel = ApiaryOverviewViewModel()
    @Query private var apiaries: [Apiary]
    @State private var isShowingCreateScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(apiaries) { apiary in
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
            
            HStack {
                Button {
                    isShowingCreateScreen = true
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
        }
//        .onAppear {
//            viewModel.load(context: context)
//        }
        .sheet(isPresented: $isShowingCreateScreen) {
            NavigationStack {
                CreateNewApiaryScreen()
            }
        }
    }
}

#Preview {
    ApiaryOverviewScreen()
}
