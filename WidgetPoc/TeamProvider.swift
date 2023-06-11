import Foundation

public struct TeamProvider {
    
   static func challengeTeam() -> [Team] {
        return [
            Team(
                emoji: "😼",
                 name: "Calisto",
                 description: "Calisto é um dos devs da equipe, ele também é responsável pelos testes unitários."),
            Team(
                emoji: "🎨",
                 name: "Helena",
                 description: "Helena é a designer da equipe, ela cuida de toda a parte criativa, visual e determina o escopo do app."),
            Team(
                emoji: "🚀",
                name: "Gabriel",
                description: "Gabriel é um dos devs da equipe e é responssável por decidir a arquitetura e padrões de projetos a serem seguidos."),
            Team(
                emoji: "💎",
                name: "Emilly",
                description: "Emilly uma das devs da equipe e cuida da camada que contém as regras de negócio do app."),
            Team(emoji: "😈",
                 name: "Yago",
                 description: "Yago lead é um dos devs da equipe e cuida do gerenciamento do projeto.")
        ]
    }
    
    static func randomPersonOfTeam() -> Team {
        let allTeam = TeamProvider.challengeTeam()
        let randomIndex = Int.random(in: 0..<allTeam.count)
        
        return allTeam[randomIndex]
    }
}
