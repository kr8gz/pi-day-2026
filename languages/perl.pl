sub GaussLegendre {
    my $iterations = $_[0];

    my $a = 1;
    my $b = 1 / sqrt(2);
    my $p = 1;
    my $t = 0.25;

    for (my $i = 1; $i <= $iterations; $i++) {
        my $an = $a;
        my $bn = $b;
        my $pn = $p;
        my $tn = $t;

        $a = ($an + $bn) / 2;
        $b = sqrt($an * $bn);
        $t = $tn - $pn * ($an - $a) ** 2;
        $p = 2 * $pn;
    }

    return ($a + $b) ** 2 / (4 * $t);
}

print GaussLegendre(10);