/// RECORDMAP: Generated from RecordMap 'Demo.AlertRecordMap'
/// on 2012-11-04 at 13:03:18.098 [2012-11-04 18:03:18.098 UTC]
/// by user UnknownUser
Class Demo.AlertRecordMap.Record Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter RECORDMAPGENERATED = 1;

Parameter INCLUDETOPFIELDS = 1;

Property SourceConfigName As %String;

Property AlertText As %String(MAXLEN = 200);

Property AlertDestination As %String;

Storage Default
{
<Data name="RecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>%Source</Value>
</Value>
<Value name="3">
<Value>AlertText</Value>
</Value>
<Value name="4">
<Value>AlertDestination</Value>
</Value>
<Value name="5">
<Value>SourceConfigName</Value>
</Value>
</Data>
<DataLocation>^Demo.AlertRecordMap.RecordD</DataLocation>
<DefaultData>RecordDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Demo.AlertRecordMap.RecordD</IdLocation>
<IndexLocation>^Demo.AlertRecordMap.RecordI</IndexLocation>
<StreamLocation>^Demo.AlertRecordMap.RecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
