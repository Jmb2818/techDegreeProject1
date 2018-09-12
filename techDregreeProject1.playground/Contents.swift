
import UIKit


let playersInLeague = [
    [
        "name": "Joe Smith",
        "height": "42",
        "experience": "yes",
        "guardian": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": "36",
        "experience": "yes",
        "guardian": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": "43",
        "experience": "yes",
        "guardian": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": "45",
        "experience": "no",
        "guardian": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": "40",
        "experience": "no",
        "guardian": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": "41",
        "experience": "no",
        "guardian": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": "45",
        "experience": "no",
        "guardian": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": "42",
        "experience": "yes",
        "guardian": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": "44",
        "experience": "yes",
        "guardian": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": "41",
        "experience": "no",
        "guardian": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": "39",
        "experience": "no",
        "guardian": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": "44",
        "experience": "no",
        "guardian": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": "41",
        "experience": "yes",
        "guardian": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": "47",
        "experience": "no",
        "guardian": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": "43",
        "experience": "no",
        "guardian": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": "44",
        "experience": "yes",
        "guardian": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": "42",
        "experience": "yes",
        "guardian": "Wynonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": "45",
        "experience": "yes",
        "guardian": "Hyman and Rachel Krustofski"
    ]
]

var teamDragons: [[String: String]] = []
var teamSharks: [[String: String]] = []
var teamRaptors: [[String: String]] = []
var experiencedPlayers: [[String: String]] = []
var inexperiencedPlayers: [[String: String]] = []

func sortIntoExperiencedTeams(from league: [[String: String]]) {
    for player in league {
        if player["experience"] == "yes" {
            experiencedPlayers.append(player)
        } else {
            inexperiencedPlayers.append(player)
        }
    }
}
sortIntoExperiencedTeams(from: playersInLeague)

func sortIntoEvenTeams(teamToSort: [[String: String]]) {
    var endIndex = (teamToSort.count - 1)
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
sortIntoEvenTeams(teamToSort: experiencedPlayers)
sortIntoEvenTeams(teamToSort: inexperiencedPlayers)

func printPretty(with array: [[String: String]], named: String) {
    var allHeight = 0
    print("Team \(named) Roster")
    print("__________________________________________")
    print("")
    for player in array {
        if let name = player["name"], let height = player["height"] {
            print(name)
            if let intHeight = Int(height){
              allHeight += intHeight
            }
        } else {
            print("Not a valid team")
        }
    }
    print("")
    print("\(allHeight/6)")
}

printPretty(with: teamDragons, named: "Dragons")
printPretty(with: teamRaptors, named: "Raptors")
printPretty(with: teamSharks, named: "Sharks")

