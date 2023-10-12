import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var showPlaylist = false
    @State private var currentView: ViewsEnum = .home
    
    var body: some View {
        ZStack(alignment: .leading) {
            if showMenu {
                MenuView(showMenu: $showMenu, currentView: $currentView)
                    .id("menu")
            }
            
            if showPlaylist {
                MenuView(showMenu: $showMenu, currentView: $currentView)
                    .id("menu")
            }

            MainView(showMenu: $showMenu, showPlaylist: $showPlaylist, currentView: $currentView)
                .id("content")
                .onTapGesture {
                    withAnimation {
                        if(showMenu) {
                            self.showMenu.toggle()
                        }
                    }
                }
        }.background(showMenu ? Color.menuBackground : Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlayerViewModel.shared)
    }
}
