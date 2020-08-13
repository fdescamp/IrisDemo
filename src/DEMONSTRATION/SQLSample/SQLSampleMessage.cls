Class SQLSample.SQLSampleMessage Extends Ens.Request
{

Property Name As %String;

Property Address As %String;

Property Address2 As %String;

Property City As %String;

Property State As %String;

Property Zip As %String;

Storage Default
{
<Data name="SQLSampleMessageDefaultData">
<Subscript>"SQLSampleMessage"</Subscript>
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Address1</Value>
</Value>
<Value name="3">
<Value>Address2</Value>
</Value>
<Value name="4">
<Value>City</Value>
</Value>
<Value name="5">
<Value>State</Value>
</Value>
<Value name="6">
<Value>Zip</Value>
</Value>
<Value name="7">
<Value>Address</Value>
</Value>
</Data>
<DefaultData>SQLSampleMessageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
