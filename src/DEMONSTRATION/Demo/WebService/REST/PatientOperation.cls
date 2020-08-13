/// This business operation accepts a request for Person or Employee directory services. The request specifies the action to be taken and any additional parameters needed.
/// Then the remote REST service is invoked using the appropriate HTTP command, URL, and JSON formatted payload.  The REST HTTP response is then parsed and the values are returned in a response object.
/// This demonstrates automatically and manually constructing and sending a JSON payload, and retrieving and parsing a JSON object or collection response.
/// It also demonstrates use of the four CRUD operations in the RESTful HTTP context: Create/PUT, Retrieve/GET, Update/POST, and Delete/DELETE.
Class Demo.WebService.REST.PatientOperation Extends EnsLib.REST.Operation
{

Method OnMessage(pRequest As Demo.WebService.REST.PatientRequest, Output pResponse As Demo.WebService.REST.PatientResponse) As %Status
{
	try {
		If (pRequest.MRN="") {
			Set tSC=$$$ERROR($$$EnsErrGeneral,"MRN is mandatory")
			Quit
		}
		Set tCmd=$ZConvert(pRequest.Command,"U")
		If tCmd = "GET" {
			Set tURL=..Adapter.URL_"/"_$$$URLENCODE(pRequest.MRN)
			
			
			Set tSC=..Adapter.GetURL(tURL,.tHttpResponse)
			
			Set:$$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
			Set tSC1 = pRequest.NewResponse(.pResponse)  Set:$$$ISERR(tSC1) tSC=$$$ADDSC(tSC,tSC1)
			Set pResponse.SessionId=..%RequestHeader.SessionId
			Set pResponse.RequestURL="Get "_tURL
			Quit:$$$ISERR(tSC)
			If $$$IsdefObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
				For i=0:1:31 { Continue:$Case(i,9:1,10:1,13:1,:0)  Set tArr($I(tArr))=$C(i), tArr($I(tArr))="" } ; strip control chars from raw stream copy
				Do ##class(%IO.MetaCharacterStream).%New(tHttpResponse.Data).CopyReplaceArray(pResponse.RawResponse,,,,,,,"IO",.tSC,.tArr)
			} Else {  Set tSC=$$$ERROR($$$EnsErrGeneral,"No response data")  Quit  }
		} 
	} catch {
		Set tSC=$$$SystemError
	}
	Quit tSC
}

}
