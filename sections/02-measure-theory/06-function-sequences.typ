#import "../../utils/core.typ": * 
== Последовательности функций

#let converges = sym.arrows.rr

#notice(name: "Напоминание")[
    1. $f_n, f: E --> overline(RR)$, $f_n$ поточечно сходится к $f$, если $f(x) = lim_(n -> oo) f_n (x)$ для всех $x in E$.
    2. $f_n, f: E --> RR$, $f_n converges f$ на $E$ (равномерно сходится на $E$) если $sup_(x in E) abs(f_n (x) - f(x)) -->_(n->+oo) 0$.
]

#def[
    Пусть $f_n, f: E --> overline(RR)$. $f_n$ сходится к $f$ _почти везде по мере $mu$_, если $exists e subset E$, такое, что $mu e = 0$ и $f(x) = lim_(n -> oo) f_n (x)$ для любого $E without e$.
]

#denote[
    $ Ll(E, mu) = {f: E --> overline(RR) "измеримые" : mu E {f = plus.minus oo} = 0} $
]

#def[
    $f_n, f: E --> overline(RR)$. $f_n$ сходится к $f$ по мере $mu$, если $ forall eps > 0 space mu E {abs(f_n - f) > eps} -->_(n -> oo) 0. $
]

#notice[
    Равномерная сходимость влечет поточечную, а поточечная влечет сходимость почти везде. Из равноменой сходимости следует сходимость по мере.
]

#show regex("\bПВ\b"): "почти везде"

#pr(name: "Единственность предела")[
    1. Если $f_n$ сходится почти везде к $f$ и $f_n$ сходится почти везде к $g$, то $mu E{f != g} = 0$.
    2. Если $f_n$ сходится к $f$ по мере $mu$ и $f_n$ сходится к $g$ по мере $mu$, то $mu E{f != g} = 0$.
]

#proof[
    1. Пусть вне $e_1$, $f_n$ сходится к $f$ поточечно, а вне $e_2$ $f_n$ схоидтся к $g$ поточечно. Тогда вне $e_1 union e_2$, $f_n --> f$ и $f_n --> g$, значит вне этого объединения, $f = g$. Тогда $f(x) != g(x) ==> x in e_1 union e_2$, и $mu E{e_1 union e_2} = 0$. Значит $mu E{f != g} = 0$.

    2. Так как $E{f != g} = Union_(n = 1)^oo E{abs(f - g) > 1/n}$, достаточно доказать, что $mu E {abs(f - g) > 1/n} = 0$. 
        $ forall k quad E{abs(f - g) > 1/n} subset E{abs(f_k - f) > 1/(2n)} union E{abs(f_k - g) > 1/(2n)}. $
        А $mu E{abs(f_k - f) > 1/(2n)} -->_(k->oo) 0$. Значит $mu E{abs(f - g) > 1/n} = 0$. Получили что $mu E{f != g} = 0$.
]

#th(name: "Лебега")[
    Пусть $mu E < +oo$ и $f_n, f in Ll(E, mu)$. Если $f_n$ сходится к $f$ ПВ, то $f_n$ сходится к $f$ по мере $mu$.
]

#proof[
    Поменяем функции (занулим, например) на множестве нулевой меры так (на всех неприятных точках: там где нет сходимости, на бесконечностях, и т.д.), что все функции станут конечными, сходимость будет поточечной.

    Рассмотрим случаи.
    1. $f_n arrow.br 0$. Пусть $A_n := E{f_n > eps}$. Надо доказать, что $mu A_n --> 0$. Тогда $A_n supset A_(n + 1)$. $eps < f_(n + 1) <= f_n$. Посмотрим на $sect.big_(n = 1)^oo A_n$. Это пустое множество, так как если какой-то $x$ лежит во всех $A_n$, то $f(x) > 0$, чего быть не может. Значит, из непрерывности меры сверху, $lim mu A_n = 0$.

    2. 
        Общий случай. $f_n$ произвольное. $lim_(n->oo) abs(f_n - f) = 0$.    Тогда и верхний предел $ overline(lim_(n -> oo)) abs(f_n - f) = 0 = lim_(n->oo) underbrace(sup_(k >= n) abs(f_k - f), g_n). $
        Тогда $g_n arrow.br 0$, следовательно $mu E {g_n > eps} --> 0$. Так как $ E {g_n > eps} = E {sup_(k >= n) abs(f_k - f) > eps} supset E{abs(f_n - f) > eps}. $
        Отсюда получили то что нужно.
]

