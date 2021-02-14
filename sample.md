---
title: タイトル
etitle: Enlish title
author: 著者名
abstract: |
	恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。自分は停車場のブリッジを、上って、降りて、そうしてそれが線路をまたぎ越えるために造られたものだという事には全然気づかず、ただそれは停車場の構内を外国の遊戯場みたいに、複雑に楽しく、ハイカラにするためにのみ、設備せられてあるものだ

documentclass: jlreq
classoption: 
- notitlepage
- oneside
geometry:
- margin=1in
indent: true
listings: true
figureTitle: "図 "
tableTitle: "表 "
listingTitle: "コード "
figPrefix: "図"
eqnPrefix: "式"
tblPrefix: "表"
lstPrefix: "コード"
---

# 見出し
## 見出し

**親譲りの無鉄砲**で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。[^aozora_bocchan]

つれづれなるまゝに、日暮らし、硯にむかひて、心にうつりゆくよしなし事を、そこはかとなく書きつくれば、あやしうこそものぐるほしけれ。[^tsurezuregusa]

[^aozora_bocchan]: 坊ちゃん
[^tsurezuregusa]: 徒然草

![アヒルまたはウサギ](image/aspect.pdf){#fig:aspect width=60mm}

pandoc-crossrefを利用し、[@fig:aspect]の参照を自動で設定。[@tbl:simple-table]も参照できる。

| 右寄せ | 左寄せ | デフォルト | 中央寄せ |
|------:|:-----|---------|:------:|
|    1  |    1 |     1   |     1  |
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |

:表のサンプル {#tbl:simple-table}

## 数式
### インライン数式モード
本文中に $E = mc^2$ のように数式を埋め込むことができる。

$\displaystyle F=G\frac{Mm}{r^2}$ のように高さのある式はdisplaystyleを利用するとよい。


### ディスプレイ数式モード
$$
\begin{aligned}
x+y = 
&\begin{cases}
xとyの和 & \,x < 57\,かつ\,y < 57の場合\\
5 & \,それ以外の場合。
\end{cases}
\end{aligned}
$$ {#eq:quus}


[@eq:quus] も参照可能。

改ページ
\clearpage


## ソースコード
```{#lst:dockerfile caption="Dockerfile"}
FROM hisaboh/debian-texlive-ja

ENV PANDOC_VERSION=2.11.4
ENV PANDOC_PACKAGE=pandoc-${PANDOC_VERSION}-1-amd64.deb
ENV CROSSREF_VERSION=v0.3.9.1

WORKDIR /tmp

# install xz
RUN apt-get update && \
    apt-get install -y xz-utils && \
    # Clean caches
    apt-get autoremove -y && \
    apt-get clean

WORKDIR /workdir
```

# 参考文献 {-}

1. Frascolla, Pasquale. 1994. *Wittgenstein's philosophy of mathematics*. Routledge.
2. Marion, Mathieu. 1998. *Wittgenstein, Finitisim, and the Foundations of Mathematics*. Clarion Press.
3. 大野波矢登．2001．「ウィトゲンシュタインと有限主義」．『哲学』2001．229-238,305．日本哲学会
4. 野矢茂樹．2006．『ウィトゲンシュタイン『論理哲学論考』を読む』．筑摩書房（ちくま学芸文庫）

\makeatletter
\renewcommand{\refname}{latex形式の参考文献}
\makeatother

\begin{thebibliography}{99}
\bibitem{} Frascolla, Pasquale. 1994. \textit{Wittgenstein's philosophy of mathematics}. Routledge.
\bibitem{} Marion, Mathieu. 1998. \textit{Wittgenstein, Finitisim, and the Foundations of Mathematics}. Clarion Press.
\bibitem{} 大野波矢登．2001．「ウィトゲンシュタインと有限主義」．『哲学』2001．229-238,305．日本哲学会
\bibitem{} 野矢茂樹．2006．『ウィトゲンシュタイン『論理哲学論考』を読む』．筑摩書房（ちくま学芸文庫）．
\end{thebibliography}