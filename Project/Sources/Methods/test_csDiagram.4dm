//%attributes = {}
C_TEXT:C284($string)
C_OBJECT:C1216($diagram)

C_OBJECT:C1216($𐂷)
$𐂷:=csDiagram (cs:C1710)

/**
dot
**/
$diagram:=$𐂷.dot()
$string:=$diagram.source  // preview on https://dreampuf.github.io/GraphvizOnline/
ASSERT:C1129((Length:C16($string)>0))


$kroki:=$diagram.kroki()
ASSERT:C1129($kroki.success)
ASSERT:C1129((Length:C16($kroki.svg)>0))


/**
mermaid
**/
$diagram:=$𐂷.mermaid()
$string:=$diagram.source  // preview on https://mermaid-js.github.io/mermaid-live-editor
ASSERT:C1129((Length:C16($string)>0))


$kroki:=$diagram.kroki()
ASSERT:C1129($kroki.success)
ASSERT:C1129((Length:C16($kroki.svg)>0))

