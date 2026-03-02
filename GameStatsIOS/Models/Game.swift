import Foundation

struct Game: Identifiable, Codable {
    let id: UUID
    var homeTeam: Team
    var awayTeam: Team
    var innings: [Inning]
    var currentInning: Int
    var status: GameStatus
    var createdDate: Date
    
    init(homeTeam: Team, awayTeam: Team) {
        self.id = UUID()
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.innings = Array(repeating: Inning(), count: 9)
        self.currentInning = 1
        self.status = .inProgress
        self.createdDate = Date()
    }
}

struct Team: Identifiable, Codable {
    let id: UUID
    var name: String
    var players: [Player]
    var runs: Int = 0
    
    init(name: String, players: [Player] = []) {
        self.id = UUID()
        self.name = name
        self.players = players
    }
}

struct Player: Identifiable, Codable {
    let id: UUID
    var name: String
    var number: Int
    var stats: PlayerStats
    
    init(name: String, number: Int) {
        self.id = UUID()
        self.name = name
        self.number = number
        self.stats = PlayerStats()
    }
}

struct PlayerStats: Codable {
    var hits: Int = 0
    var runs: Int = 0
    var errors: Int = 0
    var rbis: Int = 0
    var strikeouts: Int = 0
    var walks: Int = 0
}

struct Inning: Codable {
    var homeRuns: Int = 0
    var awayRuns: Int = 0
}

enum GameStatus: String, Codable {
    case notStarted
    case inProgress
    case completed
}