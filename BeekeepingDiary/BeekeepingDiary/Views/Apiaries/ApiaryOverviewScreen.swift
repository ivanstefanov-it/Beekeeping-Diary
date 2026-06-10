import SwiftUI
import SwiftData

struct ApiaryOverviewScreen: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = ApiaryOverviewViewModel()
    @Query private var apiaries: [Apiary] //✅
    @State private var isShowingCreateScreen = false
    
    var body: some View {
        let _ = print(URL.applicationSupportDirectory.path())
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
            .onDelete { item in
                withAnimation {
                    viewModel.delete(modelContext: modelContext, item, apiaries: apiaries)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Beekeeping diary")
        
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
