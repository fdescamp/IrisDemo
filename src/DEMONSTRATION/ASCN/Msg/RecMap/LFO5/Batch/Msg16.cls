/// RECORDMAP: Modified during compilation of RecordMap 'ASCN.Msg.RecMap.LFO5.Msg16'
/// on 2016-11-03 at 12:53:11.080 [2016-11-03 18:53:11.080 UTC]
/// by user _SYSTEM
Class ASCN.Msg.RecMap.LFO5.Batch.Msg16 Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "Msg16";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader;

Parameter HeaderTerm;

Parameter BatchTrailer;

Parameter TrailerTerm;

Parameter IgnoreLeadingData = 0;

Relationship Records As ASCN.Msg.RecMap.LFO5.Msg16.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

/// Write out the Batch Header for the current Batch object
Method PutBatchHeader(pIOStream As %IO.DeviceStream) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set BatchHeader="01|HealthShare|Health Connect|"_$TR($ZD(+$h,1),"/","-")_"|013536|HR-I038"_$C(13,10)
		Do pIOStream.Write(BatchHeader,0, .tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = $$$EnsSystemError
	}
	Quit tStatus
}

/// Write out the Batch Trailer for the current Batch object
Method PutBatchTrailer(pIOStream As %IO.DeviceStream) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set BatchTrailer="99|24096|0|"_..Records.Count()_$C(13,10)
		Do pIOStream.Write(BatchTrailer,, .tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = $$$EnsSystemError
	}
	Quit tStatus
}

Parameter XMLTYPE = "ASCN_Msg_RecMap_LFO5_Batch_Msg16";

Storage Default
{
<Data name="Msg16DefaultData">
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
<DataLocation>^ASCN.Msg.RecMap.LFO5BD58.Msg16D</DataLocation>
<DefaultData>Msg16DefaultData</DefaultData>
<IdLocation>^ASCN.Msg.RecMap.LFO5BD58.Msg16D</IdLocation>
<IndexLocation>^ASCN.Msg.RecMap.LFO5BD58.Msg16I</IndexLocation>
<StreamLocation>^ASCN.Msg.RecMap.LFO5BD58.Msg16S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
