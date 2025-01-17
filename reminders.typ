#import "config.typ"
#import "utils/core.typ": *

#set heading(numbering: none)

= Полезные утверждения с первого курса

#def(label: "def-compact")[
  Пусть $X$ --- топологическое пространство. Множество $K subset X$ называется _компактом_, если из любого покрытия $K$ открытыми множествами можно выбрать конечное подпокрытие, которое все равно будет покрывать $K$. 
]

#th(label: "seq-compact")[
  В метрическом пространстве компактность равносильна секвенциальной компактности. Множество $K subset X$ называется секвенциально компактным, если из любой последовательности точек множества $K$ можно выбрать сходящуюся к какой-то точке из $K$ подпоследовательность.
]

#th(label: "R-compact")[
  В $RR^n$ компактность равносильна замкнутости и ограниченности.
]

#th(name: "Вейерштрасса", label: "th-weierstrass")[
  Непрерывная фукнция $f: K --> RR$, где $K$ --- компакт принимает наибольшее и наименьшее значение, то есть $ exists a, b in K space f(a) <= f(x) <= f(b) space forall x in K. $
]

#th(label: "continious-image-compact")[
  Непрерывный образ компакта --- компакт.
]

#def(label: "lagrange")[
  Если функция $f$ непрерывна на отрезке $[a, b]$, и дифференцируема на интервале $(a, b)$, то найдется точка $c in (a, b)$ такая, что
  $
    (f(b) - f(a)) / (b - a) = f(c)
  $
]

#th(name: "о неявной функции", label: "th-implicit-fn")[
  Пусть $f: D --> RR^n$ --- непрерывно дифференцируемая функция из открытого $D subset RR^(n + m)$. Точка $(a, b) in D$ такова, что $f(a, b) = 0$, и производная $A = f'(a, b)$ в этой точке удовлетворяет условию $A(h, 0) = 0 ==> h = 0$. Тогда существует окрестность $W$ точки $b$ и едиснтвенная функция $g: W --> RR^n$ такая, что $g$ --- непрерывно дифференцируема, $g(b) = a$, и для любого $y in W$ выполняется $f(g(y), y) = 0$. 
]
