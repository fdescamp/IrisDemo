/// This is a sample REST service implementing a directory of Person records.
/// Example REST URLs:
/// GET /patient/MRN/2007504
/// http://localhost:9980/patient/MRN/2007504
/// http://localhost:9980/patient/MRN/2007504
/// Start Production
/// http://localhost:57778/DemoRest/Demo.WebService.REST.PatientService/Patient/MRN/2007504
Class Demo.WebService.REST.PatientService Extends (EnsLib.REST.Service, Ens.BusinessService)
{

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Property Target [ InitialExpression = "MRNProcess" ];

Parameter SETTINGS = "Target:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/MRN/:mrn" Method="GET" Call="retrievePerson"/>
</Routes>
}

Parameter EnsServicePrefix = "|patient";

/// Retrieve
Method retrievePerson(pInput As %Library.AbstractStream, Output pOutput As %Stream.Object, pMRN As %String) As %Status
{
	try {
		
		//Send Request to BPL
		set tRequest=##class(Demo.WebService.PatientRequest).%New()
		set tRequest.MRN=pMRN
		set tSC=..SendRequestSync(..Target,tRequest,.tResponse)
		
		//Build JSON Stream
		Set tProxyObj=..buildProxyObj(tResponse)
		Set tSC=..ObjectToJSONStream(tProxyObj,.tOut)

		Do tOut.Rewind()  Set tSC1=pOutput.Write(tOut.Read())  Do tOut.Clear()  Set:$$$ISOK(tSC) tSC=tSC1  Quit:$$$ISERR(tSC)
		 		
		
	} catch {
		Set tSC=$$$SystemError
	}
	Do:$$$ISOK(tSC) pOutput.SetAttribute("Content-Type","application/json")
	Quit tSC
}

/// Normalize the Person info by copying its properties to a proxy object in a selective way
ClassMethod buildProxyObj(pObj As %Persistent) [ Internal ]
{
	Set tProxy = ##class(%ZEN.proxyObject).%New()
	Set tProxy.Name=pObj.Name
	Set tProxy.Age=pObj.Age
	Set tProxy.DOB=$ZDateTime(pObj.DOB,3)
	Set tProxy.SSN=pObj.SSN
	Set tProxy.Home=..buildProxyAddr(pObj.Home)
	Set tProxy.MRN=pObj.MRN
	Set tProxy.Allergies=pObj.Allergy
	Quit tProxy
}

/// Normalize the Address info by copying its properties to a proxy object in a selective way
ClassMethod buildProxyAddr(pObj As %SerialObject) [ Internal ]
{
	Set tProxy = ##class(%ZEN.proxyObject).%New()
	Set tProxy.Street=pObj.Street
	Set tProxy.City=pObj.City
	Set tProxy.State=pObj.State
	Set tProxy.Zip=pObj.Zip
	Quit tProxy
}

/// Control the type and content of error returned to the REST caller
ClassMethod OnErrorStream(pStatus As %Status)
{
 	Set tStream = ##class(%GlobalBinaryStream).%New()  $$$ASSERT($IsObject(tStream))
	Do tStream.Write($ZConvert($$$StatusDisplayString(pStatus)_$C(13,10),"O","UTF8"))
	Set tStream.Attributes("Content-Type")=" text/plain; charset=""UTF-8"""
	Set tStream.Attributes("ResponseCode")="500 Internal Server Error"
 	Quit tStream
}

}
