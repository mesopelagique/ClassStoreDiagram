
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
	
	If (This:C1470.ignore=Null:C1517)
		This:C1470.ignore:=New collection:C1472()
	End if 
	
	C_TEXT:C284($className)
	For each ($className;This:C1470.cs)
		If (This:C1470.ignore.indexOf($className)<0)
			$output:=$output+$className+"[shape=box];\n"
		End if 
	End for each 
	
	C_OBJECT:C1216($class)
	For each ($className;This:C1470.cs)
		If (This:C1470.ignore.indexOf($className)<0)
			$class:=This:C1470.cs[$className]
			If ($class.superclass#Null:C1517)
				If (This:C1470.ignore.indexOf($class.superclass.name)<0)
					$output:=$output+$className+"->"+$class.superclass.name+";\n"
				End if 
			End if 
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
	
	If (This:C1470.ignore=Null:C1517)
		This:C1470.ignore:=New collection:C1472()
	End if 
	
	C_TEXT:C284($className)
	For each ($className;This:C1470.cs)
		If (This:C1470.ignore.indexOf($className)<0)
			$output:=$output+"\tclass "+$className+" {\n"
/*
For each($functionName;$class.functions)
$output:=$output+"\t\t"+$className+":"+$functionName+"() \n"
End for each 
*/
			$output:=$output+"\t}\n"
		End if 
	End for each 
	
	C_OBJECT:C1216($class)
	For each ($className;This:C1470.cs)
		If (This:C1470.ignore.indexOf($className)<0)
			$class:=This:C1470.cs[$className]
			If ($class.superclass#Null:C1517)
				If (This:C1470.ignore.indexOf($class.superclass.name)<0)
					$output:=$output+$class.superclass.name+" <|-- "+$className+"\n"
				End if 
			End if 
		End if 
	End for each 
	
	$output:=$output+"\n"
	
	$0:=cs:C1710.Diagram.new("mermaid";$output)
	