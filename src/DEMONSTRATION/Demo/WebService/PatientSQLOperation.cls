Class Demo.WebService.PatientSQLOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

// Query Person table in USER namespace

Method GetPatientDemographics(pRequest As Demo.WebService.PatientRequest, Output pResponse As Demo.WebService.PatientResponse) As %Status
{
	
		set tSC=$$$OK
		
		set sql = "Select Age, DOB, MRN, Name, SSN, Home_City, Home_State, Home_Street, Home_Zip FROM Demo_WebService.Person where MRN=?"
		set pResponse = ##CLASS(Demo.WebService.PatientResponse).%New()
		
		 set tResult = ##CLASS(EnsLib.SQL.GatewayResultSet).%New()
		 set tSC = ..Adapter.ExecuteQuery(.tResult,sql,pRequest.MRN)
		set ^zfde(1)=tResult
		set ^zfde(1)=tResult.Next()
		 if tResult.Next(){
		 	set pResponse.Age=tResult.Get("Age")
		 	set pResponse.DOB=tResult.Get("DOB")
		 	set pResponse.Name=tResult.Get("Name")
		 	set pResponse.SSN=tResult.Get("SSN")
		 	set pResponse.Home.City=tResult.Get("Home_City")
		 	set pResponse.Home.State=tResult.Get("Home_State")
		 	set pResponse.Home.Street=tResult.Get("Home_Street")
		 	set pResponse.Home.Zip=tResult.Get("Home_Zip")
		 	set pResponse.MRN=tResult.Get("MRN")
		 }
	
		Quit tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Demo.WebService.PatientRequest">
	<Method>GetPatientDemographics</Method>
	</MapItem>
	</MapItems>
}

}
