import SwiftUI

struct WidgetView: View {
    
    var team: Team
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(team.emoji)
                    .font(.system(size: 60))
                Text(team.name)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing])
                    .foregroundColor(.white)
            }
        }
    }
}

