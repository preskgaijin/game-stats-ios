import Foundation
import Combine

class GameViewModel: ObservableObject {
    @Published var game: Game
    @Published var selectedTeam: Team?
    @Published var errorMessage: String?
    
    init(game: Game = Game(homeTeam: Team(name: "Home"), awayTeam: Team(name: "Away"))) {
        self.game = game
    }
    
    // MARK: - Score Management
    func addRun(to team: Team, inning: Int) {
        if inning > 0 && inning <= game.innings.count {
            if team.id == game.homeTeam.id {
                game.innings[inning - 1].homeRuns += 1
                game.homeTeam.runs += 1
            } else {
                game.innings[inning - 1].awayRuns += 1
                game.awayTeam.runs += 1
            }
        }
    }
    
    func removeRun(from team: Team, inning: Int) {
        if inning > 0 && inning <= game.innings.count {
            if team.id == game.homeTeam.id {
                if game.innings[inning - 1].homeRuns > 0 {
                    game.innings[inning - 1].homeRuns -= 1
                    game.homeTeam.runs -= 1
                }
            } else {
                if game.innings[inning - 1].awayRuns > 0 {
                    game.innings[inning - 1].awayRuns -= 1
                    game.awayTeam.runs -= 1
                }
            }
        }
    }
    
    // MARK: - Player Statistics
    func updatePlayerStat(player: Player, stat: String, value: Int) {
        if let playerIndex = game.homeTeam.players.firstIndex(where: { $0.id == player.id }) {
            updateStat(in: &game.homeTeam.players[playerIndex], stat: stat, value: value)
        } else if let playerIndex = game.awayTeam.players.firstIndex(where: { $0.id == player.id }) {
            updateStat(in: &game.awayTeam.players[playerIndex], stat: stat, value: value)
        }
    }
    
    private func updateStat(in player: inout Player, stat: String, value: Int) {
        switch stat {
        case "hits":
            player.stats.hits = value
        case "runs":
            player.stats.runs = value
        case "errors":
            player.stats.errors = value
        case "rbis":
            player.stats.rbis = value
        case "strikeouts":
            player.stats.strikeouts = value
        case "walks":
            player.stats.walks = value
        default:
            break
        }
    }
    
    // MARK: - Game Control
    func advanceInning() {
        if game.currentInning < 9 {
            game.currentInning += 1
        }
    }
    
    func completeGame() {
        game.status = .completed
    }
}