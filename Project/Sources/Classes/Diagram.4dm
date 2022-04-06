Class constructor($type : Text; $source : Text)
	This:C1470.type:=$type
	This:C1470.source:=$source
	
Function kroki()->$response : Object
	// Use "https://kroki.io/" api to get svg
	
	var $blobResponse : Blob
	var $content : Object
	
	$content:=New object:C1471(\
		"diagram_source"; This:C1470.source; \
		"diagram_type"; This:C1470.type; \
		"output_format"; "svg"\
		)
	
	var $result : Integer
	$result:=HTTP Request:C1158(HTTP POST method:K71:2; "https://kroki.io/"; $content; $blobResponse)
	
	$response:=New object:C1471("success"; $result=200)
	If ($response.success)
		$response.svg:=BLOB to text:C555($blobResponse; UTF8 text without length:K22:17)
		This:C1470.svg:=$response.svg
	End if 
	
Function writeSource($file : 4D:C1709.File)
	$file.setText(This:C1470.source)
	
Function writeSvg($file : 4D:C1709.File)
	$file.setText(This:C1470.svg)