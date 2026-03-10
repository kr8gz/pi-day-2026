pragma solidity ^0.8.0;

contract GaussLegendre {
    uint256 constant SCALE = 10000000000;

    function isqrt(uint256 n) internal pure returns (uint256) {
        uint256 x = n;
        uint256 prev = 0;

        while (prev != x) {
            prev = x;
            x = (x + n / x) / 2;
        }

        return x;
    }

    function ssqrt(uint256 n) internal pure returns (uint256) {
        return isqrt(n * SCALE);
    }

    // https://stackoverflow.com/questions/47129173/how-to-convert-uint-to-string-in-solidity/71095692#71095692
    function uintToString(uint256 n) internal pure returns (string memory) {
        if (n == 0) return "0";
        uint256 temp = n;
        uint256 bufferLength = 0;

        while (temp != 0) {
            bufferLength++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(bufferLength);
        while (n != 0) {
            bufferLength--;
            buffer[bufferLength] = bytes1(uint8(48 + (n % 10)));
            n /= 10;
        }

        return string(buffer);
    }

    function gaussLegendre(uint256 iterations) public pure returns (string memory) {
        uint256 a = SCALE;
        uint256 b = SCALE * SCALE / ssqrt(2 * SCALE);
        uint256 p = 1;
        uint256 t = SCALE / 4;

        for (uint256 i = 0; i < iterations; i++) {
            uint256 an = a;

            a = (a + b) / 2;
            b = ssqrt(an * b / SCALE);
            uint256 diff = an - a;
            t = t - p * (diff * diff) / SCALE;
            p *= 2;
        }

        uint256 pi = (a + b) * (a + b) / (4 * t);
        uint256 whole = pi / SCALE;
        uint256 fract = pi - whole * SCALE;

        return string.concat(uintToString(whole), ".", uintToString(fract));
    }
}