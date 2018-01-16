#!/usr/bin/php -q
<?php
        array_shift($argv);
        if (count($argv) == 0) {
                $argv[0] = "php://stdin";
        }
        foreach ($argv as $file) {
                $lines = split("\n", file_get_contents($file, "r"));
                shuffle($lines);
                foreach ($lines as $line) {
                        if ($line !== "") {
                                echo "$line\n";
                        }
                }
        }
?>
