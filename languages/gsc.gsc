// This was written with Black Ops II on Plutonium.
// Your mileage may vary on other games or mods.

init() {
    level thread on_player_connected();
}

on_player_connected() {
    level waittill("connected", player);

    // Due to some rounding error in the game, this is restricted to six anyways.
    player iprintln(player gauss_legendre(6));
}

gauss_legendre(iterations) {
    a = 1.0;
    b = 1.0 / sqrt(2.0);
    p = 1.0;
    t = 0.25;

    for (x = 1; x < iterations + 1; x++) {
        an = a;

        a = (a + b) / 2.0;
        b = sqrt((an * b));
        t = t - p * pow((an - a), 2.0);
        p = 2.0 * p;
    }

    return pow((a + b), 2.0) / (4.0 * t);
}