/// RECORDMAP: Modified during compilation of RecordMap 'SIP.IndianapolisBatch'
/// on 2016-09-15 at 11:34:00.381 [2016-09-15 16:34:00.381 UTC]
/// by user randy
Class SIP.IndianapolisBatch Extends EnsLib.RecordMap.RecordMap
{

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

Parameter OBJECTNAME = "SIP.IndianapolisBatch.Record";

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "" } 
	Set tMaxLen = 160 + $length(tRecLabel)
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, tMaxLen, pTimeout, $char(13,10), tRecLabel, .pLookAhead, .tExtra)
	If $$$ISERR(tStatus) Quit tStatus
	Set pLookAhead = $get(tExtra)
	Set tIgnoreEarlyTerminator = 0
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tCurrPos = 1
	Set tNewChunk = 1
	Set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,10,"","","MRN",tIgnoreEarlyTerminator)
	If $$$ISERR(tStatus) Quit tStatus
	If pGetTopFields Set pObject.MRN = pObject.MRNDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	Set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,50,"","","NAME",tIgnoreEarlyTerminator)
	If $$$ISERR(tStatus) Quit tStatus
	If pGetTopFields Set pObject.NAME = pObject.NAMEDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	Set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,40,"","","Address1",tIgnoreEarlyTerminator)
	If $$$ISERR(tStatus) Quit tStatus
	If pGetTopFields Set pObject.Address1 = pObject.Address1DisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	Set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,40,"","","Address2",tIgnoreEarlyTerminator)
	If $$$ISERR(tStatus) Quit tStatus
	If pGetTopFields Set pObject.Address2 = pObject.Address2DisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	Set tCurrVal = ..checkFixedWidthChunk(.tStatus,.tNewChunk,.tCurrChunk,.tRecordData,.tCurrString,.tCurrLen,.tCurrPos,20,"","","City",tIgnoreEarlyTerminator)
	If $$$ISERR(tStatus) Quit tStatus
	If pGetTopFields Set pObject.City = pObject.CityDisplayToLogical($ZStrip(tCurrVal, ">", $char(32)))
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pHasTopFields { Set tValue = ##class(SIP.IndianapolisBatch.Record).MRNLogicalToDisplay(pObject.MRN), tLen = $length(tValue) }
	Else { Set tValue = "", tLen = 0}
	If 10 > tLen {
		Set tPadding = $get(pPadArray(10 - tLen))
		If tPadding = "" {
			Set $piece(tPadding, $char(32), (10 - tLen + 1)) = ""
			Set pPadArray(10-tLen) = tPadding
		}
		Set tValue = tValue_tPadding
	}
	Do pStream.Write(tValue, 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	If pHasTopFields { Set tValue = ##class(SIP.IndianapolisBatch.Record).NAMELogicalToDisplay(pObject.NAME), tLen = $length(tValue) }
	Else { Set tValue = "", tLen = 0}
	If 50 > tLen {
		Set tPadding = $get(pPadArray(50 - tLen))
		If tPadding = "" {
			Set $piece(tPadding, $char(32), (50 - tLen + 1)) = ""
			Set pPadArray(50-tLen) = tPadding
		}
		Set tValue = tValue_tPadding
	}
	Do pStream.Write(tValue, 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	If pHasTopFields { Set tValue = ##class(SIP.IndianapolisBatch.Record).Address1LogicalToDisplay(pObject.Address1), tLen = $length(tValue) }
	Else { Set tValue = "", tLen = 0}
	If 40 > tLen {
		Set tPadding = $get(pPadArray(40 - tLen))
		If tPadding = "" {
			Set $piece(tPadding, $char(32), (40 - tLen + 1)) = ""
			Set pPadArray(40-tLen) = tPadding
		}
		Set tValue = tValue_tPadding
	}
	Do pStream.Write(tValue, 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	If pHasTopFields { Set tValue = ##class(SIP.IndianapolisBatch.Record).Address2LogicalToDisplay(pObject.Address2), tLen = $length(tValue) }
	Else { Set tValue = "", tLen = 0}
	If 40 > tLen {
		Set tPadding = $get(pPadArray(40 - tLen))
		If tPadding = "" {
			Set $piece(tPadding, $char(32), (40 - tLen + 1)) = ""
			Set pPadArray(40-tLen) = tPadding
		}
		Set tValue = tValue_tPadding
	}
	Do pStream.Write(tValue, 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	If pHasTopFields { Set tValue = ##class(SIP.IndianapolisBatch.Record).CityLogicalToDisplay(pObject.City), tLen = $length(tValue) }
	Else { Set tValue = "", tLen = 0}
	If 20 > tLen {
		Set tPadding = $get(pPadArray(20 - tLen))
		If tPadding = "" {
			Set $piece(tPadding, $char(32), (20 - tLen + 1)) = ""
			Set pPadArray(20-tLen) = tPadding
		}
		Set tValue = tValue_tPadding
	}
	Do pStream.Write(tValue, 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Do pStream.Write($char(13,10), 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("SIP.IndianapolisBatch.Record")=""
	Set pClasses("SIP.IndianapolisBatchHolder")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"fixedwidth"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="SIP.IndianapolisBatch" type="fixedwidth" char_encoding="UTF-8" targetClassname="SIP.IndianapolisBatch.Record" batchClass="SIP.IndianapolisBatchHolder" complexBatchManaged="0" paddingChars="\x20" padFromLeft="0" recordTerminator="\x0d\x0a" allowEarlyTerminator="0">
  <Field name="MRN" required="0" datatype="%String" width="10" repeating="0">
  </Field>
  <Field name="NAME" required="0" datatype="%String" width="50" repeating="0">
  </Field>
  <Field name="Address1" required="0" datatype="%String" width="40" repeating="0">
  </Field>
  <Field name="Address2" required="0" datatype="%String" width="40" repeating="0">
  </Field>
  <Field name="City" required="0" datatype="%String" width="20" repeating="0">
  </Field>
</Record>
}

}
