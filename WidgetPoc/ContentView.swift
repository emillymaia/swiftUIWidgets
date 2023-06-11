import SwiftUI

struct ContentView: View {
    
    let teamData: [Team] = TeamProvider.challengeTeam()
    @State private var details: Bool = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(teamData, content: { i in
                    Button(action: {
                        details.toggle()
                    }, label: {
                        TeamItemView(emoji: i.emoji, name: i.name)
                    })
                    .sheet(isPresented: $details) {
                        TeamDescriptionview(team: i)
                    }
                })
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("My Team")
        }
    }
}

struct TeamItemView: View {
    
    let emoji: String
    let name: String
    
    var body: some View {
        Text("\(emoji) \(name)")
            .font(.largeTitle)
            .padding([.top, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
