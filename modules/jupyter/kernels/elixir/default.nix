{ stdenv, name ? "nixpkgs", packages ? [], callPackage, evcxr, pkgs }:

let
  kernelEnv = (python3.withPackages (p:
    packages p ++ (with p; [
      ipykernel
    ])
  )).override (args: { inherit ignoreCollisions;});

  kernelFile = {
    display_name = "Elixir - ${name}";
    language = "Elixir";
    argv = [
       "${kernelEnv.interpreter}"
      "${evcxr}/bin/evcxr_jupyter"
      "--control_file"
      "{connection_file}"
    ];
  };

  ElixirKernel = stdenv.mkDerivation {
    name = "elixir-${name}";
    src = ./.;
    phases = "installPhase";
    installPhase = ''
      export kerneldir="$out/kernels/java_${name}"
      mkdir -p $kerneldir
      echo '${builtins.toJSON kernelFile}' > $kerneldir/kernel.json
    '';
  };
in {
  spec = ElixirKernel;
  runtimePackages = [ pkgs.elixir  ] ++ packages;
}
