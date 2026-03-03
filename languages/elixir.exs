defmodule Pi do
    def pi(0, _iteartions) do 
        {1.0, 1.0 / :math.sqrt(2.0), 0.25, 1.0}
    end
    def pi(i, iterations) do
        {a, b, t, p} = pi(i - 1, iterations)
        a1 = (a + b) / 2.0

        {a1, :math.sqrt(a * b), t - p * :math.pow(a1 - a, 2), 2.0 * p}
    end

    def gauss_legendre(iterations) do
        {a, b, t, _p} = pi(iterations, iterations)
        :math.pow(a + b, 2) / (4.0 * t)
    end
end

IO.puts("#{Pi.gauss_legendre(10)}")