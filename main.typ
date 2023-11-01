#import "template.typ": *

#show: thesis.with(
  title: "中国科学技术大学学位论文模板示例文档",
  author: "张三",
)


// #frontmatter()
// #include("chapters/abstract.typ")
#outline()
// #listoffigures
// #listoftables
// #include("chapters/notation.typ")

// #show: mainmatter
#include("chapters/intro.typ")
#include("chapters/floats.typ")
#include("chapters/math.typ")
#include("chapters/citations.typ")

#bibliography("refs.bib")

// #appendix()
// #include("chapters/complementary.typ")

// #backmatter()
// #include("chapters/acknowledgements.typ")
// #include("chapters/publications.typ")
