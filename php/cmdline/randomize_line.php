#!/usr/bin/php -q
<?php
        $lines = split("\n", file_get_contents("php://stdin", "r"));
        shuffle($lines);
        foreach ($lines as $line) {
                if ($line !== "") {
                        echo "$line\n";
                }
        }
?>