#notice[
    1. Условие $mu E < +oo$ существенно. Напирмер, $E = RR$, $mu = lambda_1$, $f_n = bb(1)_[n, +oo)$. $f_n$ сходится к 0 поточечно, но по мере не сходится.

    2. Обратное неверно. Например, $E = [0, 1)$, $mu = lambda_1$, $f_n$ выглядит как
        $
            &bb(1)_[0, 1), \ &bb(1)_[0, 1/2), bb(1)_[1/2, 1), \ &bb(1)_[0, 1/3), bb(1)_[1/3, 2/3), bb(1)_[2/3, 1), \ &bb(1)_[0, 1/4), bb(1)_[1/4, 2/4), bb(1)_[2/4, 3/4), bb(1)_[3/4, 1), \ &dots
        $
        Сейчас мы заведем теорему, которая будет говорить что на самом деле обращать теорему можно, но только для подпоследовательности, а не для всей последовательности. Здесь, например, подойдет подпоследовательность
        $
            bb(1)_[0, 1), bb(1)_[0, 1/2), bb(1)_[0, 1/3), bb(1)_[0, 1/4), dots
        $
]

#th(name: "Рисса")[
    Пусть $f_n, f in Ll(E, mu)$, $f_n$ сходится к $f$ по мере $mu$. Тогда существует $f_n_k$, сходящееся к $f$ почти везде.
]

#proof[
    $forall eps > 0 space mu E{abs(f_n - f) >= eps} -->_(n-->oo) 0$. Берем $n_k > n_(k - 1)$ так, что $ mu underbrace(E{abs(f_n_k - f) >= 1/k}, := A_k) <= 1/2^k $

    Пусть $B_n := Union_(k = n + 1)^oo A_k$. $mu B_n <= sum_(k = n+1)^oo mu A_k <= 1/2^n$. Положим $B := sect.big_(n = 1)^oo B_n$. Тогда $ mu B <= mu B_n <= 1/2^n --> 0 ==> mu B = 0. $

    Проверим, что вне $B$ будет поточечная сходимость. $B_1 supset B_2 supset B_3 supset ... $. Если $x in.not B$, то $x in.not B_n$ для некоторого $n$. Значит $x in.not A_k forall k > n$, и $abs(f_(n_k) - f) < 1/k space forall k > n ==> lim f_(n_k) (x) = f(x).$
]

#follow[
    Если $f_n <= g_n$ ПВ и $f_n$ сходится по мере $mu$ к $f$, $g_n$ сходится по мере $mu$ к $g$, то $f <= g$ ПВ.
]

#proof[
    Выберем подпоследовательность $f_(n_k) --> f$ ПВ и $g_(n_k) --> g$ ПВ. Тогда $f_(n_k) <= g_(n_k)$ ПВ, значит $f <= g$ ПВ.
]

#th(name: "Фреше")[
    Пусть $f: RR^n --> RR$ и $f$ измерима относительно меры Лебега. Тогда сущесвует последовательность $f_n$ непрерывных функций, сходящаяся к $f$ почти везде.
]
#proof[Без доказательства.]

#th(name: "Егорова")[
    Пусть $f_n, f in Ll(E, mu)$, $mu E < +oo$ и $f_n$ сходится к $f$ ПВ. Тогда $forall eps > 0 space exists e subset E space mu e < eps$ и $f_n converges f$ на $E without e$.
]
#proof[Без доказательства.]

#th(name: "Лузина")[
    Пусть $f: E subset RR^m --> RR$ измерима относительно меры Лебега. Тогда для любого $eps > 0$ существует $A subset E$, такое что $mu(E without A) < eps$ и $f bar_A$ непрерывна.
]

#proof[
    Пусть $mu E < +oo$. Продолжим $f$ нулем вне $E$. Получим измеримую функцию во всем пространстве. По теореме Фреше построим последовательность $f_n in C(RR^m)$, такую что $f_n --> f$ ПВ, в частности ПВ на $E$. По теореме Егорова найдется $e in E$ такое, что $mu e < eps$ такое, что $f_n converges f$ на $E without e$. Значит $f bar_(E without e)$ непрерывна. 

    Если $mu E = +oo$, можно разрезать $E$ на куски конечной меры (например, на кубики) и применить предыдущее рассуждение. Надо потребовать от кусочков, чтобы они пересекались с соседями, чтобы непрерывность сохранялась на границах. Если $ E_n = E sect "кубик со стороной 2 по целочисленной решетке" ==> \ exists e_n subset E_n space mu e_n < eps / 2^n and f bar_(E_n without e_n) "непрерывна". $
]
