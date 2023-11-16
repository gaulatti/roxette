import SwiftUI

struct ContentView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel
    @State private var currentView: ViewsEnum = .home
    @State private var isAnimating: Bool = false
    
    
    func isNearEdge(_ start: CGPoint, _ end: CGPoint, in size: CGSize) -> Void {
        let edgeThreshold: CGFloat = 20.0
        let switchThreshold: CGFloat = 125
        let switchDistance: CGFloat = 60
        
        let distance = (pow(end.x - start.x, 2) + pow(end.y - start.y, 2)).squareRoot()
        let isSidebarClosed = globalState.currentSidebar == .none
        let isPlaylist = globalState.currentSidebar == .playlist
        let isMenu = globalState.currentSidebar == .menu
        
        if(!isAnimating) {
            if(!isSidebarClosed) {
                /**
                 * Switch from Left
                 */
                if(start.x <= switchThreshold && isPlaylist) {
                    if (distance > switchDistance) {
                        /**
                         * Switch from Left
                         */
                        print("Switch from Left", start.x, distance)
                        isAnimating.toggle()
                        withAnimation(.easeInOut(duration: 0.4)) {
                            globalState.currentSidebar = .menu
                        }
                    } else {
                        /**
                         * Close from Left
                         */
                        print("Close from Left", start.x, distance)
                        isAnimating.toggle()
                        withAnimation(.easeInOut(duration: 0.4)) {
                            globalState.currentSidebar = .none
                        }
                    }
                }
                
                
                if(start.x >= size.width - switchThreshold && isMenu) {
                    if (distance > switchDistance) {
                        /**
                         * Switch from Right
                         */
                        print("Switch from Right", start.x, distance)
                        isAnimating.toggle()
                        withAnimation(.easeInOut(duration: 0.4)) {
                            globalState.currentSidebar = .playlist
                        }
                    } else {
                        /**
                         * Close from Right
                         */
                        print("Close from Right", start.x, distance)
                        isAnimating.toggle()
                        withAnimation(.easeInOut(duration: 0.4)) {
                            globalState.currentSidebar = .none
                        }
                    }
                }
                
            } else {
                /**
                 * Open from Left
                 */
                if(isSidebarClosed && start.x <= edgeThreshold) {
                    print("Open from Left", start.x, distance)
                    isAnimating.toggle()
                    withAnimation(.easeInOut(duration: 0.4)) {
                            globalState.currentSidebar = .menu
                    }
                } else
                
                /**
                 * Open from Right
                 */
                if(isSidebarClosed && start.x >= size.width - edgeThreshold) {
                    print("Open from Right", start.x, distance)
                    isAnimating.toggle()
                    withAnimation(.easeInOut(duration: 0.4)) {
                            globalState.currentSidebar = .playlist
                    }
                }
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                if(isAnimating) {
                    
                    isAnimating.toggle()
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
                            self.isNearEdge(value.startLocation, value.location, in: geometry.size)
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
