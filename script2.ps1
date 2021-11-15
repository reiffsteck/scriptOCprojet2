param 
(
        [string] $n=' '
)

$ErrorActionPreference = "SilentlyContinue"
$Error.Clear()  #purge des erreurs
# question interactif ou non
#Lister les membres d'un groupe
Function GetListeMembreGrp() 
{
    param 
    (
        [string] $MembreGroup ,
        [string] $n
    )

        Write-Host $n
            if ($n -eq ' ' )
                {
                write-host "le chemin d'importation est connu  C:\Scripts\AD_USERS\membregroupe.csv"
                $CSVFile = "C:\Scripts\AD_USERS\membregroupe.csv"
                $CSVData = Import-CSV -Path $CSVFile -Delimiter ";" -Encoding UTF8 
               # Write-Host "Fichier Importe"

                Foreach ($Membre in $CSVData)
                        {
                        $MembreGroup = $Membre.Departement
                        Write-Host  " le groupe est " $MembreGroup
                        Write-Output " le groupe est " $MembreGroup 
                        Write-Output " les membres sont" 
                        Get-ADgroupmember -Identity $MembreGroup | Select-Object SamAccountName
                        Write-Output " Fin de la liste des membres du groupe " 
                        Write-Host " "
                        SortieErreur
                        }
                }
            else 
                {
                    Write-output "Lister les membres d'un groupe"
                    Write-output " De quel groupe voulez vous connaitre les membres"
                    Write-output " bonjour, il y a différents groupes dans l'organisation"
                    Write-output "ACMEGroup 1 "
                    Write-output "Critique 2 "
                    Write-output "Stagiaires 3 "
                    Write-output "DirectionFinanciere 4 "
                    Write-output "DirectionGenerale 5 " 
                    Write-output "DirectionMarketing 6 "
                    Write-output "DirectionTechnique 7 "
                    Write-output "RessourcesHumaines 8 "
                    $MembreGroup =Read-Host "Entrez un nombre entre 1 et 8"
                    switch ($MembreGroup)
                    {
                        1 { $MembreGroup="ACMEGroup"}
                        2 { $MembreGroup="Critique"}
                        3 { $MembreGroup="Stagiaires"}
                        4 { $MembreGroup="DirectionFinanciere"}
                        5 { $MembreGroup="DirectionGenerale"}
                        6 { $MembreGroup="DirectionMarketing"}
                        7 { $MembreGroup="DirectionTechnique"}
                        8 { $MembreGroup="RessourcesHumaines"}
                    }
                Write-Host " "
                Write-Host "Dans le groupe " $MembreGroup "les membres sont:" 
                Get-ADgroupmember $MembreGroup | Select-Object SamAccountName
                SortieErreur
                }
    }

    Function SortieErreur( )
{
    param ()

    if($Error.Count -ieq 0)
    {
   
     Write-Output "Pas de Code de sortie en Erreur" $error[0] #affichage erreur
    $LastExitCode
    }

    Else
    {
        Write-Host "Erreur:"
        Write-Host $error[0] #affichage erreur
        $LastExitCode
        exit
    }
}
    GetListeMembreGrp -n $n
