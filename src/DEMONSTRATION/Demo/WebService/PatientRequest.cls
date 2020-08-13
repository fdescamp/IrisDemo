Class Demo.WebService.PatientRequest Extends Ens.Request
{

Property MRN As %String;

Parameter RESPONSECLASSNAME = "Demo.WebService.PatientResponse";

Storage Default
{
<Data name="PatientRequestDefaultData">
<Subscript>"PatientRequest"</Subscript>
<Value name="1">
<Value>MRN</Value>
</Value>
</Data>
<DefaultData>PatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
