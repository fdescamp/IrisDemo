/// RECORDMAP: Generated from RecordMap 'SIP.NashvilleBatch'
/// on 2016-09-15 at 09:17:31.445 [2016-09-15 14:17:31.445 UTC]
/// by user randy
Class SIP.NashvilleBatch.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property Address1 As %String;

Property Address2 As %String;

Property State As %String;

Property Name As %String;

Property Ministry As %String;

Relationship %ParentBatch As SIP.NashvilleBatchHeaderTrailer [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Address1</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>Ministry</Value>
</Value>
<Value name="6">
<Value>%ParentBatch</Value>
</Value>
<Value name="7">
<Value>Address2</Value>
</Value>
<Value name="8">
<Value>State</Value>
</Value>
</Data>
<DataLocation>^SIP.NashvilleBatch.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^SIP.NashvilleBatch.RecordD</IdLocation>
<IndexLocation>^SIP.NashvilleBatch.RecordI</IndexLocation>
<StreamLocation>^SIP.NashvilleBatch.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
