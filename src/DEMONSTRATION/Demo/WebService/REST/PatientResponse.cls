Include Ensemble

Class Demo.WebService.REST.PatientResponse Extends (%Persistent, %XML.Adaptor)
{

/// Single result value
Property Value As %String(MAXLEN = "");

/// Single record properties or list of records' single values
Property Properties As array Of %String(MAXLEN = "", XMLITEMNAME = "Value", XMLKEYNAME = "Key", XMLPROJECTION = "ELEMENT");

/// Array of records' properties
Property Records As array Of %ArrayOfDataTypes(XMLITEMNAME = "Record", XMLKEYNAME = "num", XMLPROJECTION = "NONE");

/// For the record: submitted Request URL
Property RequestURL As %String(MAXLEN = "") [ Internal ];

/// For the record: raw HTTP response body resulting from request URL
Property RawResponse As %Stream.GlobalCharacter [ Internal ];

/// For the record: ID of the session used to retrieve this response
Property SessionId As %String;

Storage Default
{
<Data name="PatientResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Value</Value>
</Value>
<Value name="3">
<Value>RequestURL</Value>
</Value>
<Value name="4">
<Value>RawResponse</Value>
</Value>
<Value name="5">
<Value>SessionId</Value>
</Value>
</Data>
<Data name="Properties">
<Attribute>Properties</Attribute>
<Structure>subnode</Structure>
<Subscript>"Properties"</Subscript>
</Data>
<Data name="Records">
<Attribute>Records</Attribute>
<Structure>subnode</Structure>
<Subscript>"Records"</Subscript>
</Data>
<DataLocation>^Demo.WebSeDA40.PatientRespC8A5D</DataLocation>
<DefaultData>PatientResponseDefaultData</DefaultData>
<IdLocation>^Demo.WebSeDA40.PatientRespC8A5D</IdLocation>
<IndexLocation>^Demo.WebSeDA40.PatientRespC8A5I</IndexLocation>
<StreamLocation>^Demo.WebSeDA40.PatientRespC8A5S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
