Include Ensemble

Class Demo.WebService.REST.PatientRequest Extends (%Persistent, %XML.Adaptor)
{

Parameter RESPONSECLASSNAME = "Demo.WebService.REST.PatientResponse";

Property Command As %String [ InitialExpression = "GET" ];

Property MRN As %String;

/// For JSON content submission
Property Body As %GlobalCharacterStream;

ClassMethod NewResponse(Output pResponse As Ens.Response) As %Status
{
	try {
		Set pResponse = $classmethod(..#RESPONSECLASSNAME,"%New")  Set tSC=$S($IsObject(pResponse):$$$OK, 1:%objlasterror)
	} catch {
		Set tSC=$$$SystemError
	}
	Quit tSC
}

Storage Default
{
<Data name="PatientRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Command</Value>
</Value>
<Value name="3">
<Value>MRN</Value>
</Value>
<Value name="4">
<Value>Body</Value>
</Value>
</Data>
<DataLocation>^Demo.WebSerDA40.PatientRequestD</DataLocation>
<DefaultData>PatientRequestDefaultData</DefaultData>
<IdLocation>^Demo.WebSerDA40.PatientRequestD</IdLocation>
<IndexLocation>^Demo.WebSerDA40.PatientRequestI</IndexLocation>
<StreamLocation>^Demo.WebSerDA40.PatientRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
