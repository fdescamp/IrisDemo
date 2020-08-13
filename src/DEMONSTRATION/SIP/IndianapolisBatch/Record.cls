/// RECORDMAP: Generated from RecordMap 'SIP.IndianapolisBatch'
/// on 2016-09-15 at 11:34:00.364 [2016-09-15 16:34:00.364 UTC]
/// by user randy
Class SIP.IndianapolisBatch.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property MRN As %String(MAXLEN = 10);

Property NAME As %String(MAXLEN = 50);

Property Address1 As %String(MAXLEN = 40);

Property Address2 As %String(MAXLEN = 40);

Property City As %String(MAXLEN = 20);

Relationship %ParentBatch As SIP.IndianapolisBatchHolder [ Cardinality = one, Inverse = Records ];

Index %ParentBatchIdx On %ParentBatch;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>MRN</Value>
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
<Value>%ParentBatch</Value>
</Value>
<Value name="8">
<Value>NAME</Value>
</Value>
</Data>
<DataLocation>^SIP.IndianapolisBatch.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^SIP.IndianapolisBatch.RecordD</IdLocation>
<IndexLocation>^SIP.IndianapolisBatch.RecordI</IndexLocation>
<StreamLocation>^SIP.IndianapolisBatch.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
