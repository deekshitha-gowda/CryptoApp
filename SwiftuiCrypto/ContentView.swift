import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("seconday")
                    .foregroundColor(Color.theme.secondaryText)
                Text("reD COLOR")
                    .foregroundColor(Color.theme.red)
                Text("gREEN")
                    .foregroundColor(Color.theme.green)
                
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
