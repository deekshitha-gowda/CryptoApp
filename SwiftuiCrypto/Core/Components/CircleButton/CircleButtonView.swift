import SwiftUI

struct CircleButtonView : View {
    let iconName : String
    
    var body: some View {
        Image(systemName: iconName)
            .frame(width: 50, height: 50)
            .background(
                Circle().foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10).padding()
    }
}

struct CircleButtonView_Previews : PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "info")
            .padding()
        CircleButtonView(iconName: "plus")
            .padding().colorScheme(.dark)
    }
}
