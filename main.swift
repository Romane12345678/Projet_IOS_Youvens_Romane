
import Foundation

print("\n\n==================================================")
print("            SYSTEME DE GESTION SCOLAIRE")
print("==================================================")

// Structures de données
var etudiants: [(id: String, nom: String, prenom: String, sexe: String, classe: String)] = []
var notes: [(idNote: Int, idEtd: String, francais: Double, math: Double, chimie: Double, physique: Double)] = []
var transactions: [(idTransaction: Int, idEtd: String, montantVerse: Double)] = []

// Constantes et variables globales
let montantFixe: Double = 15000
let coefficients = ["francais": 2.0, "math": 4.0, "chimie": 3.0, "physique": 4.0]
var idNoteCounter = 1
var idTransactionCounter = 1


// Fonction pour valider l'ID étudiant
func validerIdEtd(_ id: String) -> Bool {
    // Vérifier la longueur
    if id.count != 6 {
        return false
    }
    
    // Vérifier que le 1er caractère est 'E'
    let premier = id.first!
    if premier != "E" {
        return false
    }
    
    // Vérifier que les 5 suivants sont tous des chiffres
    let chiffres = id.dropFirst()  // supprime le 'E'
    for c in chiffres {
        if !c.isNumber {
            return false
        }
    }
    
    return true
}


// Fonction pour valider le nom et le prénom
func validerNomPrenom(_ texte: String) -> Bool {
    if texte.count < 3 {
        return false
    }
    
    for caractere in texte {
        if !(caractere >= "a" && caractere <= "z") && !(caractere >= "A" && caractere <= "Z" && caractere != " ") {
            return false
        }
    }
    return true
}


// Fonction pour valider le sexe
func validerSexe(_ sexe: String) -> Bool {
    return sexe == "M" || sexe == "F"
}


// Fonction pour valider la classe
func validerClasse(_ classe: String) -> Bool {
    return classe == "L1" || classe == "L2" || classe == "L3" || classe == "L4"
}


// Fonction pour valider les notes
func validerNote(_ note: Double) -> Bool {
    return note >= 0 && note <= 100
}


// Fonctions pour la gestion des étudiants
func ajouterEtudiant() {
    print("\n--- AJOUTER UN ETUDIANT ---")
    
    // Champ ID Étudiant
    var idEtd = ""
while true {
    print("ID etudiant (format E00001) : ", terminator: "")
    
    if let input = readLine() {
        if validerIdEtd(input) {
            // Vérification de l'unicité avec une boucle simple
            var idExiste = false
            for etudiant in etudiants {
                if etudiant.id == input {
                    idExiste = true
                    break
                }
            }
            
            if idExiste {
                print("Cet ID existe deja !\n")
            } else {
                idEtd = input
                break
            }
        } else {
            print("ID invalide ! Doit commencer par 'E' suivi de 5 chiffres (ex: E00001).\n")
        }
    }
}

    // Champ Nom
    var nom = ""
    while true {
        print("\nNom : ", terminator: "")
        if let input = readLine() {
            if validerNomPrenom(input) {
                nom = input
                break
            } else {
                print("Nom invalide! Doit contenir uniquement des lettres et >=3 caracteres.")
            }
        }
    }
    
    // Champ Prénom
    var prenom = ""
    while true {
        print("\nPrenom : ", terminator: "")
        if let input = readLine() {
            if validerNomPrenom(input) {
                prenom = input
                break
            } else {
                print("Prenom invalide! Doit contenir uniquement des lettres (>=3 caracteres).")
            }
        }
    }
    
    // Champ Sexe
    var sexe = ""
    while true {
        print("\nSexe (M/F) : ", terminator: "")
        if let input = readLine() {
            if validerSexe(input) {
                sexe = input
                break
            } else {
                print("Sexe invalide! Doit etre M ou F.")
            }
        }
    }
    
    // Champ Classe
    var classe = ""
    while true {
        print("\nClasse (L1/L2/L3/L4) : ", terminator: "")
        if let input = readLine() {
            if validerClasse(input) {
                classe = input
                break
            } else {
                print("Classe invalide! Doit etre L1, L2, L3 ou L4.")
            }
        }
    }
    
    etudiants.append((id: idEtd, nom: nom, prenom: prenom, sexe: sexe, classe: classe))
    print("\nEtudiant ajoute avec succes!\n")
}


