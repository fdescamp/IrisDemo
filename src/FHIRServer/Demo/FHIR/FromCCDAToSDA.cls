Class Demo.FHIR.FromCCDAToSDA Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As EnsLib.EDI.XML.Document, Output pResponse As HS.Message.ECRUpdateResponse) As %Status
{
	
	
   //-------------------- Transform CDA to SDA -------------------------------------------------
   if $IsObject($get(%healthshare("Transformer"))) {
        set tTransformer = %healthshare("Transformer")
	}
	else {
    	set tTransformer = ##class(HS.Util.XSLTTransformer).%New()
        set %healthshare("Transformer")=tTransformer
	}
	
	//Export XML vdoc in stream
	set tSC=pRequest.XMLExportToStream(.tCCDAStream) Quit:$$$ISERR(tSC) tSC
	
	Set tSC = tTransformer.Transform(tCCDAStream,"SDA3/CDA-to-SDA.xsl",.SDA) Quit:$$$ISERR(tSC) tSC
	$$$TRACE(SDA)
	
	//------------------ Send to SDA to FHIR process ---------------------------------------------
	set tECRRequest=##class(Ens.StreamContainer).%New()
	do tECRRequest.StreamSet(SDA)
	//set tECRRequest=##class(HS.Message.ECRUpdateRequest).%New()
	//set tECRRequest.ContentStream=SDA
	
	set tSC = ..SendRequestAsync("HS.FHIR.FromSDA.DTL.Transaction.Process",tECRRequest) Quit:$$$ISERR(tSC) tSC
	
	Quit $$$OK
}

/// Handle a 'Response'
Method OnResponse(request As %Library.Persistent, ByRef response As %Library.Persistent, callrequest As %Library.Persistent, callresponse As %Library.Persistent, pCompletionKey As %String) As %Status
{
	// Subclass responsibility
	Quit $$$OK
}

Storage Default
{
<Data name="FromCCDAToSDADefaultData">
<Subscript>"FromCCDAToSDA"</Subscript>
<Value name="1">
<Value>TraceOperations</Value>
</Value>
</Data>
<DefaultData>FromCCDAToSDADefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
