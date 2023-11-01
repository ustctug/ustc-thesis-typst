#let thesis(
  title: "Thesis title",

  author: "Author",

  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: author)

  let serif_fonts = (
    "Times New Roman",
    "TeX Gyre Termes",
    "SimSun",
    "Songti SC",
  )

  let sans_fonts = (
    "Arial",
    "TeX Gyre Heros",
    "SimHei",
    "Heiti SC",
  )

  // Set the body font.
  set text(
    font: serif_fonts,
    size: 12pt,
    lang: "zh",
  )

  // Configure the page properties.
  set page(
    paper: "a4",
    // 页面设置：上、下 2.54 cm，左、右 3.17 cm，页眉 1.5 cm，页脚 1.75 cm。
    margin: (x: 3.17cm, y: 2.54cm),

    // // 页眉与该部分的章标题相同，宋体 10.5 磅（五号）居中。
    header: locate(loc => {
      let chapter_heading = none
      let i = counter(page).at(loc).first()
      let all = query(heading.where(level: 1), loc)
      if all.any(it => it.location().page() == i) {
        // We are on a page that starts a chapter
        let after = query(selector(heading.where(level: 1)).after(loc), loc)
        if after != () {
          chapter_heading = after.first().body
        }
      } else {
        let before = query(selector(heading.where(level: 1)).before(loc), loc)
        if before != () {
          chapter_heading = before.last().body
        }
      }
      if chapter_heading != none {
        align(center, text(10.5pt, chapter_heading))
      }
    }),

    // 页码：宋体 10.5 磅、页面下脚居中。
    // footer-descent: 12pt,
    // footer: locate(loc => {
    //   let i = counter(page).at(loc).first()
    //   align(center, text(size: 10.5pt, [#i]))
    // }),
    numbering: "1",
  )

  // // Configure paragraph properties.
  set par(leading: 0.78em, first-line-indent: 2em, justify: true)
  // show par: set block(spacing: 0.78em)

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  let circled_number(num) = {
    if num < 0 or num > 50 {
      panic("Invalid circled number")
    } else if num == 0 {
      str.from-unicode(0x24EA)
    } else if num <= 20 {
      str.from-unicode(0x245F + num)
    } else if num <= 35 {
      str.from-unicode(0x3250 + num - 20)
    } else if num <= 50 {
      str.from-unicode(0x32B0 + num - 35)
    }
  }

  // Configure chapter headings.
  let heading_numbering(..args) = {
    if args.pos().len() == 1 {
      numbering("第1章", ..args)
    } else if args.pos().len() == 2 {
      numbering("1.1", ..args)
    } else if args.pos().len() == 3 {
      numbering("1.1.1", ..args)
    } else if args.pos().len() == 4 {
      numbering("1.", args.pos().last())
    } else if args.pos().len() == 5 {
      numbering("（1）", args.pos().last())
    } else if args.pos().len() == 6 {
      // numbering(circled_number, args.pos().last())
      circled_number(args.pos().last())
    }
  }
  set heading(
    numbering: heading_numbering,
  )

  // 各章标题：黑体 16 磅加粗居中，单倍行距，段前 24 磅，段后 18 磅，章序号与章名间空一字。
  show heading: it => {
    if it.level == 1 {
      pagebreak(weak: true)
    }

    // Create the heading numbering.
    let number = if it.numbering != none {
      counter(heading).display(it.numbering)
      if it.level <= 3 {
        h(1em, weak: true)
      } else {
        h(0.5em, weak: true)
      }
    }

    if it.level == 1 {
      set align(center)
      v(24pt)
      set text(font: sans_fonts, weight: "bold", size: 16pt)
      block([#number#it.body])
      v(18pt)
    }
    else if it.level == 2 {
      // 一级节标题：黑体 14 磅左顶格，单倍行距，段前 24 磅，段后 6 磅，序号与题名间空一字。
      v(24pt)
      set text(font: sans_fonts, size: 14pt)
      block([#number#it.body])
      v(6pt)
    }
    else if it.level == 3 {
      // 二级节标题：黑体 13 磅，左缩进两字，单倍行距，段前 12 磅，段后 6 磅，序号与题名间空一字。
      v(12pt)
      set text(font: sans_fonts, size: 13pt)
      block([#h(2em)#number#it.body])
      v(6pt)
    }
    else if it.level == 4 {
      // 三级及以下节标题的格式没有具体规定，按照 Word 模板的格式：
      // 使用黑体 12 磅，左缩进两字，行距 20 磅，段前段后 0 磅，序号与题名间空半字宽。
      set text(font: sans_fonts, size: 12pt)
      block([#h(2em)#number#it.body])
    }
    else if it.level == 5 {
      // 按照 Word 模板的格式，四级节标题：宋体 12 磅，左缩进两字，行距 20 磅，
      // 段前段后 0 磅，序号使用全宽括号，与题名间空半字宽。
      set text(size: 12pt)
      block([#h(2em)#number#it.body])
    }
    else if it.level == 6 {
      // 按照 Word 模板的格式，五级节标题：宋体 12 磅，左缩进两字，行距 20 磅，
      // 段前段后 0 磅，序号使用全宽括号，与题名间空半字宽。
      set text(size: 12pt)
      // block([#number#it.body])
      block([#h(2em)#number#it.body])
    }
  }

  set outline(
    depth: 3,
    indent: 1em,
  )

  // 各章目录要求宋体 14 磅，单倍行距，段前 6 磅，段后 0 磅，两端对齐，
  // 页码右对齐，章序号与章名间空一字。
  // 但是 Word 模板中实际是行距 20 磅。
  show outline.entry.where(level: 1): it => {
    // v(6pt, weak: true)
    // v(6pt)
    // set par(first-line-indent: 0pt)
    text(font: sans_fonts, it)
  }

  set bibliography(
    style: "gb-7114-2015-numeric",
  )

  body
}


// #let mainmatter() = {
//   pagebreak(to: "odd")
//   counter("page").update(0)
// }
