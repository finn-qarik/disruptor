{
   system ? builtins.currentSystem
 , pkgs ? import <nixpkgs> { inherit system; }
 , pkgs_latest ? import <nixpkgs_latest> { inherit system; }
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    bazel_6
    bazel-buildtools
    jdk11
  ];
  shellHook = ''
    # readlink as absolute path is needed
    echo "startup --output_base $(readlink -f ./bazel-output)" > "$(pwd)"/.output-bazelrc
  '';
}
