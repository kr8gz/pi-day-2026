function Invoke-GaussLegendre {
    param (
        [int]$Iterations
    )

    $a = 1;
    $b = 1 / [math]::Sqrt(2);
    $p = 1;
    $t = 0.25;

    for ($i = 1; $i -le $Iterations; $i++) {
        $an = $a;

        $a = ($a + $b) / 2;
        $b = [math]::Sqrt($an * $b);
        $t = $t - $p * [math]::Pow($a - $an, 2);
        $p *= 2;
    }

    return [math]::Pow($a + $b, 2) / (4 * $t);
}

Write-Output (Invoke-GaussLegendre -Iterations 10)