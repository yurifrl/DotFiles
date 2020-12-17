{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "git-hooks";
  version = "1.3.1";
  src = fetchurl {
    name = name;
    url = "https://github.com/${name}/${name}/releases/download/v${version}/${name}_darwin-amd64";
    sha256 = "02ifap0wxvkj6ff8qy9xdix9z54ycz4hwjdm6djvfbf5d32a2v35";
    executable = true;
  };

  phases = ["installPhase"];
  installPhase = ''install -Dm755 $src "$out/bin/$name"'';

  meta = with stdenv.lib; {
      description = "";
      homepage = "";
      maintainers = with maintainers; [ yurifrl ];
      license = licenses.gpl2;
  };
}
