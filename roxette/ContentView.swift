import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel
    @State private var currentView: ViewsEnum = .home

    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlayerViewModel.shared)
            .environmentObject(GlobalStateViewModel.shared)
    }
}
