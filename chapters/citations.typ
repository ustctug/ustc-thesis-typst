= 引用文献的标注
<引用文献的标注>
模板使用 宏包来设置参考文献引用的格式，
更多引用方法可以参考该宏包的使用说明。

== 顺序编码制
<顺序编码制>
=== 角标数字标注法
<角标数字标注法>
#align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [`\cite{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\citet{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\cite[42]{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\cite{knuth86a,tlc2}`],
  [#cite(<knuth86a>)#cite(<tlc2>)],
  [`\cite{knuth86a,knuth84}`],
  [#cite(<knuth86a>)#cite(<knuth84>)],
)
]

=== 数字标注法
<数字标注法>
#align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [`\cite{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\citet{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\cite[42]{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\cite{knuth86a,tlc2}`],
  [#cite(<knuth86a>)#cite(<tlc2>)],
  [`\cite{knuth86a,knuth84}`],
  [#cite(<knuth86a>)#cite(<knuth84>)],
)
]

== 著者-出版年制标注法
<著者-出版年制标注法>
#align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [`\cite{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\citep{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\citet[42]{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\citep[42]{knuth86a}`],
  [#cite(<knuth86a>)],
  [`\cite{knuth86a,tlc2}`],
  [#cite(<knuth86a>)#cite(<tlc2>)],
  [`\cite{knuth86a,knuth84}`],
  [#cite(<knuth86a>)#cite(<knuth84>)],
)
]
