
Class constructor
	C_TEXT:C284($1;$2)
	This:C1470.type:=$1
	This:C1470.source:=$2
	
	
Function kroki
	  // Use "https://kroki.io/" api to get svg
	C_OBJECT:C1216($0)
	C_BLOB:C604($blobResponse)
	C_LONGINT:C283($result)
	C_OBJECT:C1216($content)
	
	$content:=New object:C1471(\
		"diagram_source";This:C1470.source;\
		"diagram_type";This:C1470.type;\
		"output_format";"svg"\
		)
	
	$result:=HTTP Request:C1158(HTTP POST method:K71:2;"https://kroki.io/";$content;$blobResponse)
	
	$0:=New object:C1471("success";$result=200)
	If ($0.success)
		$0.svg:=BLOB to text:C555($blobResponse;UTF8 text without length:K22:17)
	End if 