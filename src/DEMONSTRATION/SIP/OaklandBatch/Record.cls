/// RECORDMAP: Generated from RecordMap 'SIP.OaklandBatch'
/// on 2017-04-05 at 05:38:19.186 [2017-04-05 13:38:19.186 UTC]
/// by user SFarrell
Class SIP.OaklandBatch.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Name As %String;

Property MRN As %String;

Property Address1 As %String;

Property Address2 As %String;

Property City As %String;

Property State As %String;

Property Zip As %String;

Property EncounterNumber As %String;

Property AttendingPhysicianID As %String;

Property AttendingPhysicianName As %String;

Relationship %ParentBatch As SIP.OaklandBatchClass [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Address1</Value>
</Value>
<Value name="5">
<Value>Address2</Value>
</Value>
<Value name="6">
<Value>City</Value>
</Value>
<Value name="7">
<Value>State</Value>
</Value>
<Value name="8">
<Value>Zip</Value>
</Value>
<Value name="9">
<Value>EncounterNumber</Value>
</Value>
<Value name="10">
<Value>AttendingPhysicianID</Value>
</Value>
<Value name="11">
<Value>AttendingPhysicianName</Value>
</Value>
<Value name="12">
<Value>%ParentBatch</Value>
</Value>
<Value name="13">
<Value>MRN</Value>
</Value>
</Data>
<DataLocation>^SIP.OaklandBatch.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^SIP.OaklandBatch.RecordD</IdLocation>
<IndexLocation>^SIP.OaklandBatch.RecordI</IndexLocation>
<StreamLocation>^SIP.OaklandBatch.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
