{ stdenv, fetchFromGitHub, pandoc }:

stdenv.mkDerivation rec {
  pname = "nvimpager";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "lucc";
    repo = pname;
    rev = "c2f3259de438377710532d7ac6e4fd59502630a2";
    sha256 = "quHz0Qrcnx48ne4f8eshce8oqiDYn7gwSSXPzlC+5nA=";
  };

  nativeBuildInputs = [ pandoc ];

  makeFlags = [ "PREFIX=$(out)" "DESTDIR=" ];

  meta = with stdenv.lib; {
    description =
      "Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting";
    homepage = "https://github.com/lucc/nvimpager";
    license = licenses.bsd2;
    platforms = platforms.all;
    maintainers = with maintainers; [ contrun ];
  };
}
