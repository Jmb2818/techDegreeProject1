
import UIKit

// Add players array of type [ String: Any ]
let playersInLeague = [
    [ "name": "Joe Smith", "height": 42.0, "experience": true, "guardian": "Jim and Jan Smith"],
    [ "name": "Jill Tanner", "height": 36.0, "experience": true, "guardian": "Clara Tanner" ],
    [ "name": "Bill Bon", "height": 43.0, "experience": true, "guardian": "Sara and Jenny Bon" ],
    [ "name": "Eva Gordon", "height": 45.0, "experience": false, "guardian": "Wendy and Mike Gordon" ],
    [ "name": "Matt Gill", "height": 40.0, "experience": false, "guardian": "Charles and Sylvia Gill" ],
    [ "name": "Kimmy Stein", "height": 41.0, "experience": false, "guardian": "Bill and Hillary Stein" ],
    [ "name": "Sammy Adams", "height": 45.0, "experience": false, "guardian": "Jeff Adams" ],
    [ "name": "Karl Saygan", "height": 42.0, "experience": true, "guardian": "Heather Bledsoe" ],
    [ "name": "Suzane Greenberg", "height": 44.0, "experience": true, "guardian": "Henrietta Dumas" ],
    [ "name": "Sal Dali", "height": 41.0, "experience": false, "guardian": "Gala Dali" ],
    [ "name": "Joe Kavalier", "height": 39.0, "experience": false, "guardian": "Sam and Elaine Kavalier" ],
    [ "name": "Ben Finkelstein", "height": 44.0, "experience": false, "guardian": "Aaron and Jill Finkelstein" ],
    [ "name": "Diego Soto", "height": 41.0, "experience": true, "guardian": "Robin and Sarika Soto" ],
    [ "name": "Chloe Alaska", "height": 47.0, "experience": false, "guardian": "David and Jamie Alaska" ],
    [ "name": "Arnold Willis", "height": 43.0, "experience": false, "guardian": "Claire Willis" ],
    [ "name": "Phillip Helm", "height": 44.0, "experience": true, "guardian": "Thomas Helm and Eva Jones" ],
    [ "name": "Les Clay", "height": 42.0, "experience": true, "guardian": "Wynonna Brown" ],
    [ "name": "Herschel Krustofski", "height": 45.0, "experience": true, "guardian": "Hyman and Rachel Krustofski"]
]
// Create each array needed for each team and one for letters for each player
var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []
var experiencedPlayers: [[String: Any]] = []
var inexperiencedPlayers: [[String: Any]] = []
var letters: [String] = []

// Some properties to avoid retyping strings
let playerNameKey = "name"
let guardianNameKey = "guardian"
let playerExperienceKey = "experience"
let teamDragonsName = "Dragons"
let teamSharksName = "Sharks"
let teamRaptorsName = "Raptors"
let dragonsPracticeTime = "March 17, 1pm"
let sharksPracticeTime = "March 17, 3pm"
let raptorsPracticeTime = "March 18, 1pm"

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

func sortIntoEvenTeams(teamToSort: [[String: Any]]) {
    // Find the endIndex of the team passed in to ensure correct amount of iterations
    // by getting the count and subtracting by 1 since Arrays start at 0.
    var endIndex = (teamToSort.count - 1)
    
    // Loop through the team passed in and sort them into the three teams as evenly as possible
    firstIteration: while endIndex >= 0 {
        teamRaptors.append(teamToSort[endIndex])
        endIndex -= 1
        while endIndex >= 0 {
            teamSharks.append(teamToSort[endIndex])
            endIndex -= 1
            while endIndex >= 0 {
                teamDragons.append(teamToSort[endIndex])
                endIndex -= 1
                continue firstIteration
            }
        }
    }
}

// Sort the experienced and inexperienced teams.
sortIntoEvenTeams(teamToSort: experiencedPlayers)
sortIntoEvenTeams(teamToSort: inexperiencedPlayers)

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
createPersonalizedLetters(for: teamDragons, teamName: teamDragonsName, practiceTime: dragonsPracticeTime)
createPersonalizedLetters(for: teamRaptors, teamName: teamRaptorsName, practiceTime: raptorsPracticeTime)
createPersonalizedLetters(for: teamSharks, teamName: teamSharksName, practiceTime: sharksPracticeTime)





