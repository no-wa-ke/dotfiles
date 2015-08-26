## dotfiles
My dotfile using sh+Ansible.
Darwin/Redhat/Debian

### Install(Mac)
1.Install Xcode from App store.
2.Install Command Line Tools by:
```shell
$ gcc (or make)
```
and then pop-up window will show up.
3.Install brew, git , and this repository by:
```shell
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install git
$ git clone https://github.com/no-wa-ke/dotfiles.git
```
Or just download this repository on another machine and just drop them into your $HOME directory.
4.Do install
```shell
$ sh install.sh
```

Lite-Install is supported on Redhat | Debian for now.

### sublime text setting

**Open console**
```
ctrl+`
```

**Paste following code**
```
import urllib.request,os,hashlib; h = 'eb2297e1a458f27d836c04bb0cbaf282' + 'd0e7a3098092775ccb37ca9d6b2e4b7d'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```



### TODO
Adapt anyenv packages.


