
import UIKit

// Add players array of type [ String: Any ]
let playersInLeague = [
    [ "name": "Joe Smith", "height": 42, "experience": true, "guardian": "Jim and Jan Smith"],
    [ "name": "Jill Tanner", "height": 36, "experience": true, "guardian": "Clara Tanner" ],
    [ "name": "Bill Bon", "height": 43, "experience": true, "guardian": "Sara and Jenny Bon" ],
    [ "name": "Eva Gordon", "height": 45, "experience": false, "guardian": "Wendy and Mike Gordon" ],
    [ "name": "Matt Gill", "height": 40, "experience": false, "guardian": "Charles and Sylvia Gill" ],
    [ "name": "Kimmy Stein", "height": 41, "experience": false, "guardian": "Bill and Hillary Stein" ],
    [ "name": "Sammy Adams", "height": 45, "experience": false, "guardian": "Jeff Adams" ],
    [ "name": "Karl Saygan", "height": 42, "experience": true, "guardian": "Heather Bledsoe" ],
    [ "name": "Suzane Greenberg", "height": 44, "experience": true, "guardian": "Henrietta Dumas" ],
    [ "name": "Sal Dali", "height": 41, "experience": false, "guardian": "Gala Dali" ],
    [ "name": "Joe Kavalier", "height": 39, "experience": false, "guardian": "Sam and Elaine Kavalier" ],
    [ "name": "Ben Finkelstein", "height": 44, "experience": false, "guardian": "Aaron and Jill Finkelstein" ],
    [ "name": "Diego Soto", "height": 41, "experience": true, "guardian": "Robin and Sarika Soto" ],
    [ "name": "Chloe Alaska", "height": 47, "experience": false, "guardian": "David and Jamie Alaska" ],
    [ "name": "Arnold Willis", "height": 43, "experience": false, "guardian": "Claire Willis" ],
    [ "name": "Phillip Helm", "height": 44, "experience": true, "guardian": "Thomas Helm and Eva Jones" ],
    [ "name": "Les Clay", "height": 42, "experience": true, "guardian": "Wynonna Brown" ],
    [ "name": "Herschel Krustofski", "height": 45, "experience": true, "guardian": "Hyman and Rachel Krustofski"]
]
// Create each array needed for each team and one for letters for each player
var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []
var experiencedPlayers: [[String: Any]] = []
var inexperiencedPlayers: [[String: Any]] = []
var letters: [String] = []

// Some properties to avoid retyping strings or using magic numbers
let playerNameKey = "name"
let guardianNameKey = "guardian"
let playerExperienceKey = "experience"
let playerHeightKey = "height"
let teamDragonsName = "Dragons"
let teamSharksName = "Sharks"
let teamRaptorsName = "Raptors"
let dragonsPracticeTime = "March 17, 1pm"
let sharksPracticeTime = "March 17, 3pm"
let raptorsPracticeTime = "March 18, 1pm"
let theLeague = [teamRaptors, teamSharks, teamDragons]
let numberOfTeams = theLeague.count

// Helper function to sort players in the league into two teams based on experience
func sortIntoExperiencedTeams(from league: [[String: Any]]) {
    for player in league {
        if let hasExperience = player[playerExperienceKey] as? Bool {
            if hasExperience {
                experiencedPlayers.append(player)
            } else {
                inexperiencedPlayers.append(player)
            }
        }
    }
}

// Sort all the players in the league into experience and inexperienced teams
sortIntoExperiencedTeams(from: playersInLeague)

// Sort experienced players into order by height from low to high
experiencedPlayers.sort(by: { (firstPlayer, secondPlayer) -> Bool in
    let firstHeight = firstPlayer[playerHeightKey] as! Int
    let secondHeight = secondPlayer[playerHeightKey] as! Int
    return firstHeight < secondHeight
    })

// Sort inexperienced players into order by height from high to low, opposite of experienced otherwise
// heights are not distributed right.
inexperiencedPlayers.sort(by: { (firstPlayer, secondPlayer) -> Bool in
    let firstHeight = firstPlayer[playerHeightKey] as! Int
    let secondHeight = secondPlayer[playerHeightKey] as! Int
    return firstHeight > secondHeight
    })

// Helper function to sort a team into three even teams based number of teams in the league.
func sortIntoEvenTeams(team: [[String: Any]]) {
    var counter = 1
    for player in team {
        switch counter {
        case 1: teamSharks.append(player)
        case 2: teamRaptors.append(player)
        case 3: teamDragons.append(player)
        default:
            print("Counter is out of bounds")
        }
        if counter == numberOfTeams {
            counter = 1
        } else {
            counter += 1
        }
    }
}

// Sort into experienced and inexperienced teams.
sortIntoEvenTeams(team: experiencedPlayers)
sortIntoEvenTeams(team: inexperiencedPlayers)

func printTeamAverageHeight(team: [[String: Any]], teamName: String) {
    var totalHeight = 0
    for player in team {
        if let height = player[playerHeightKey] as? Int {
            totalHeight += height
        }
    }
    print("\(teamName) Team Average Height: \(totalHeight/team.count)")
}

// Helper function to create a personalized letter for each player and add it to the letters array
func createPersonalizedLetters(for team: [[String: Any]], teamName: String, practiceTime: String) {
    for player in team {
        if let playerName = player[playerNameKey], let guardians = player[guardianNameKey] {
            let letter = """
            Dear \(guardians),
            
            Welcome to another year! We are happy to inform you that \(playerName)
            has been placed on the \(teamName) team. Please make sure you are present
            at the first practice on \(practiceTime).
            
            See you soon!
            
            Team Coordinator
            
            """
            letters.append(letter)
            print(letter)
        }
    }
}

// Create personalized letters for each team
printTeamAverageHeight(team: teamDragons, teamName: teamDragonsName)
printTeamAverageHeight(team: teamRaptors, teamName: teamRaptorsName)
printTeamAverageHeight(team: teamSharks, teamName: teamSharksName)
print("")
createPersonalizedLetters(for: teamDragons, teamName: teamDragonsName, practiceTime: dragonsPracticeTime)
createPersonalizedLetters(for: teamRaptors, teamName: teamRaptorsName, practiceTime: raptorsPracticeTime)
createPersonalizedLetters(for: teamSharks, teamName: teamSharksName, practiceTime: sharksPracticeTime)






