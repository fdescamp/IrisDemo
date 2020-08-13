Class Demo.WS.Test.Request.GetAllergyByMRNRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "Demo.WS.Test.Response.GetAllergyByMRNResponse";

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
