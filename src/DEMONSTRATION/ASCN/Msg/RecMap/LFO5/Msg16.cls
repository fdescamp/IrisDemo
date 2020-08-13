/// RECORDMAP: Modified during compilation of RecordMap 'ASCN.Msg.RecMap.LFO5.Msg16'
/// on 2016-11-03 at 12:53:11.098 [2016-11-03 18:53:11.098 UTC]
/// by user _SYSTEM
Class ASCN.Msg.RecMap.LFO5.Msg16 Extends EnsLib.RecordMap.RecordMap
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

Parameter OBJECTNAME = "ASCN.Msg.RecMap.LFO5.Msg16.Record";

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, "")
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tSeps = $listbuild($char(124))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.LeadingField = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.MsgID = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field3 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field4 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Ministry = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.FirstName = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.MiddleInitial = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.LastName = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field9 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field10 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.StreetAddress1 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.StreetAddress2 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field13 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field14 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.City = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.State = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Zipcode = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field18 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field19 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field20 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field21 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field22 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field23 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field24 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field25 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field26 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field27 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field28 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field29 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field30 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field31 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field33 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field32 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field34 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field35 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field36 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field37 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field38 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field39 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field40 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field41 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field42 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field43 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field44 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field45 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field46 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field47 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field48 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field49 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field50 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field51 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field52 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field53 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field54 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field55 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field56 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field57 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field58 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field59 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field60 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field61 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field62 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field63 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field64 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field65 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field66 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field67 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field68 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field69 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field70 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field71 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field72 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field73 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field74 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field75 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field76 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field77 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field78 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field79 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field80 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field81 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field82 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field83 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field84 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field85 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field86 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field87 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field88 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field89 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field90 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field91 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field92 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field93 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field94 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field95 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field96 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field97 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field98 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field99 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field100 = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(124), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(124), .tTopPiece)
	If pGetTopFields {
		Set pObject.Field101 = tCurrString
	}
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Do pStream.Write($select(pHasTopFields: pObject.LeadingField,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.MsgID,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field2,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field3,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field4,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Ministry,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.FirstName,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.MiddleInitial,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.LastName,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field9,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field10,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.StreetAddress1,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.StreetAddress2,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field13,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field14,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.City,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.State,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Zipcode,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field18,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field19,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field20,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field21,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field22,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field23,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field24,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field25,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field26,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field27,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field28,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field29,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field30,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field31,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field33,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field32,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field34,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field35,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field36,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field37,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field38,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field39,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field40,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field41,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field42,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field43,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field44,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field45,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field46,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field47,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field48,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field49,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field50,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field51,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field52,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field53,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field54,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field55,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field56,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field57,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field58,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field59,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field60,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field61,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field62,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field63,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field64,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field65,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field66,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field67,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field68,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field69,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field70,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field71,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field72,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field73,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field74,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field75,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field76,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field77,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field78,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field79,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field80,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field81,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field82,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field83,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field84,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field85,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field86,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field87,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field88,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field89,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field90,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field91,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field92,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field93,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field94,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field95,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field96,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field97,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field98,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field99,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field100,1: ""),0)
	Do pStream.Write($char(124) _ $select(pHasTopFields: pObject.Field101,1: ""),0)
	Do pStream.Write($char(13,10), 0, .tStatus)
	If $$$ISERR(tStatus) Quit tStatus
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("ASCN.Msg.RecMap.LFO5.Batch.Msg16")=""
	Set pClasses("ASCN.Msg.RecMap.LFO5.Msg16.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
""
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="ASCN.Msg.RecMap.LFO5.Msg16" type="delimited" char_encoding="UTF-8" targetClassname="ASCN.Msg.RecMap.LFO5.Msg16.Record" batchClass="ASCN.Msg.RecMap.LFO5.Batch.Msg16" complexBatchManaged="0" padFromLeft="0" recordTerminator="\x0d\x0a" allowEarlyTerminator="0">
  <Separators>
    <Separator>|</Separator>
  </Separators>
  <Field name="LeadingField" required="0" datatype="%String" repeating="0">
  </Field>
  <Field name="MsgID" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Field2" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Field3" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Field4" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Ministry" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="FirstName" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="MiddleInitial" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="LastName" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Field9" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field10" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="StreetAddress1" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="StreetAddress2" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Field13" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field14" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="City" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="State" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Zipcode" required="0" datatype="%String" params="MAXLEN=1024" repeating="0">
  </Field>
  <Field name="Field18" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field19" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field20" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field21" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field22" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field23" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field24" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field25" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field26" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field27" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field28" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field29" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field30" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field31" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field33" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field32" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field34" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field35" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field36" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field37" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field38" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field39" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field40" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field41" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field42" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field43" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field44" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field45" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field46" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field47" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field48" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field49" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field50" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field51" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field52" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field53" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field54" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field55" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field56" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field57" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field58" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field59" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field60" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field61" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field62" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field63" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field64" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field65" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field66" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field67" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field68" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field69" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field70" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field71" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field72" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field73" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field74" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field75" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field76" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field77" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field78" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field79" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field80" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field81" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field82" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field83" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field84" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field85" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field86" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field87" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field88" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field89" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field90" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field91" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field92" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field93" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field94" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field95" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field96" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field97" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field98" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field99" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field100" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
  <Field name="Field101" required="0" datatype="%String" params="MAXLEN=1024">
  </Field>
</Record>
}

}
