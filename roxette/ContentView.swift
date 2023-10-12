import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            if showMenu {
                MenuView(showMenu: $showMenu)
                    .id("menu")
            }
                    
            MainView(showMenu: $showMenu)
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
