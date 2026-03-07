func gauss_legendre iterations .
   a = 1
   b = 1 / sqrt (2)
   p = 1
   t = 0.25
   for i = 1 to iterations
      an = a
      a = (a + b) / 2
      b = sqrt (an * b)
      t = t - p * pow (an - a) 2
      p *= 2
   .
   return pow (a + b) 2 / (4 * t)
.
print gauss_legendre 10