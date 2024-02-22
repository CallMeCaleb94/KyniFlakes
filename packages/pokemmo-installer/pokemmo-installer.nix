{ 
pkgs,
stdenv, 
jdk17, 
fetchFromGitHub, 
makeWrapper,
lib,
}:


stdenv.mkDerivation rec {
  pname = "pokemmo_installer";
  version = "1.4.7";

  src = fetchFromGitHub {
        owner = "coringao";
	repo = "pokemmo-installer";
	rev = "master";
	sha256 = "Khs1fxf97FYaH0JbxVhw35iZHD4S+j1dw4wcdCK14JU="; # Replace with the actual hash of the zip file
  };

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [ jdk17   ];

  phases = [ "unpackPhase" "installPhase"  ];

  installPhase = ''
 	make install DESTDIR=$out
	chmod +x $out/usr/games/pokemmo-installer
  '';



  meta = with lib; {
    downloadPage = "https://pokemmo.eu/downloads/";
    maintainers = with lin.maintainers; [ CallMeCaleb94 ];
    description = "PokeMMO - A fan-made MMO for the Pokémon series";
    homepage = "";
    license = licenses.free;
    platforms = platforms.unix;
  };
}

