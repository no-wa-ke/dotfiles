## dotfiles
My dotfile using sh+Ansible.

Darwin/Redhat/Debian

### Install(Mac)
**1. Get Xcode from [App Store](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12) or [developer.apple.com](https://developer.apple.com/downloads/)**

**2. Install Command Line Tools by:**
```shell
$ gcc 
```
and then pop-up window will show up.

**3. Install brew, git , and this repository by:**
```shell
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install git
$ git clone https://github.com/no-wa-ke/dotfiles.git
```
Or just download this repository on another machine and just drop them into your $HOME directory.

**4. Install**
```shell
$ sh install.sh
```

********

### Options

####**Lite** or **Complete** Install
**Lite** only installs minimum packages for development(vim,zsh,tmux)

On the other hand, **Complete** uses **Ansible** | **Homebrew cask** which install
wide variety of apps, such as virtual-box,vagrant,and etc( take a look at *mac-env.yml* )

If you want to dry run Ansible, just alter the line in 

*script/mac/CompleteInstall.sh* :

```shell
ansible-playbook mac-env.yml -i hosts 
```
to
```shell
ansible-playbook mac-env.yml -i hosts --check
```

####**Overwrite** or create **.dot** 
Some of the dotfiles might be already in your system.

You can either overwrite them, or create *~.dot* files and concat them with original dotfiles later on.

#### Redhat/Debian
Lite-Install is supported on Redhat | Debian for now.

********
###Sublime Text setting


**Open console**
```
ctrl+`
```

**Paste following code**
```javascript
import urllib.request,os,hashlib; 
h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; 
pf = 'Package Control.sublime-package'; 
ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); 
by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
As you reboot ST3 it will automatically install missing packages.

********
### TODO
- Adapt anyenv packages
- Improve other OS support


