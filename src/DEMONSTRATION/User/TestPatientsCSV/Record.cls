/// RECORDMAP: Generated from RecordMap 'User.TestPatientsCSV'
/// on 2019-05-07 at 10:01:25.020 [2019-05-07 09:01:25.020 UTC]
/// by user _SYSTEM
Class User.TestPatientsCSV.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Prénom As %String;

Property Nom As %String;

Property DateDeNaissance As %String;

Property Sexe As %String;

Property Rue As %String;

Property Ville As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Prénom</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>DateDeNaissance</Value>
</Value>
<Value name="5">
<Value>Sexe</Value>
</Value>
<Value name="6">
<Value>Rue</Value>
</Value>
<Value name="7">
<Value>Ville</Value>
</Value>
<Value name="8">
<Value>Nom</Value>
</Value>
</Data>
<DataLocation>^User.TestPatientsCSV.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^User.TestPatientsCSV.RecordD</IdLocation>
<IndexLocation>^User.TestPatientsCSV.RecordI</IndexLocation>
<StreamLocation>^User.TestPatientsCSV.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
