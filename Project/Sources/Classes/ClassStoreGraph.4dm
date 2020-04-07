
Class constructor
	  // Initialize with a class store
	C_OBJECT:C1216($1)
	This:C1470.cs:=$1
	
Function formats
	  /// Return the list of supported format 
	C_COLLECTION:C1488($0)
	$0:=New collection:C1472("dot";"mermaid")
	
Function graphviz
	C_OBJECT:C1216($0)
	$0:=This:C1470.dot()
	
Function dot
	  /// Return class diagram in dot format
	C_OBJECT:C1216($0)
	C_TEXT:C284($output)
	
	$output:="digraph{\n"
	
	C_TEXT:C284($className)
	For each ($className;This:C1470.cs)
		$output:=$output+$className+"[shape=box];\n"
	End for each 
	
	C_OBJECT:C1216($class)
	For each ($className;This:C1470.cs)
		$class:=This:C1470.cs[$className]
		If ($class.superclass#Null:C1517)
			$output:=$output+$className+"->"+$class.superclass.name+";\n"
		End if 
	End for each 
	$output:=$output+"\n"
	$output:=$output+"}"
	
	$0:=cs:C1710.Diagram.new("graphviz";$output)
	
Function mermaid
	  /// Return class diagram in mermaid format
	C_OBJECT:C1216($0)
	C_TEXT:C284($output)
	
	$output:="classDiagram\n"
	
	C_TEXT:C284($className)
	For each ($className;This:C1470.cs)
		$output:=$output+"\tclass "+$className+" {\n"
/*
For each($functionName;$class.functions)
$output:=$output+"\t\t"+$className+":"+$functionName+"() \n"
End for each 
*/
		$output:=$output+"\t}\n"
	End for each 
	
	C_OBJECT:C1216($class)
	For each ($className;This:C1470.cs)
		$class:=This:C1470.cs[$className]
		If ($class.superclass#Null:C1517)
			$output:=$output+$class.superclass.name+" <|-- "+$className+"\n"
		End if 
		
	End for each 
	
	$output:=$output+"\n"
	
	$0:=cs:C1710.Diagram.new("mermaid";$output)
	