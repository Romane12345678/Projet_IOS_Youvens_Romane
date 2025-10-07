func afficherMenuPrincipal() {
    print("\n" + "==================================================")
    print("SYSTÈME DE GESTION SCOLAIRE")
    print("==================================================")
    print("1.Gestion des étudiants")
    print("2.Gestion de l'économat")
    print("3.Quitter")
    print("Choisissez entre 1 a 3: ")
}

func afficherMenuEtudiants() {
    while true {
        print("\nGESTION DES ÉTUDIANTS")
        print("1.Ajouter un étudiant")
        print("2.Lister les étudiants")
        print("3.Ajouter une note")
        print("4.Voir les moyennes")
        print("5.Retour au menu principal")
        print("Choisissez entre 1 a 5")
        
        let choix = "5"
        print(choix)
        
        switch choix {
        case "1":
            ajouterEtudiant()
        case "2":
            listerEtudiants()
        case "3":
            ajouterNote()
        case "4":
            calculerMoyennes()
        case "5":
            break
        default:
            print("Option invalide")
        }
        
        if choix == "5" {
            break
        }
    }
}

func afficherMenuEconomat() {
    while true {
        print("\nGESTION DE L'ÉCONOMAT")
        print("1.Ajouter une transaction")
        print("2.Lister les transactions")
        print("3.Voir le solde")
        print("4.Retour au menu principal")
        print("Choisissez entre 1 a 4")
        
        let choix = "4"
        print(choix)
        
        switch choix {
        case "1":
            ajouterTransaction()
        case "2":
            listerTransactions()
        case "3":
            calculerSolde()
        case "4":
            break
        default:
            print("Option invalide")
        }
        
        if choix == "4" {
            break
        }
    }
}
func main() {
    while true {
        afficherMenuPrincipal()
        
        let choix = "3"
        print(choix)
        
        switch choix {
        case "1":
            afficherMenuEtudiants()
        case "2":
            afficherMenuEconomat()
        case "3":
            print("\nMerci d'avoir utilisé le système! Au revoir!")
            break
        default:
            print("Option invalide. Choisissez entre 1, 2 ou 3.")
        }
        
        if choix == "3" {
            break
        }
    }
}

main()
