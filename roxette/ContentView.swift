import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var currentView: ViewsEnum = .home
    
    var body: some View {
        ZStack(alignment: .leading) {
            MenuView(showMenu: $showMenu, currentView: $currentView)
                .id("menu")
            
            MainView(showMenu: $showMenu, currentView: $currentView)
                .id("content")
                .onTapGesture {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }
        }
        .background(Color.menuBackground)
        .edgesIgnoringSafeArea(.all)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
