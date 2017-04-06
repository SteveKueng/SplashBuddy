# SplashBuddy
This is a fork from https://github.com/ftiff/SplashBuddy for munki


Create a custom munkitools.pkg for SimpleMDM or another MDM.

### download SplashBuddy
```bash
curl -sLO https://github.com/SteveKueng/SplashBuddy/releases/download/1.0/Installer.zip
unzip Installer.zip -d Installer
```

### configure SplashBuddy 
edit Installer/payload

### create munkitools with custom pkg
```bash
git clone -b Munki3 https://github.com/SteveKueng/munki.git
cd munki
./code/tools/make_munki_mpkg_DEP.sh -c ../Installer -s "<developer certificat>"
```