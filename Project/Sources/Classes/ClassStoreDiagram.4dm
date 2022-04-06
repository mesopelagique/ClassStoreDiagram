
Class constructor($classStore : Object)
	// Initialize with a class store
	This:C1470.cs:=$classStore
	
Function formats()->$formats : Collection
	/// Return the list of supported format 
	$formats:=New collection:C1472("graphviz"; "mermaid")
	
Function graphviz()->$dot : cs:C1710.Diagram
	$dot:=This:C1470.dot()
	
Function dot()->$diagram : cs:C1710.Diagram
	/// Return class diagram in dot format
	var $output : Text
	$output:="digraph{\n"
	
	If (This:C1470.ignore=Null:C1517)
		This:C1470.ignore:=New collection:C1472()
	End if 
	
	C_TEXT:C284($className)
	For each ($className; This:C1470.cs)
		If (This:C1470.ignore.indexOf($className)<0)
			$output:=$output+$className+"[shape=box];\n"
		End if 
	End for each 
	
	C_OBJECT:C1216($class)
	For each ($className; This:C1470.cs)
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
	
	$diagram:=cs:C1710.Diagram.new("graphviz"; $output)
	
Function mermaid()->$diagram : cs:C1710.Diagram
	/// Return class diagram in mermaid format
	
	var $output : Text
	$output:="classDiagram\n"
	
	If (This:C1470.ignore=Null:C1517)
		This:C1470.ignore:=New collection:C1472()
	End if 
	
	var $className : Text
	For each ($className; This:C1470.cs)
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
	
	var $class : Object
	For each ($className; This:C1470.cs)
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
	
	$diagram:=cs:C1710.Diagram.new("mermaid"; $output)
	