// Fonction pour lister les étudiants
func listerEtudiants() {
    print("\n--- LISTE DES ETUDIANTS ---")
    
    if etudiants.isEmpty {
        print("Aucun etudiant enregistre.")
        return
    }
    
    // En-tête du tableau
    print("+------------+---------------+---------------+------+---------+")
    print("| ID         | Nom           | Prenom        | Sexe | Classe  |")
    print("+------------+---------------+---------------+------+---------+")
    
    // Données du tableau
    for etudiant in etudiants {
        print(String(format: "| %-10s | %-13s | %-13s | %-4s | %-7s |",
                     (etudiant.id as NSString).utf8String!,
                     (etudiant.nom as NSString).utf8String!,
                     (etudiant.prenom as NSString).utf8String!,
                     (etudiant.sexe as NSString).utf8String!,
                     (etudiant.classe as NSString).utf8String!))
    }
    
    // Pied du tableau
    print("+------------+---------------+---------------+------+---------+")
    
    // Nombre total d'étudiants
    print("Total d'etudiants enregistres : \(etudiants.count)\n")
}


// Trouve un étudiant par son ID
func trouverEtudiantParId(_ id: String) -> (id: String, nom: String, prenom: String, sexe: String, classe: String)? {
    for etudiant in etudiants {
        if etudiant.id == id {
            return etudiant
        }
    }
    return nil
}


// Trouve les notes pour un étudiant donné
func trouverNotesParId(_ id: String) -> (idNote: Int, idEtd: String, francais: Double, math: Double, chimie: Double, physique: Double)? {
    for note in notes {
        if note.idEtd == id {
            return note
        }
    }
    return nil
}


// Retourne l'index des notes pour un étudiant donne
func trouverIndexNotesParId(_ id: String) -> Int {
    for i in 0..<notes.count {
        if notes[i].idEtd == id {
            return i
        }
    }
    return -1
}


// Fonctions pour la gestion des notes
func ajouterNotes() {
    print("\n--- AJOUTER DES NOTES ---")
    
    if etudiants.isEmpty {
        print("Aucun etudiant enregistre. Veuillez d'abord ajouter un Etudiant.")
        return
    }
    
    // Afficher la liste des étudiants
    listerEtudiants()
    
    // Sélectionner l'étudiant
    var idEtd = ""
    print("\nEntrez l'ID de l'etudiant:")
    if let input = readLine() {
        if trouverEtudiantParId(input) != nil {
            idEtd = input
        } else {
            print("ID etudiant invalide! Retour au menu.")
            return
        }
    }
    
    // Saisie des notes
    var francais: Double = 0
    var math: Double = 0
    var chimie: Double = 0
    var physique: Double = 0
    
    // Saisie de la note Français
    while true {
        print("\nNote de Francais (0-100):")
        if let input = readLine(), let note = Double(input) {
            if validerNote(note) {
                francais = note
                break
            } else {
                print("Note invalide! Doit etre entre 0 et 100.")
            }
        } else {
            print("Veuillez entrer un nombre valide.")
        }
    }
    
    // Saisie de la note Math
    while true {
        print("\nNote de Math (0-100):")
        if let input = readLine(), let note = Double(input) {
            if validerNote(note) {
                math = note
                break
            } else {
                print("Note invalide! Doit etre entre 0 et 100.")
            }
        } else {
            print("Veuillez entrer un nombre valide.")
        }
    }
    
    // Chimie
    while true {
        print("\nNote de Chimie (0-100):")
        if let input = readLine(), let note = Double(input) {
            if validerNote(note) {
                chimie = note
                break
            } else {
                print("Note invalide! Doit etre entre 0 et 100.")
            }
        } else {
            print("Veuillez entrer un nombre valide.")
        }
    }
    
    // Saisie de la note Physique
    while true {
        print("\nNote de Physique (0-100):")
        if let input = readLine(), let note = Double(input) {
            if validerNote(note) {
                physique = note
                break
            } else {
                print("Note invalide! Doit etre entre 0 et 100.")
            }
        } else {
            print("Veuillez entrer un nombre valide.")
        }
    }
    let index = trouverIndexNotesParId(idEtd)
    if index != -1 {
        // Mettre à jour les notes existantes
        notes[index] = (idNote: notes[index].idNote, idEtd: idEtd, francais: francais, math: math, chimie: chimie, physique: physique)
    } else {
        // Ajouter de nouvelles notes
        notes.append((idNote: idNoteCounter, idEtd: idEtd, francais: francais, math: math, chimie: chimie, physique: physique))
        idNoteCounter += 1
    }
    
    print("\nNotes ajoutees avec succes!")
}


