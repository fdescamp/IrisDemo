/// RECORDMAP: Modified during compilation of RecordMap 'SIP.IndianapolisBatch'
/// on 2016-09-15 at 11:34:00.371 [2016-09-15 16:34:00.371 UTC]
/// by user randy
Class SIP.IndianapolisBatchHolder Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "IndianapolisBatchHolder";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm;

Parameter BatchTrailer;

Parameter TrailerTerm;

Parameter IgnoreLeadingData = 0;

Relationship Records As SIP.IndianapolisBatch.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "SIP_IndianapolisBatchHolder";

Storage Default
{
<Data name="IndianapolisBatchHolderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%Source</Value>
</Value>
<Value name="3">
<Value>BatchHeader</Value>
</Value>
<Value name="4">
<Value>BatchTrailer</Value>
</Value>
</Data>
<DataLocation>^SIP.IndianapolisBatchHolderD</DataLocation>
<DefaultData>IndianapolisBatchHolderDefaultData</DefaultData>
<IdLocation>^SIP.IndianapolisBatchHolderD</IdLocation>
<IndexLocation>^SIP.IndianapolisBatchHolderI</IndexLocation>
<StreamLocation>^SIP.IndianapolisBatchHolderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
