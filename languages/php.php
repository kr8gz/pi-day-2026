<?php
function gaussLegendre(int $iterations): float {
    $a = 1;
    $b = 1 / sqrt(2);
    $p = 1;
    $t = 0.25;

    for ($i = 1; $i <= $iterations; $i++) {
        $an = $a;
        $bn = $b;
        $pn = $p;
        $tn = $t;

        $a = ($an + $bn) / 2;
        $b = sqrt($an * $bn);
        $t = $tn - $pn * ($an - $a) ** 2;
        $p = 2 * $pn;
    }

    return ($a + $b) ** 2 / (4 * $t);
}

echo gaussLegendre(10);
?>