{ pkgs ? import (builtins.fetchTarball {
    # nixpkgs-unstable 2019-01-22
    url = https://github.com/NixOS/nixpkgs/archive/f36ba34be36c1a35341b533947d06afc5784647b.tar.gz;
    sha256 = "1addbmdg0lyypjqrxa6fkrchzpqs125ahnqn5hmhlv3c0005x6rn";
  }) {}

, revealjs ? pkgs.fetchFromGitHub {
    owner = "hakimel";
    repo = "reveal.js";
    rev = "3.8.0";
    sha256 = "14cva2hxdv4gxpz2a996qs8xhxffw97a90gkz2mmgdczh1kyn1sc";
  }
}:

pkgs.runCommand "adt-talk" {} ''
  mkdir $out
  ln -s ${revealjs} $out/reveal.js
  ${pkgs.pandoc}/bin/pandoc -s -V theme=blood -t revealjs -o $out/index.html ${./category.org}
''
