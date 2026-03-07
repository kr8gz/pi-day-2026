@echo off
setlocal enableextensions enabledelayedexpansion

SET /A scale=10000
SET /A iterations=1

:gauss_legendre
SET /A a=scale
SET /A "b=7071"
SET /A p=scale
SET /A "t=2500"

for /l %%i in (1, 1, !iterations!) do (
    SET /A an=!a!
    
    SET /A "a = (a + b) / 2"
    SET /A "n = (an * b / scale)"
    SET /A _sqrt_input=scale*n
    
    SET /A prev=0
    SET /A b=_sqrt_input
    :isqrt_loop
    if !prev! neq !b! (
        SET /A prev=b
        SET /A "b = (b + !_sqrt_input! / b) / 2"
        goto :isqrt_loop
    )

    SET /A "diff = an - a"
    SET /A "t = (t - !p! * !diff! / !scale! * !diff! / !scale!)"
    SET /A p=2*p
)

SET /A "pi = (a + b) * (a + b) / (4 * t)"
SET /A "whole = !pi! / !scale!"
SET /A "frac = !pi! - !whole! * !scale!"

echo %whole%.%frac%