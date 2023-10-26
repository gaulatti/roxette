import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel
    @State private var currentView: ViewsEnum = .home
    
    func isNearEdge(_ point: CGPoint, in size: CGSize) -> Void {
        let edgeThreshold: CGFloat = 20.0
        if(point.x <= edgeThreshold) {
            withAnimation{
                if(globalState.currentSidebar == .playlist) {
                    globalState.currentSidebar = .none
                } else {
                    globalState.currentSidebar = .menu
                }
            }
        } else if (point.x >= size.width - edgeThreshold) {
            withAnimation{
                print(globalState.currentSidebar == .menu)
                if(globalState.currentSidebar == .menu) {
                    globalState.currentSidebar = .none
                } else {
                    globalState.currentSidebar = .playlist
                }
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                if globalState.currentSidebar == .menu {
                    MenuView(currentView: $currentView)
                        .id("menu")
                }
                
                if globalState.currentSidebar == .playlist {
                    PlaylistView()
                        .id("playlist")
                }
                
                MainView(currentView: $currentView)
                    .id("content")
                    .onTapGesture {
                        withAnimation {
                            if(globalState.isAnySidebarOpen()) {
                                globalState.currentSidebar = .none
                            }
                        }
                    }
            }.background(globalState.isAnySidebarOpen() ? Color.menuBackground : Color.white)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { value in
                            self.isNearEdge(value.startLocation, in: geometry.size)
                        }
                )
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environmentObject(PlayerViewModel.shared)
        .environmentObject(GlobalStateViewModel.shared)
}
