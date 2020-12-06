{ stdenv, fetchurl, unzip, lib, elixir, pkgs }:

# https://github.com/NixOS/nixpkgs/pull/97245/files

stdenv.mkDerivation rec {
  pname = "elixir-ls";
  version = "0.5.0";

  targetPath = "$out/bin";

  src = fetchurl {
    url = "https://github.com/elixir-lsp/elixir-ls/releases/download/v${version}/elixir-ls.zip";
    sha256 = "009g6pg13ngdik9yd5s141v5x8w4yzi7288zyzfszshwqpai8sfz";
  };

  buildInputs = [ pkgs.makeWrapper ];

  nativeBuildInputs = [
    unzip
  ];

  dontUnpack = true;

  installPhase = ''
    mkdir -p ${targetPath}
    ${unzip}/bin/unzip ${src} -d ${targetPath}
    rm ${targetPath}/*.bat
    cp ${targetPath}/debugger.sh ${targetPath}/elixir_ls_debugger.sh
    cp ${targetPath}/language_server.sh ${targetPath}/elixir_ls_server.sh
    cp ${targetPath}/launch.sh ${targetPath}/elixir_ls_launch.sh
  '';


  postFixup = ''
    ls ${targetPath}
    substituteInPlace ${targetPath}/elixir_ls_server.sh \
      --replace 'exec "''${dir}/launch.sh"' 'exec "''${dir}/elixir_ls_launch.sh"'
    substituteInPlace ${targetPath}/elixir_ls_debugger.sh \
      --replace 'exec "''${dir}/launch.sh"' 'exec "''${dir}/elixir_ls_launch.sh"'
  '';

  meta = with lib; {
    homepage = "https://github.com/elixir-lsp/elixir-ls";
    description = "A frontend-independent IDE \"smartness\" server for Elixir. Implements the \"Language Server Protocol\" standard and provides debugger support via the \"Debug Adapter Protocol\"";
    license = licenses.asl20;
    maintainers = with maintainers; [ yurifrl ];
  };
}
