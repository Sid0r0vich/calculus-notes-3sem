#import "../../utils/core.typ": *

== Аналитическое продолжение

#def(label: "def-analitical-continuation")[
  Пусть $f in H(Omega)$, $g in H(tilde(Omega))$. $Delta$ --- компонента связности $Omega sect tilde(Omega)$. Если $f(z) = g(z)$ на $Delta$, то $g$ --- _непосредсвенное аналитическое продолжение $f$ на $tilde(Omega)$ через $Delta$_.

  #figure(
    image("../../images/direct-analytical-continuation.svg", width: 10cm),
    caption: [Пример функции, у которой, возможно, неоднозначно определено непосредственное аналитическое продолжение на $tilde(Omega)$.]
  )

  Под компонентой связности здесь подразумевается какое-то максимальное по включению связное подмножество, ну, или элемент факторизации множества по отношению достижимости.
]

#notice[
  1. Если $Delta$ зафиксирована, то продолжение единственно#rf("uniqueness").
  2. Если выбрать другую компоненту связности и продолжить, то может получиться другая функция.
]

#def(label: "def-chain-analitical-continuation")[
  Пусть $f in H(Omega)$, $g in H(tilde(Omega))$. _$g$ --- аналитическое продолжение по цепочке областей_, если существуют области $Omega_0 = Omega$, $Omega_1$, $Omega_2$, ..., $Omega_n = tilde(Omega)$, такие, что $f_0 equiv f$, $f_1 in H(Omega_1)$, $f_2 in H(Omega_2)$, ..., $f_(n - 1) in H(Omega_(n - 1))$, $f_n = g$ и $f_k$ --- непосредственное аналитическое продолжение $f_(k - 1)$#rf("def-analitical-continuation").
  
  #figure(
    image("../../images/chain-analytical-continuation.svg"),
    caption: [Подозрительное аналитическое продолжение по цепочке областей.]
  )
]

#notice[
  1. Продолжение по цепочке областей зависит от выбора областей связности в цепочке.
  2. Все промежуточные области можно сделать кругами. Рассмотрим для этого кривую из одной области в другую, покроем эту кривую кругами, и выберем конечное подпокрытие.
]

#example(label: "gamma-continuation")[
  $Gamma$-функция. Пусть $Gamma(z) := integral_0^(+oo) t^(z - 1) e^(-t) dif t$. Знаем $t^z := e^(z ln t)$, $ abs(t^z) = abs(e^(z ln t)) = e^(ln t dot Re z) = t^(Re z). $
  Значит под интегралом стоит штука, которая по модулю ограничена $t^(Re z - 1) e^(-t)$, а при $Re z > 0$, интеграл абсолютно сходится. Значит $Gamma in H(Re z > 0)$, ведь $Gamma'(z) = integral_0^(+oo) t^(z - 1) ln(t) e^(-t) dif t$, так как $abs(t^(z - 1) ln t e^(-t)) = t^(Re z - 1) abs(ln t) e^(-t)$.

  У нас есть формула $z Gamma(z) = Gamma(z + 1)$, она верна для $z > 0$, а значит, по теореме о единственности, верна для $Re z > 0$. Тогда $Gamma(z) = Gamma(z + 1) / z$. Рассмотрим функцию $Gamma_1(z) := Gamma(z + 1)/z in H(Re z > -1)$. Это лежит в $H({Re z > -1} without {0})$, и это аналитическое продолжение. Далее рассмотрим $Gamma_2(z) := Gamma(z + 2) / (z (z + 1)) in H({Re z > -2} without {0, -1})$. Ну и так далее. Можно дальше продолжать $Gamma$ на $CC without {0, -1, -2, ...}$
]

#example(label: "def-reimann-zeta")[
  $zeta$-функция Римана.

  $ zeta(z) = sum_(n = 1)^oo 1/(n^z). $

  Так как $abs(n^z) = n^(Re z)$, при $Re z > 1$, ряд абсолютно сходится. Попробуем продифференцировать,
  $
    zeta'(z) = -sum_(n = 1)^oo ln(n)/n^z.
  $
  Так как $abs((ln n)/(n^z)) <= (ln z)/(n^a)$, для какого-то $1 < a < Re z$. По признаку Виерштрасса, ряд сходится абсолютно равномерно при $Re z > a$, и можно дифференцировать. Значит $zeta in H(Re z > 1)$.

  Заметим, что
  $
    (1 - 2/(2^z)) zeta(z) = sum_(n = 1)^oo (-1)^(n - 1)/(n^z) "при" Re z > 1.
  $
  Действительно,
  $
    (1 - 2/(2^z)) zeta(z) = sum_(n = 1)^oo 1/(n^z) - 2 sum_(n = 1)^oo 1/(2n)^z = sum_(n = 1)^oo (-1)^(n - 1)/(n^z).
  $
  А штука справа голоморфна, при $Re z > 0$, так как $1/(2n - 1)^z - 1/(2n)^z sim z/(2n)^(z + 1)$. Для производной тоже будет сходимость (опустим эти вычисления).

  Формула
  $
    1/(1 - 2/(2^z)) sum_(n = 1)^oo (-1)^(n - 1)/(n^z) = zeta(z)
  $
  Задает продолжение в ${Re z > 0} without {1}$. Можно продолжать функцию и далее, до $CC without {"какое-то множество, разберитесь сами"}$.
]

