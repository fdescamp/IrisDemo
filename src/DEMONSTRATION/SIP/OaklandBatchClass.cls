/// RECORDMAP: Modified during compilation of RecordMap 'SIP.OaklandBatch'
/// on 2017-04-05 at 05:38:19.203 [2017-04-05 13:38:19.203 UTC]
/// by user SFarrell
Class SIP.OaklandBatchClass Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "OaklandBatchClass";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm = "\x0d\x0a";

Parameter BatchTrailer;

Parameter TrailerTerm = "\x0d\x0a";

Parameter IgnoreLeadingData = 0;

Relationship Records As SIP.OaklandBatch.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

Parameter XMLTYPE = "SIP_OaklandBatchClass";

Storage Default
{
<Data name="OaklandBatchClassDefaultData">
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
<DataLocation>^SIP.OaklandBatchClassD</DataLocation>
<DefaultData>OaklandBatchClassDefaultData</DefaultData>
<IdLocation>^SIP.OaklandBatchClassD</IdLocation>
<IndexLocation>^SIP.OaklandBatchClassI</IndexLocation>
<StreamLocation>^SIP.OaklandBatchClassS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
