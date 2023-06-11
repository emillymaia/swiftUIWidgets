import SwiftUI

struct TeamDescriptionview: View {
    var team: Team
    
    var body: some View {
        ZStack {
            Color(UIColor.lightGray).edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading) {
                    Text(team.description)
                        .padding([.leading, .trailing, .bottom])
                        .font(.title2)
                }
            }
            .foregroundColor(.white)
        }
    }
}
