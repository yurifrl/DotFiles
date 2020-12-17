{ stdenv, name ? "nixpkgs", packages ? [], callPackage, evcxr, pkgs }:

let
  kernelFile = {
    display_name = "Java - ${name}";
    language = "Java";
    argv = [
      "${evcxr}/bin/evcxr_jupyter"
      "--control_file"
      "{connection_file}"
    ];
  };

  JavaKernel = stdenv.mkDerivation {
    name = "java-${name}";
    src = ./.;
    phases = "installPhase";
    installPhase = ''
      export kerneldir="$out/kernels/java_${name}"
      mkdir -p $kerneldir
      echo '${builtins.toJSON kernelFile}' > $kerneldir/kernel.json
    '';
  };
in {
  spec = JavaKernel;
  runtimePackages = [ pkgs.adoptopenjdk-jre-openj9-bin-11  ] ++ packages;
}