// Afficher les moyennes de tous les étudiants
func afficherMoyennes() {
    print("\n--- MOYENNES DES ETUDIANTS ---")
    
    if notes.isEmpty {
        print("Aucune note enregistree.")
        return
    }
    
    // En-tête du tableau
    print("+---------------+---------------+----------+----------+----------+----------+----------+-----------+")
    print("| Nom           | Prenom        | Francais | Math     | Chimie   | Physique | Moyenne  | Statut    |")
    print("+---------------+---------------+----------+----------+----------+----------+----------+-----------+")

    for note in notes {
        if let etudiant = trouverEtudiantParId(note.idEtd) {
            // Calcul de la moyenne pondérée
            let sommeProduits = (note.francais * coefficients["francais"]!) +
                                (note.math * coefficients["math"]!) +
                                (note.chimie * coefficients["chimie"]!) +
                                (note.physique * coefficients["physique"]!)
            
            let sommeCoefficients = coefficients.values.reduce(0, +)
            let moyenne = sommeProduits / sommeCoefficients
            
            // Statut
            let statut = moyenne >= 65 ? "Reussi" : "Echoue"
            
            // Affichage formaté avec 2 chiffres après la virgule et colonnes alignées
            print(String(format: "| %-13s | %-13s | %8.2f | %8.2f | %8.2f | %8.2f | %8.2f | %-9s |",
                         (etudiant.nom as NSString).utf8String!,
                         (etudiant.prenom as NSString).utf8String!,
                         note.francais,
                         note.math,
                         note.chimie,
                         note.physique,
                         moyenne,
                         (statut as NSString).utf8String!))
        }
    }

    // Pied du tableau
    print("+---------------+---------------+----------+----------+----------+----------+----------+-----------+")
}


// Menu pour le calcul des moyennes
func CalculerMoyenne() {
    while true {
        print("\n\n--- CALCUL DES MOYENNES ---")
        print("1. Ajouter des notes")
        print("2. Afficher toutes les moyennes")
        print("3. Retour")
        print("Choisissez entre 1 et 3:")
        
        if let choix = readLine() {
            switch choix {
            case "1":
                ajouterNotes()
            case "2":
                afficherMoyennes()
            case "3":
                return
            default:
                print("Option invalide")
            }
        }
    }
}


// Menu principal
func afficherMenuPrincipal() {
    print("\n\n------MENU PRINCIPAL------")
    print("1. Gestion des etudiants")
    print("2. Gestion de l'economat")
    print("3. Quitter")
    print("Choisissez entre 1 et 3:")
}


// Fonctions pour la gestion des étudiants
func afficherMenuEtudiants() {
    while true {
        print("\n\nGESTION DES ETUDIANTS")
        print("1. Ajouter un etudiant")
        print("2. Lister les etudiants")
        print("3. Moyenne des notes par matiere")
        print("4. Retour au menu principal")
        print("Choisissez entre 1 et 4:")

        if let choix = readLine() {
            switch choix {
            case "1":
                ajouterEtudiant()
            case "2":
                listerEtudiants()
            case "3":
                CalculerMoyenne()
            case "4":
                return
            default:
                print("Option invalide")
            }
        }
    }
}


// Fonctions pour la gestion de l'économat
func afficherMenuEconomat() {
    while true {
        print("\n\nGESTION DE L'ECONOMAT")
        print("1. Ajouter une transaction")
        print("2. Lister les transactions")
        print("3. Voir le solde")
        print("4. Retour au menu principal")
        print("Choisissez entre 1 et 4:")

        if let choix = readLine() {
            switch choix {
            case "1":
                ajouterTransaction()
            case "2":
                listerTransactions()
            case "3":
                calculerSolde()
            case "4":
                return
            default:
                print("Option invalide")
            }
        }
    }
}


// Fonction principale
func main() {
    while true {
        afficherMenuPrincipal()
        
        if let choix = readLine() {
            switch choix {
            case "1":
                afficherMenuEtudiants()
            case "2":
                afficherMenuEconomat()
            case "3":
                print("\nMerci d'avoir utilise le systeme! Au revoir!")
                return
            default:
                print("Option invalide. Choisissez entre 1, 2 ou 3.")
            }
        }
    }
}

func ajouterTransaction() { 
print(" Fonction: ajouterTransaction() appelee") 
}
func listerTransactions() { 
print(" Fonction: listerTransactions() appelee") 
}
func calculerSolde() {
print(" Fonction: calculerSolde() appelee") 
}

main()
