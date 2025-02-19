echo "Copying normal dotfiles..."
pushd files/
  cp .bash_profile ~/
  cp .bashrc ~/
  cp -r .bashrc.d ~/
  cp -r .config/* ~/.config/
  cp .sbclrc ~/
  cp -r .stumpwm.d ~/
  cp .xinitrc ~/
  cp .Xresources ~/
popd

echo "Creating ~/OPT/..."
mkdir -p ~/OPT ~/OPT/bin ~/OPT/etc ~/OPT/include ~/OPT/lib ~/OPT/shbin ~/OPT/src
ln -sf ~/OPT/bin ~/BIN
pushd opt/
  cp ./env ~/OPT/
  cp ./README ~/OPT/
  cp ./shbin/* ~/OPT/shbin/
popd

echo "Downloading jetbrains-mono locally..."
mkdir -p ~/.local/share/fonts/jetbrains-mono
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip
pushd fonts/
  cp ttf/*.ttf variable/*.ttf ~/.local/share/fonts/jetbrains-mono/
popd

echo "Patching st-0.9..."
wget https://dl.suckless.org/st/st-0.9.tar.gz
tar -xf st-0.9.tar.gz
pushd st-0.9/
  patch < ../patches/st-0.9-config.patch
  make
  cp ./st ~/OPT/bin
  cp -r ./ ~/OPT/src/st-0.9/
popd
echo "Patching dmenu-5.2..."
wget https://dl.suckless.org/tools/dmenu-5.2.tar.gz
tar -xf dmenu-5.2.tar.gz
pushd dmenu-5.2/
  patch < ../patches/dmenu-5.2-config.patch
  make
  cp ./dmenu ./dmenu_path ./dmenu_run ./stest ~/OPT/bin
  cp -r ./ ~/OPT/src/dmenu-5.2/
popd
