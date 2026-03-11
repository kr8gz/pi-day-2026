use namespace HH\Lib\IO;

function gauss_legendre(int $iterations): float {
    $a = 1.0;
    $b = 1.0 / sqrt(2.0);
    $p = 1.0;
    $t = 0.25;

    for ($i = 0; $i < $iterations; ++$i) {
        $an = $a;

        $a = ($a + $b) / 2;
        $b = sqrt($an * $b);
        $t = $t - $p * ($an - $a) ** 2;
        $p = 2 * $p;
    }

    return ($a + $b) ** 2 / (4 * $t);
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
    await IO\request_output()->writeAllAsync((string)gauss_legendre(10));
}