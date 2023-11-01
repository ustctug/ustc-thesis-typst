= 数学
<数学>
== 数学符号
<数学符号>
《撰写手册》要求数学符号遵循 GB/T
3102.11—1993《物理科学和技术中使用的数学符号》 #footnote[原 GB
3102.11—1993，自 2017 年 3 月 23 日起，该标准转为推荐性标准。]。
该标准参照采纳 ISO 31-11:1992 #footnote[目前已更新为 ISO
80000-2:2019。]， 但是与 TeX
默认的美国数学学会（AMS）的符号习惯有所区别。 具体地来说主要有以下差异：

+ 大写希腊字母默认为斜体，如
  $ Gamma Delta Theta Lambda Xi Pi Sigma Upsilon Phi Psi Omega dot.basic $
  注意有限增量符号 $laplace$ 固定使用正体，模板提供了 命令。

+ 小于等于号和大于等于号使用倾斜的字形 $lt.eq$、$gt.eq$。

+ 积分号使用正体，比如 $integral$、$integral.cont$。

+ 偏微分符号 $diff$ 使用正体。

+ 省略号 按照中文的习惯固定居中，比如
  $ 1 comma 2 comma dots.h comma n quad 1 plus 2 plus dots.h plus n dot.basic $

+ 实部 $Re$ 和虚部 $Im$ 的字体使用罗马体。

以上数学符号样式的差异可以在模板中统一设置。
但是还有一些需要用户在写作时进行处理：

+ 数学常数和特殊函数名用正体，如 \$\$\\uppi \= 3.14\\dots; \\quad
        \\symup{i}^2 \= -1; \\quad
        \\symup{e} \= \\lim\_{n \\to \\infty} \\left\( 1 + \\frac{1}{n} \\right)^n.\$\$

+ 微分号使用正体，比如 \$\\dif y / \\dif x\$。

+ 向量、矩阵和张量用粗斜体（），如
  $bold(x)$、$bold(Sigma)$、\$\\symbfsf{T}\$。

+ 自然对数用 $ln x$ 不用 $log x$。

模板中使用 宏包配置数学字体。 该宏包与传统的 、、、 、
等宏包#emph[不]兼容。 本模板作了处理，用户可以直接使用 , , 等命令。
关于数学符号更多的用法，参见 宏包的使用说明和符号列表 。

== 数学公式
<数学公式>
数学公式可以使用 和 环境。 注意数学公式的引用应前后带括号，建议使用
命令，比如式~#link(<eq:example>)[\[eq:example\]]。
// \$\$\\hat{f}\(\\xi) \= \\int\_{-\\infty}^\\infty f\(x) \\eu^{-2 \\uppi \\iu x \\xi} \\dif x.
//   \\label{eq:example}\$\$
$ hat(xi) = d x $
<eq:example>

多行公式尽可能在"\="处对齐，推荐使用
// 环境，比如式~#link(<eq:align_2>)[\[eq:align\_2\]]。
$ a & eq b plus c plus d plus e\
 & eq f plus g dot.basic $

== 量和单位
<量和单位>
量和单位要求严格执行 GB 3100～3102—1993 有关量和单位的规定。 宏包
提供了更好的数字和单位支持：

- 为了阅读方便，四位以上的整数或小数推荐采用千分空的分节方式：55235367.34623。
  四位以内的整数可以不加千分空：1256。

- 数值与单位符号间留适当空隙：25.4~mm，5.97~×~10#super[24]~kg，
  −273.15~°C。 例外：12.3~°，1°2′3″。

- 组合单位默认使用 APS 的格式，即相乘的单位之间留一定空隙：
  kg~m~s#super[−2]， 也可以使用居中的圆点： kg~m~s#super[−2]。 GB
  3100—1993 对两者都允许，建议全文统一设置。

- 量值范围使用"～"：10~mol/L–15~mol/L。

- 注意：词头 不能写为 u，如：umol 应为 μmol、μmol。

== 定理和证明
<定理和证明>
示例文件中使用 宏包配置了定理、引理和证明等环境。 用户也可以使用 宏包。

#block[
If the integral of function $f$ is measurable and non-negative, we
define its \(extended) #strong[Lebesgue integral] by
$ integral f eq sup_g integral g comma $ where the supremum is taken
over all measurable functions $g$ such that $0 lt.eq g lt.eq f$, and
where $g$ is bounded and supported on a set of finite measure.

]
#block[
The communication graph is strongly connected.

]
#block[
Simple examples of functions on $bb(R)^d$ that are integrable \(or
non-integrable) are given by
$ f_a lr((x)) eq cases(delim: "{", lr(|x|)^(minus a) & upright("if ") lr(|x|) lt.eq 1 comma, 0 & upright("if ") x gt 1 dot.basic) $
$ F_a lr((x)) eq frac(1, 1 plus lr(|x|)^a) comma #h(2em) upright("all ") x in bb(R)^d dot.basic $
Then $f_a$ is integrable exactly when $a lt d$, while $F_a$ is
integrable exactly when $a gt d$.

]
#block[
Suppose $brace.l f_n brace.r$ is a sequence of measurable functions with
$f_n gt.eq 0$. If $lim_(n arrow.r oo) f_n lr((x)) eq f lr((x))$ for a.e.
$x$, then
$ integral f lt.eq liminf_(n arrow.r oo) integral f_n dot.basic $

]
#block[
We do not exclude the cases $integral f eq oo$, or
$liminf_(n arrow.r oo) f_n eq oo$.

]
#block[
Suppose $f$ is a non-negative measurable function, and
$brace.l f_n brace.r$ a sequence of non-negative measurable functions
with $f_n lr((x)) lt.eq f lr((x))$ and $f_n lr((x)) arrow.r f lr((x))$
for almost every $x$. Then
$ lim_(n arrow.r oo) integral f_n eq integral f dot.basic $

]
#block[
Suppose $f$ is integrable on $bb(R)^d$. Then for every
$epsilon.alt gt 0$:

+ There exists a set of finite measure $B$ \(a ball, for example) such
  that $ integral_(B^c) lr(|f|) lt epsilon.alt dot.basic $

+ There is a $delta gt 0$ such that
  $ integral_E lr(|f|) lt epsilon.alt #h(2em) upright("whenever ") m lr((E)) lt delta dot.basic $

]
#block[
Suppose $brace.l f_n brace.r$ is a sequence of measurable functions such
that $f_n lr((x)) arrow.r f lr((x))$ a.e. $x$, as $n$ tends to infinity.
If $lr(|f_n lr((x))|) lt.eq g lr((x))$, where $g$ is integrable, then
$ integral lr(|f_n minus f|) arrow.r 0 #h(2em) upright("as ") n arrow.r oo comma $
and consequently
$ integral f_n arrow.r integral f #h(2em) upright("as ") n arrow.r oo dot.basic $

]
#block[
#emph[Proof.] Trivial.~◻

]
#block[
#strong[Axiom of choice 1.1]. #emph[Suppose $E$ is a set and $E_alpha$
is a collection of non-empty subsets of $E$. Then there is a function
$alpha arrow.r.bar x_alpha$ \(a "choice function") such that
$ x_alpha in E_alpha comma #h(2em) upright("for all ") alpha dot.basic $]

]
#block[
#strong[Observation 1.1]. #emph[Suppose a partially ordered set $P$ has
the property that every chain has an upper bound in $P$. Then the set
$P$ contains at least one maximal element.]

]
#block[
#emph[A concise proof.] Obvious.~◻

]
