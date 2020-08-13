Class Demo.WebService.PatientResponse Extends Ens.Response
{

/// Person's name.
Property Name As %String;

/// Person's Social Security number. This is validated using pattern match.
Property SSN As %String;

/// Person's Date of Birth.
Property DOB As %String;

/// Person's home address. This uses an embedded object.
Property Home As Demo.WebService.Address;

/// Person's MRN
Property MRN As %String;

/// Person's age.<br>
/// This is a calculated field whose value is derived from <property>DOB</property>.
Property Age As %Integer;

Property Allergy As %String;

Storage Default
{
<Data name="PatientResponseDefaultData">
<Subscript>"PatientResponse"</Subscript>
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>SSN</Value>
</Value>
<Value name="3">
<Value>DOB</Value>
</Value>
<Value name="4">
<Value>Home</Value>
</Value>
<Value name="5">
<Value>MRN</Value>
</Value>
<Value name="6">
<Value>Age</Value>
</Value>
<Value name="7">
<Value>Allergy</Value>
</Value>
</Data>
<DefaultData>PatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
