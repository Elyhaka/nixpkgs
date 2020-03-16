{ stdenv, fetchFromGitHub, nodePackages, glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-pop-shell";
  version = "2020-03-17";

  src = fetchFromGitHub {
    owner = "pop-os";
    repo = "shell";
    rev = "51791470a7ed187de7e175b845a13b9809ac7c9f";
    sha256 = "11xc85sacg62scazjd9apizp1qjkxz0scjc0xvq0yakcmj27j02v";
  };

  nativeBuildInputs = [
    nodePackages.typescript
    glib
  ];

  makeFlags = [ "INSTALLBASE=$(out)/share/gnome-shell/extensions" ];
  uuid = "pop-shell@system76.com";

  meta = with stdenv.lib; {
    description = "i3wm-like keyboard-driven layer for GNOME Shell";
    homepage = "https://github.com/pop-os/shell";
    license = licenses.gpl3;
    maintainers = with maintainers; [ elyhaka ];
    platforms = platforms.linux;
  };
}
