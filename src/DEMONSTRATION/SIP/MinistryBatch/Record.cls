/// RECORDMAP: Generated from RecordMap 'SIP.MinistryBatch'
/// on 2016-09-15 at 07:55:16.986 [2016-09-15 12:55:16.986 UTC]
/// by user randy
Class SIP.MinistryBatch.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Ministry As %String [ Required ];

Property MRN As %Integer [ Required ];

Property Name As %String [ Required ];

Property Address1 As %String;

Property Address2 As %String;

Property City As %String;

Property State As %String;

Property Zip As %String;

Relationship %ParentBatch As User.MinistryBatchHolder [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Ministry</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>Address1</Value>
</Value>
<Value name="6">
<Value>Address2</Value>
</Value>
<Value name="7">
<Value>City</Value>
</Value>
<Value name="8">
<Value>State</Value>
</Value>
<Value name="9">
<Value>Zip</Value>
</Value>
<Value name="10">
<Value>MRN</Value>
</Value>
<Value name="11">
<Value>%ParentBatch</Value>
</Value>
</Data>
<DataLocation>^SIP.MinistryBatch.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^SIP.MinistryBatch.RecordD</IdLocation>
<IndexLocation>^SIP.MinistryBatch.RecordI</IndexLocation>
<StreamLocation>^SIP.MinistryBatch.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
