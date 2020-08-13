Class Demo.WebService.SOAP.Operation.AllergyServiceSoap Extends Ens.BusinessOperation [ ProcedureBlock ]
{

Method GetAllergyByMRN(pRequest As Demo.WebService.SOAP.Request.GetAllergyByMRNRequest, Output pResponse As Demo.WebService.SOAP.Response.GetAllergyByMRNResponse) As %Library.Status
{
 Set ..Adapter.WebServiceClientClass = "Demo.WebService.SOAP.AllergyServiceSoap"
 Set tSC = ..Adapter.InvokeMethod("GetAllergyByMRN",.GetAllergyByMRNResult,pRequest.MRN)  Quit:$$$ISERR(tSC) tSC
 Set tSC = pRequest.NewResponse(.pResponse)  Quit:$$$ISERR(tSC) tSC
 Set pResponse.GetAllergyByMRNResult=$get(GetAllergyByMRNResult)
 Quit $$$OK
}

Parameter ADAPTER = "EnsLib.SOAP.OutboundAdapter";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Demo.WebService.SOAP.Request.GetAllergyByMRNRequest">
		<Method>GetAllergyByMRN</Method>
	</MapItem>
</MapItems>
}

}
