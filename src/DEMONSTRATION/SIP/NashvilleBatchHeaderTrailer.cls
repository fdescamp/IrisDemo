/// RECORDMAP: Modified during compilation of RecordMap 'SIP.NashvilleBatch'
/// on 2016-09-15 at 09:17:31.451 [2016-09-15 14:17:31.451 UTC]
/// by user randy
Class SIP.NashvilleBatchHeaderTrailer Extends (%Library.Persistent, EnsLib.RecordMap.SimpleBatch)
{

Parameter XMLNAME = "NashvilleBatchHeaderTrailer";

Parameter RECORDMAPGENERATED = 1;

Parameter BatchHeader = "This is the header";

Parameter HeaderTerm = "\x0d\x0a";

Parameter BatchTrailer = "this is the trailer";

Parameter TrailerTerm = "\x0d\x0a";

Parameter IgnoreLeadingData = 0;

Relationship Records As SIP.NashvilleBatch.Record [ Cardinality = many, Inverse = %ParentBatch ];

Trigger OnDelete [ Event = DELETE ]
{
	Set %ok = ..deleteRecords({ID})
}

/// Write out the Batch Header for the current Batch object
Method PutBatchHeader(pIOStream As %IO.DeviceStream) As %Status
{
	Try {
		Set tStatus = $$$OK
		If ..BatchHeader '= "" {
		
		
			set BatchHeaderString = $ZSTRIP(..BatchHeader,"*C")_" Number of Records: "_..Records.Count()_$C(13,10)
			//Do pIOStream.Write(..BatchHeader,0, .tStatus)
			Do pIOStream.Write(BatchHeaderString,0, .tStatus)
			If $$$ISERR(tStatus) Quit
		}
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
		If ..BatchTrailer '= "" {
		
		
			set BatchTrailerString = $ZSTRIP(..BatchTrailer,"*C")_" Number of Records: "_..Records.Count()_$C(13,10)
			
			Do pIOStream.Write(BatchTrailerString,0, .tStatus)
			If $$$ISERR(tStatus) Quit
		}
	}
	Catch ex {
		Set tStatus = $$$EnsSystemError
	}
	Quit tStatus
}

Parameter XMLTYPE = "SIP_NashvilleBatchHeaderTrailer";

Storage Default
{
<Data name="NashvilleBatchHeaderTrailerDefaultData">
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
<DataLocation>^SIP.NashvilleBa9EB5D</DataLocation>
<DefaultData>NashvilleBatchHeaderTrailerDefaultData</DefaultData>
<IdLocation>^SIP.NashvilleBa9EB5D</IdLocation>
<IndexLocation>^SIP.NashvilleBa9EB5I</IndexLocation>
<StreamLocation>^SIP.NashvilleBa9EB5S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
