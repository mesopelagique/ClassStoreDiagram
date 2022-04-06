//%attributes = {"shared":true}
#DECLARE($method : Text; $cs : Object; $cmd : Text)

var $hostFolder; $docFolder; $file; $configFile; $csdiag; $diagram; $config : Object

$hostFolder:=Folder:C1567(fk database folder:K87:14; *)
$configFile:=$hostFolder.file(".csDiagram.json")
$docFolder:=$hostFolder.folder("Documentation")
If (Not:C34($docFolder.exists))
	$docFolder.create()
End if 

If (($cmd="kroki") | (Position:C15("[class]"; $method)=1))  // Just to not do it for nothing
	If ($configFile.exists)
		$config:=JSON Parse:C1218($configFile.getText())
	Else 
		$config:=New object:C1471("format"; "mermaid"; "kroki"; True:C214; "name"; "classDiagram"; "ignore"; New collection:C1472("Object"; "EntitySelection"; "DataStore"; "_DataStore"; "Entity"; "DataClass"))
		$configFile.setText(JSON Stringify:C1217($config; *))
	End if 
	$file:=$docFolder.file(String:C10($config.name)+"."+$config.format)
End if 

Case of 
	: (($cmd="save") | ($cmd="create"))
		If (Position:C15("[class]"; $method)=1)
			$csdiag:=csDiagram($cs)
			$csdiag.ignore:=$config.ignore
			$diagram:=$csdiag[$config.format].call($csdiag)
			
			$diagram.writeSource($file)
			
			$docFolder.file(String:C10($config.name)+".md").setText("# Class store diagram\n\n```mermaid\n"+$diagram.source+"\n```")
			
		End if 
	: ((($cmd="close") & (Position:C15("[class]"; $method)=1)) | ($cmd="kroki"))
		If ($file.exists)
			If (Bool:C1537($config.kroki))
				$diagram:=cs:C1710.Diagram.new($config.format; $file.getText())
				$diagram.kroki()
				$diagram.writeSvg($docFolder.file(String:C10($config.name)+".svg"))
			End if 
		End if 
	Else 
		
End case 
