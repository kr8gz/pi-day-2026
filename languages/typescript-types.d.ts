// this is the least accurate implementation, only getting to 3.2
// it should be treated as a proof-of-concept
type SCALE = 10;
type ITERATIONS = 1;

type Length<T extends any[]> = T extends { length: infer L extends number } ? L : 0;
type Tuple<L extends number, T extends any[] = []> = Length<T> extends L ? T : Tuple<L, [...T, any]>;

type Add<A extends number, B extends number> = Length<[...Tuple<A>, ...Tuple<B>]>;
type Sub<A extends number, B extends number> = Tuple<A> extends [...Tuple<B>, ...infer Rest]
    ? Length<Rest>
    : never;

type RepeatAdd<A extends any[], B extends number, R extends any[] = []> = B extends 0
    ? R
    : RepeatAdd<A, Sub<B, 1>, [...R, ...A]>;
type Mul<A extends number, B extends number> = Length<RepeatAdd<Tuple<A>, B>>;
type Square<A extends number> = Mul<A, A>;

type Lt<A extends number, B extends number> = Sub<A, B> extends never ? true : false;
type Neq<A extends number, B extends number> = A extends B ? false : true;

type Half<A extends number, T extends any[] = [], C extends any[] = Tuple<A>> = 
    C extends [any, any, ...infer Rest]
        ? Half<A, [...T, any], Rest>
        : Length<T>;
type RepeatSub<A extends number, B extends number, R extends any[] = []> = Lt<A, B> extends true
    ? Length<R>
    : RepeatSub<Sub<A, B>, B, [...R, any]>;
type Div<A extends number, B extends number> = RepeatSub<A, B, []>;

type Sqrt<N extends number, X extends number = N, Prev extends number = 0> = Neq<X, Prev> extends true
    ? Sqrt<N, Half<Add<X, Div<N, X>>>, X>
    : X;

type Descale<N extends number> = Div<N, SCALE>;

type GetT<A extends number, B extends number, T extends number, P extends number> =
    Add<A, B> extends infer ABSum extends number
        ? Half<ABSum> extends infer An extends number
            ? Sub<A, An> extends infer Diff extends number
                ? Square<Diff> extends infer DiffSq extends number
                    ? Descale<DiffSq> extends infer Descaled extends number
                        ? Mul<P, Descaled> extends infer PDiff extends number
                            ? Sub<T, PDiff>
                            : 0
                        : 0
                    : 0
                : 0
            : 0 
        : 0;

type GaussLegendre<I extends number = ITERATIONS, A extends number = 10, B extends number = 7, T extends number = 2, P extends number = 10> =
    I extends 0
        ? Add<A, B> extends infer ABSum extends number
            ? Square<ABSum> extends infer SqABSum extends number
                ? Mul<4, T> extends infer T4 extends number
                    ? Div<SqABSum, T4> extends infer Pi extends number
                        ? Pi
                        : 0
                    : 0
                : 0
            : 0
        : Half<Add<A, B>> extends infer An extends number
            ? Sqrt<Mul<A, B>> extends infer Bn extends number
                ? GetT<A, B, T, P> extends infer Tn extends number
                    ? Mul<P, 2> extends infer Pn extends number
                        ? GaussLegendre<Sub<I, 1>, An, Bn, Tn, Pn>
                        : 0 
                    : 0
                : 0
            : 0;

type Format<A extends number> = `${A}` extends `${infer FirstDigit}${infer Rest}`
    ? `${FirstDigit}.${Rest}`
    : `${A}`;
type Pi = Format<GaussLegendre>;