Class Demo.WS.Test.Operation.AllergyServiceSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Method GetAllergyByMRN(pRequest As Demo.WS.Test.Request.GetAllergyByMRNRequest, Output pResponse As Demo.WS.Test.Response.GetAllergyByMRNResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "Demo.WS.Test.AllergyServiceSoap"
 Set tSC = ..Adapter.InvokeMethod("GetAllergyByMRN",.GetAllergyByMRNResult,pRequest.MRN)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.GetAllergyByMRNResult=$get(GetAllergyByMRNResult)
 Quit $$$OK
}

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Demo.WS.Test.Request.GetAllergyByMRNRequest">
		<Method>GetAllergyByMRN</Method>
	</MapItem>
</MapItems>
}

}
