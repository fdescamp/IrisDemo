/// RECORDMAP: Modified during compilation of RecordMap 'SIP.AustinX12Batch'
/// on 2016-09-15 at 09:27:48.680 [2016-09-15 14:27:48.680 UTC]
/// by user randy
Class User.AustinX12BatchHolder Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "AustinX12BatchHolder";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm;

Parameter BatchTrailer;

Parameter TrailerTerm;

Parameter IgnoreLeadingData = 0;

Relationship Records As SIP.AustinX12Batch.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "User_AustinX12BatchHolder";

Storage Default
{
<Data name="AustinX12BatchHolderDefaultData">
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
<DataLocation>^User.AustinX12BatchHolderD</DataLocation>
<DefaultData>AustinX12BatchHolderDefaultData</DefaultData>
<IdLocation>^User.AustinX12BatchHolderD</IdLocation>
<IndexLocation>^User.AustinX12BatchHolderI</IndexLocation>
<StreamLocation>^User.AustinX12BatchHolderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
