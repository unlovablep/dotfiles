echo "Copying normal dotfiles..."
pushd files/
  cp .bash_profile $HOME/./
  cp .bashrc $HOME/./
  cp -r .bashrc.d $HOME/./
  cp -r .config/* $HOME/./.config/
  cp .sbclrc $HOME/./
  cp -r .stumpwm.d $HOME/./
  cp .xinitrc $HOME/./
  cp .Xresources $HOME/./
popd

echo "Creating $HOME/./OPT/..."
mkdir -p $HOME/./OPT $HOME/./OPT/bin $HOME/./OPT/etc $HOME/./OPT/include $HOME/./OPT/lib $HOME/./OPT/shbin $HOME/./OPT/src
ln -sf $HOME/./OPT/bin $HOME/./BIN
pushd opt/
  cp ./env $HOME/./OPT/
  cp ./README $HOME/./OPT/
  cp ./shbin/* $HOME/./OPT/shbin/
popd

echo "Downloading jetbrains-mono locally..."
mkdir -p $HOME/./.local/share/fonts/jetbrains-mono
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip
pushd fonts/
  cp ttf/*.ttf variable/*.ttf $HOME/./.local/share/fonts/jetbrains-mono/
popd

echo "Patching st-0.9..."
wget https://dl.suckless.org/st/st-0.9.tar.gz
tar -xf st-0.9.tar.gz
pushd st-0.9/
  patch < ../patches/st-0.9-config.patch
  make
  cp ./st $HOME/./OPT/bin
  cp -r ./ $HOME/./OPT/src/st-0.9/
popd
echo "Patching dmenu-5.2..."
wget https://dl.suckless.org/tools/dmenu-5.2.tar.gz
tar -xf dmenu-5.2.tar.gz
pushd dmenu-5.2/
  patch < ../patches/dmenu-5.2-config.patch
  make
  cp ./dmenu ./dmenu_path ./dmenu_run ./stest $HOME/./OPT/bin
  cp -r ./ $HOME/./OPT/src/dmenu-5.2/
popd
