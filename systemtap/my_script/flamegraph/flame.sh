perl ./FlameGraph/stackcollapse-stap.pl fire.out  >fire.out2
perl ./FlameGraph/flamegraph.pl fire.out2 > fire.svg

