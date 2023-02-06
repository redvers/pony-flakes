{
  description = "A flake to install ponyc and corral";
  inputs = {
    nixpkgs.url = "nixpkgs/3302bc3ddda5b1f72f7382b259d25856ed763a5e";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.ponyc = nixpkgs.legacyPackages.x86_64-linux.ponyc;
    packages.x86_64-linux.ponyc-corral = nixpkgs.legacyPackages.x86_64-linux.pony-corral;

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.ponyc;

    devShells.x86_64-linux.default =
      nixpkgs.legacyPackages.x86_64-linux.mkShell { buildInputs = [ self.packages.x86_64-linux.ponyc self.packages.x86_64-linux.ponyc-corral ]; }; 

  };
}
