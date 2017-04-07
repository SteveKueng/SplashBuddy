# SplashBuddy
This is a fork from https://github.com/ftiff/SplashBuddy for munki


Create a custom munkitools.pkg for SimpleMDM or another MDM.

### download SplashBuddy
```bash
curl -sLO https://github.com/SteveKueng/SplashBuddy/releases/download/1.0/Installer.zip
unzip Installer.zip -d Installer
```

### configure 
to configure the munki url you can use a profile or the postinstall script in _Installer/scritps/postinstall_  
add __defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL "http://localhost/munki_repo"__ as first command.  
depenging on your munki repo configuration you need additional settings!

customize: _Installer/Library/Application Support/SplashBuddy_ (https://github.com/ftiff/SplashBuddy/wiki/Onboarding-Manual)

edit _Installer/Library/Preferences/io.fti.SplashBuddy.plist_:
The __packageName__ key in SpalshBuddy is __display_name__ key in munki.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>assetPath</key>
        <string>/Library/SplashBuddy</string>
        <key>postInstallAssetPath</key>
        <string>presentation.html</string>
        <key>applicationsArray</key>
        <array>
            <dict>
                <key>canContinue</key>
                <true/>
                <key>description</key>
                <string>PDF Reader</string>
                <key>displayName</key>
                <string>Acrobat Reader</string>
                <key>iconRelativePath</key>
                <string>acrobatreader.png</string>
                <key>packageName</key>
                <string>Acrobat Reader</string>
            </dict>
        </array>
    </dict>
</plist>
```


### create munkitools with custom pkg
the make_munki_mpkg_DEP.sh creates a pkg with everything in _Installer/payload_ and the scripts in _Installer/scripts_

```bash
git clone -b Munki3 https://github.com/SteveKueng/munki.git
cd munki
./code/tools/make_munki_mpkg_DEP.sh -c ../Installer -s "<developer certificat>"
```