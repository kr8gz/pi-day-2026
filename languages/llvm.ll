declare i32 @printf(i8*, ...)

@fmt = private constant [7 x i8] c"%.17g\0A\00"

define double @gauss_legendre(i32 %iterations) {
entry:
    br label %loop

loop:
    %a = phi double [1.0, %entry], [%a_next, %loop]
    %b = phi double [0.707106781186547, %entry], [%b_next, %loop]
    %p = phi double [1.0, %entry], [%p_next, %loop]
    %t = phi double [0.25, %entry], [%t_next, %loop]
    %i = phi i32 [1, %entry], [%i_next, %loop]

    ; a = (a + b) / 2.0
    %op1_a_add_b = fadd double %a, %b
    %a_next = fmul double %op1_a_add_b, 0.5

    ; b = sqrt(an * b)
    %op2_an_mul_b = fmul double %a, %b
    %b_next = call double @llvm.sqrt.f64(double %op2_an_mul_b)

    ; t = t - p * pow(a - an, 2)
    %op3_a_sub_an = fsub double %a_next, %a
    %op3_aan_pow_2 = fmul double %op3_a_sub_an, %op3_a_sub_an
    %op3_p_mul_aan = fmul double %p, %op3_aan_pow_2
    %t_next = fsub double %t, %op3_p_mul_aan

    ; p *= 2
    %p_next = fmul double %p, 2.0

    %cond = icmp slt i32 %i, %iterations
    %i_next = add i32 %i, 1
    br i1 %cond, label %loop, label %exit

exit:
    ; return pow(a + b, 2) / (4 * t)
    %ret_a_add_b = fadd double %a_next, %b_next
    %ret_ab_pow_2 = fmul double %ret_a_add_b, %ret_a_add_b
    %ret_4_mul_t = fmul double 4.0, %t_next
    %ret_ab2_div_4t = fdiv double %ret_ab_pow_2, %ret_4_mul_t
    ret double %ret_ab2_div_4t
}

define i32 @main() {
entry:
    %result = call double @gauss_legendre(i32 10)
    call i32 (i8*, ...) @printf(i8* @fmt, double %result)
    ret i32 0
}
