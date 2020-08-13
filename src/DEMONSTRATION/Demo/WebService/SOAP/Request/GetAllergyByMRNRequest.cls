Class Demo.WebService.SOAP.Request.GetAllergyByMRNRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "Demo.WebService.SOAP.Response.GetAllergyByMRNResponse";

Property MRN As %String;

Storage Default
{
<Data name="GetAllergyByMRNRequestDefaultData">
<Subscript>"GetAllergyByMRNRequest"</Subscript>
<Value name="1">
<Value>MRN</Value>
</Value>
</Data>
<DefaultData>GetAllergyByMRNRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
