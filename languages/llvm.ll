declare double @llvm.sqrt.f64(double)
declare double @llvm.pow.f64(double, double)
declare i32 @printf(i8*, ...)

@fmt = private constant [7 x i8] c"%.17g\0A\00"

define double @gauss_legendre(i32 %iterations) {
entry:
    ; a = 1.0
    %aptr = alloca double
    store double 1.0, double* %aptr

    ; b = 1.0 / sqrt(2.0)
    %bptr = alloca double
    %sqrt_2 = call double @llvm.sqrt.f64(double 2.0)
    %bres = fdiv double 1.0, %sqrt_2
    store double %bres, double* %bptr

    ; p = 1.0
    %pptr = alloca double
    store double 1.0, double* %pptr

    ; t = 0.25
    %tptr = alloca double
    store double 0.25, double* %tptr

    br label %loop

loop:
    %i = phi i32 [1, %entry], [%next, %loop]

    ; an = a
    %anval = load double, double* %aptr

    ; a = (an + b) / 2.0
    %bval1 = load double, double* %bptr
    %op1_an_add_b = fadd double %anval, %bval1
    %op1_anb_div_2 = fdiv double %op1_an_add_b, 2.0
    store double %op1_anb_div_2, double* %aptr

    ; b = sqrt(an * b)
    %op2_an_mul_b = fmul double %anval, %bval1
    %op2_sqrt_anb = call double @llvm.sqrt.f64(double %op2_an_mul_b)
    store double %op2_sqrt_anb, double* %bptr

    ; t = t - p * pow(a - an, 2)
    %aval1 = load double, double* %aptr
    %op3_a_sub_an = fsub double %aval1, %anval
    %op3_aan_pow_2 = call double @llvm.pow.f64(double %op3_a_sub_an, double 2.0)
    %pval1 = load double, double* %pptr
    %op3_p_mul_aan = fmul double %pval1, %op3_aan_pow_2
    %tval1 = load double, double* %tptr
    %op3_t_sub_paan = fsub double %tval1, %op3_p_mul_aan
    store double %op3_t_sub_paan, double* %tptr

    ; p *= 2
    %op4_p_mul_2 = fmul double %pval1, 2.0
    store double %op4_p_mul_2, double* %pptr

    %cond = icmp slt i32 %i, 10
    %next = add i32 %i, 1
    br i1 %cond, label %loop, label %exit

exit:
    ; return pow(a + b, 2) / (4 * t)
    %aval2 = load double, double* %aptr
    %bval2 = load double, double* %bptr
    %ret_a_add_b = fadd double %aval2, %bval2
    %ret_ab_pow_2 = call double @llvm.pow.f64(double %ret_a_add_b, double 2.0)
    %tval2 = load double, double* %tptr
    %ret_4_mul_t = fmul double 4.0, %tval2
    %ret_ab2_div_4t = fdiv double %ret_ab_pow_2, %ret_4_mul_t
    ret double %ret_ab2_div_4t
}

define i32 @main() {
entry:
    %result = call double @gauss_legendre(i32 10)
    call i32 (i8*, ...) @printf(i8* @fmt, double %result)
    ret i32 0
}