{
  description = "A wrapper over nix-shell to quickly run any program with arguments";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    name = "nixrun";
  in
    {
      packages.${system} = {
        ${name} = pkgs.writeShellApplication {
          name = "${name}";
          text = builtins.readFile ./nixrun.bash;
        };
        default = self.packages.${system}.${name};
      };
    };
}