#def(label: "def-complete-analytical-fn")[
  Разобьем множество пар $(f, Omega)$, где $f in H(Omega)$ на классы эквивалентности по отношению эквивалентности --- аналитическое продолжение по цепочке. Назовем класс эквивалентности _полной аналитической функцией_.

  Если $F$ --- полная аналитическая функция, то
  множество $M := Union_((f, Omega) in F) Omega$ --- область существования $F$.

  Обозначим ${f(z) : (f, Omega) in F and z in Omega}$ _значением полной аналитической функции в точке $z$_.
]

#pr[
  $M$ --- область.
]

#proof[
  Объединение открытых --- открыто.

  Связность: пусть $z_0 in Omega_0$ ($(f_0, Omega_0) in F$), $z_* in Omega_*$ ($(f_*, Omega_*) in F$). Возьмем множества из аналитического продолжения $f_0$, и пойдем по этим множествам. Получили связность.
]

#notice[
  Теорема Пуанкаре-Вольтерры: $F(z)$ --- не более чем счетное для любого $z in M$. (Пока?) не успели.
]

#example[
  $f(z) = sum_(n = 0)^oo z^n in H({abs(z) < 1})$. Тогда $g(z) = 1/(1 - z) in H(CC without {1})$ --- аналитическое продолжение $f$.
  $
    1/(1 - z) = 1/(1 - a) dot 1/(1 - (z - a)/(1 - a)) = 1/(1 - a) dot sum_(n = 0)^oo ((z - a)/(1 - a))^n = sum_(n = 0)^oo (z - a)^n/(1 - a)^(n + 1).
  $
  Радиус сходимости в таком случае --- $abs(1 - a)$.
]

#def(label: "def-special-point")[
  $f(z) = sum_(n = 0)^oo c_n (z - a)^n$, $abs(z - a) < R$. Рассмотрим точку $b$ такую, что $abs(b - a) = R$. Назовем $b$ --- _правильной_ точкой, если существует $g in H({abs(z - b) < r})$ такая, что она на пересечении ${abs(z - a) < R} sect {abs(z - b) < r}$ она совпадает с $f$. Иначе, назовем точку _особой_.
]

#th(label: "special-point-on-bound")[
  На границе круга сходимости обязательно есть особая точка#rf("def-special-point").
]
#proof[
  Пусть круг сходимости имеет центр центром в нуле, $R$ --- его радиус. Пусть все точки $abs(z) = R$ --- правильные#rf("def-special-point"). Берем $abs(a) = R$. Она правильная. Значит сущесвует радиус $r_a > 0$ и $f_a in H(abs(z - a) < r_a)$ и совпадающая с $f$ на пересечении.

  Такими кружочками мы покрыли окружность. Выберем конечное подпокрытие. ${abs(z) = R} subset Union_(k = 1)^n {abs(z - a_k) < r_(a_k)} =: Omega$. Построим 
  $
    g(z) := cases(
      f(z)\, abs(z) < R,
      f_(a_k) (z)\, abs(z - a_k) < r_(a_k)
    ).
  $
  Эта функция голоморфна. 
  
  Осталось показать, что $Omega$ содержит круг ${abs(z) < R + eps}$ для некоторого $eps$. $g$ определена на $Union_(k = 1)^n {abs(z - a_k) < r_(a_k)} union {abs(z) < R}$. Возьмем в качестве $eps$ число из леммы Лебега. Напомню, что это такой радиус, что для любой точки $b$: $abs(b) = R$, шарик ${abs(z - b) < eps}$ полностью содержится в каком-то элементе покрытия. Нашли что хотели. 
]

#examples[
  1. $sum_(n = 1)^oo z^n / n^2$ сходится при $abs(z) <= 1$, но при $z = 1$ продолжения нет.
  2. $sum_(n = 1)^oo z^(2^n)$ сходится при $abs(z) < 1$, но все точки на границе особые.
]
