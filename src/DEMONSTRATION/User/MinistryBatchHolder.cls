/// RECORDMAP: Modified during compilation of RecordMap 'SIP.MinistryBatch'
/// on 2016-09-15 at 07:55:16.994 [2016-09-15 12:55:16.994 UTC]
/// by user randy
Class User.MinistryBatchHolder Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "MinistryBatchHolder";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm;

Parameter BatchTrailer;

Parameter TrailerTerm;

Parameter IgnoreLeadingData = 0;

Relationship Records As SIP.MinistryBatch.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "User_MinistryBatchHolder";

Storage Default
{
<Data name="MinistryBatchHolderDefaultData">
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
<DataLocation>^User.MinistryBatchHolderD</DataLocation>
<DefaultData>MinistryBatchHolderDefaultData</DefaultData>
<IdLocation>^User.MinistryBatchHolderD</IdLocation>
<IndexLocation>^User.MinistryBatchHolderI</IndexLocation>
<StreamLocation>^User.MinistryBatchHolderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
