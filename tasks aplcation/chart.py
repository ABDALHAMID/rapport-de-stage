import pandas as pd

# Data extracted from the image and reformatted in French
data = {
    "Nom de la tâche": [
        "Paramétrer modèle de prix", "Paramétrer modèle de stockage", "Paramétrer modèle de suivi",
        "Consulter bon de réception", "Modifier bon de réception", "Consulter time ligne bon de réception",
        "Consulter lignes bons de commande", "Consulter infos générales bon de réception",
        "Affecter lot à bon de réception", "Créer nouveau lot avec DLC", "Spécifier filtres pour image de stock",
        "Calculer image de stock", "Consulter mouvement de stock", "Modifier mouvement de stock",
        "Consulter time ligne bon de réception", "Consulter lignes mouvements de stock",
        "Consulter infos ligne de mouvement", "Saisie des emplacements selon type",
        "Saisir quantité à expédier", "Vérifier quantité à expédier", "Contrôler disponibilité de stock",
        "Valider lignes de mouvement de stock", "Mise à niveau de fiche article",
        "Dév. modèles de prix d’article", "Dév. modèles de dimension de stockage", "Dév. modèles de dimension de suivi",
        "Suppression composante PRICEMODEL", "Ajout statut VALIDER", "Gestion statuts DA",
        "Bouton passage statut VALIDER", "Clôture des lignes de DA"
    ],
    "Date de début": [
        "09/07/2024", "10/07/2024", "11/07/2024", "17/07/2024", "17/07/2024", "31/07/2024",
        "18/07/2024", "19/07/2024", "23/07/2024", "23/07/2024", "29/07/2024", "29/07/2024",
        "26/07/2024", "26/07/2024", "30/07/2024", "27/07/2024", "27/07/2024", "29/07/2024",
        "29/07/2024", "30/07/2024", "31/07/2024", "31/07/2024", "15/08/2024", "16/08/2024",
        "17/08/2024", "18/08/2024", "19/08/2024", "26/08/2024", "27/08/2024", "28/08/2024", "29/08/2024"
    ],
    "Date de fin": [
        "11/07/2024", "11/07/2024", "11/07/2024", "29/07/2024", "29/07/2024", "29/07/2024",
        "29/07/2024", "29/07/2024", "29/07/2024", "29/07/2024", "29/07/2024", "29/07/2024",
        "03/08/2024", "03/08/2024", "03/08/2024", "03/08/2024", "03/08/2024", "03/08/2024",
        "03/08/2024", "03/08/2024", "03/08/2024", "03/08/2024", "19/08/2024", "19/08/2024",
        "19/08/2024", "19/08/2024", "26/08/2024", "28/08/2024", "28/08/2024", "28/08/2024", "29/08/2024"
    ]
}

# Convert dates to datetime format and calculate duration in days
df = pd.DataFrame(data)
df["Date de début"] = pd.to_datetime(df["Date de début"], format="%d/%m/%Y")
df["Date de fin"] = pd.to_datetime(df["Date de fin"], format="%d/%m/%Y")
df["Nombre de jours"] = (df["Date de fin"] - df["Date de début"]).dt.days + 1

# Save to Excel
output_path = "./Tâches_Projet_Abdelhamid.xlsx"
df.to_excel(output_path, index=False, sheet_name="Tâches en Français")

output_path
