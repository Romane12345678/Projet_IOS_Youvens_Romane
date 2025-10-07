func afficherMenuPrincipal() {
    print("\n==================================================")
    print("SYSTEME DE GESTION SCOLAIRE")
    print("==================================================")
    print("1. Gestion des etudiants")
    print("2. Gestion de l'economat")
    print("3. Quitter")
    print("Choisissez entre 1 et 3:")
}

func afficherMenuEtudiants() {
    while true {
        print("\nGESTION DES ETUDIANTS")
        print("1. Ajouter un etudiant")
        print("2. Lister les etudiants")
        print("3. Calculer la moyenne des notes par matiere")
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

func afficherMenuEconomat() {
    while true {
        print("\nGESTION DE L'ECONOMAT")
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


func ajouterEtudiant() { 
print(" Fonction: ajouterEtudiant() appelee") 
}
func listerEtudiants() { 
print(" Fonction: listerEtudiants() appelee") 
}
func CalculerMoyenne() { 
print(" Fonction: CalculerMoyenne() appelee")
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

