Include %DeepSee

/// Fact table for cube 'Ens.MessageBody'.<br/>
/// THIS IS A GENERATED CLASS, DO NOT EDIT.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.
Class User.Ens.MessageBody.Fact Extends (%DeepSee.FactTable, %DeepSee.CubeFunctionSet) [ Final, GeneratedBy = User.Ens.MessageBody.CLS, Inheritance = right, Owner = {}, ProcedureBlock ]
{

/// Index for fact 2.
Index DxID On DxID [ Type = bitmap ];

/// Index for fact 3.
Index DxDocType On DxDocType [ Type = bitmap ];

/// Index for fact 4.
Index MessageBodyId On MessageBodyId [ Type = bitmap ];

/// Inverse index for relationship MessageBodyId.
Index %InverseMessageBodyId On (%%ID, MessageBodyId);

/// Reference to original data in source table.
Property %sourceId As EnsLib.HL7.Message;

/// This indicates which partition (set of 1M) this fact is in.
Property %dspartition As %Integer [ Calculated, SqlComputeCode = {Set {%dspartition}=({ID}\1024000)+1}, SqlComputed ];

/// Dimension: DxID<br/>
/// Source: %ID
Property DxID As User.Ens.MessageBody.StarID;

/// Dimension: DxDocType<br/>
/// Source: DocType
Property DxDocType As User.Ens.MessageBody.StarDocType;

/// Relationship: MessageBodyId<br/>
/// Source: %ID
Property MessageBodyId As User.MessageVolume.Fact;

/// Return the total number of items within the Fact table.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.
ClassMethod %Count() As %Integer
{
 Set tCount = 0
 &sql(SELECT COUNT(*) INTO :tCount FROM User_Ens_MessageBody.Fact)
 Quit tCount
}

/// Update a range of Facts with data from the source table row with ids from <var>pStartId</var> to <var>pEndId</var>.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %UpdateFacts(pStartId As %String, pEndId As %String, pBatchMode As %Boolean = 0, ByRef pChunks As %Integer, pVerbose As %Boolean = 0, pTaskGroup As %String = "", Output pUpdates As %Integer, pRefProp As %String = "", pRefID As %String = "", ByRef pDimTables, pFactList As %String = "") As %Status
{
 Set tSC = $$$OK
 Set tRS = ""
 New %var,%source,%ROWID,%msg,%dsSourceId,%dsSourceObj
 Try {
 Set tUseFactList = ($G(pFactList)'="")
 Set (SQLCODE,tStarId) = ""
 Set pUpdates = 0
 Set tLastCount = 0
 Set tUseFactList = ($G(pFactList)'="")
 Set tID = ""
 Set tRows = 0
 If (pEndId="") {
  Set:+$G(%dsReadCommitted,1) oldzu=$ZU(115,2,1)
  Set pEndId=pStartId
 }
 If (pRefProp'="") {
  Set tRS = ##class(%ResultSet).%New()
  Set tSC = tRS.Prepare("SELECT %ID,%ID ""MessageBodyId"",%EXTERNAL(%ID) ""DxID"",%EXTERNAL(DocType) ""DxDocType"" FROM EnsLib_HL7.Message"_" WHERE "_pRefProp_"=?")
  If $$$ISERR(tSC) Quit
  Set tSC = tRS.Execute(pRefID)
  If $$$ISERR(tSC) Quit
 }
 ElseIf (pStartId=pEndId) {
  &sql(DECLARE sqeq1113905975 CURSOR FOR
  SELECT %ID,%ID "MessageBodyId",%EXTERNAL(%ID) "DxID",%EXTERNAL(DocType) "DxDocType" FROM EnsLib_HL7.Message
  WHERE %ID = :pStartId
  )
  &sql(OPEN sqeq1113905975)
  If (SQLCODE'=0) {
   Set tSC = $$$ERROR($$$GeneralError,"Error opening SQL cursor: ("_$G(SQLCODE)_") "_$G(%msg))
   Quit
  }
  &sql(FETCH sqeq1113905975 INTO :tID,:%var("MessageBodyId"),:%var("DxID"),:%var("DxDocType"))
  If (SQLCODE'=0) {
    Set tSC = $$$ERROR($$$GeneralError,"Error fetching row: ("_$G(SQLCODE)_") "_$G(%msg))
    &sql(CLOSE sqeq1113905975)
      Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",pStartId,tSC)
    Quit
  }
 }
 Else {
  &sql(DECLARE sq1113905975 CURSOR FOR
  SELECT %ID,%ID "MessageBodyId",%EXTERNAL(%ID) "DxID",%EXTERNAL(DocType) "DxDocType" FROM EnsLib_HL7.Message
  WHERE %ID BETWEEN :pStartId  AND :pEndId
  )
  &sql(OPEN sq1113905975)
  If (SQLCODE'=0) {
   Set tSC = $$$ERROR($$$GeneralError,"Error opening SQL cursor: ("_$G(SQLCODE)_") "_$G(%msg))
   Quit
  }
  &sql(FETCH sq1113905975 INTO :tID,:%var("MessageBodyId"),:%var("DxID"),:%var("DxDocType"))
  If (SQLCODE'=0) {
    Set tSC = $$$ERROR($$$GeneralError,"Error fetching row: ("_$G(SQLCODE)_") "_$G(%msg))
    &sql(CLOSE sq1113905975)
    If ($G(tID)'="") {
       Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",tID,tSC)
    }
    Quit
  }
 }
 While ($S($IsObject(tRS):tRS.Next(.tSC),1:SQLCODE=0)) {
 Try {
 If ($IsObject(tRS)) {
  If $$$ISERR(tSC) Quit
  Set tID = $G(tRS.Data("%ID"))
  Set %var("MessageBodyId") = $G(tRS.Data("MessageBodyId"))
  Set %var("DxID") = $G(tRS.Data("DxID"))
  Set %var("DxDocType") = $G(tRS.Data("DxDocType"))
 }
 Set %dsSourceId = $G(tID)
 Set tExStartTime = $ZH
 Set x = $I(^IRIS.Temp.DeepSeeBuildStats($namespace,"ENS.MESSAGEBODY","expr"),$ZH-tExStartTime)

 #; invoke method to process this fact
 Set tFactId = ""
 Set tSC = ##class(User.Ens.MessageBody.Fact).%ProcessFact(tID,pBatchMode,.%var,.tFactId,.tErrorMsg,.pDimTables,,pFactList,.tUpdater)
 If (tFactId'="") {
 If $$$ISOK(tSC) {
  Set pUpdates = pUpdates+1
  Set pChunks(tFactId\64000+1) = ""
 }
 ElseIf (pVerbose) {
  Write "Error filing row: ",tID,!
  Write:tErrorMsg'="" tErrorMsg,!
  Write $System.Status.GetOneStatusText(tSC),!!
  Set tSC = $$$OK
 }
 Kill pDimTables
 Set tRows = tRows + 1
 If (pVerbose&&'(tRows#1000)) Write $C(13,27)_"[0J"_"Building fact table: ",?25,$J($FN(tRows,",",0),10)," fact(s) updated."
 If (pVerbose&&'(tRows#1000)&&(+$G(%dserrcount))) Write " ",$J($FN(%dserrcount,",",0),10)," error(s)"
 If ((pTaskGroup'="")&&'(tRows#1000)) {
  Set tDelta = tRows - tLastCount
  Set inc=$I(^IRIS.Temp.DeepSeeUpdate($namespace,pTaskGroup,"facts"),tDelta)
  Set tLastCount = tRows
 }
 } ;factId
  }
  Catch (ex) {
    Set tSC = ex.AsStatus()
    If ($G(tID)'="") {
      Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",tID,tSC)
    }
  }
  If '$IsObject(tRS) {
   If (pStartId=pEndId) {
    &sql(FETCH sqeq1113905975 INTO :tID,:%var("MessageBodyId"),:%var("DxID"),:%var("DxDocType"))
   }
   Else {
    &sql(FETCH sq1113905975 INTO :tID,:%var("MessageBodyId"),:%var("DxID"),:%var("DxDocType"))
   }
  }
 } ;while
  If '$IsObject(tRS) {
   If (pStartId=pEndId) {
    &sql(CLOSE sqeq1113905975)
   }
   Else {
    &sql(CLOSE sq1113905975)
   }
  }
 If (pVerbose) Write $C(13,27)_"[0J"_"Building fact table: "_$FN(+$G(tRows),",",0)_" fact(s) updated"
 If (pTaskGroup'="") {
  Set tDelta = tRows - tLastCount
  Set inc=$I(^IRIS.Temp.DeepSeeUpdate($namespace,pTaskGroup,"facts"),tDelta)
 }
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  &sql(CLOSE sqeq1113905975)
  &sql(CLOSE sq1113905975)
 }
  Set:$D(oldzu) zu=$ZU(115,2,oldzu)
 If ($$$ISERR(tSC)) {
  Do ..%LogError(tSC)
  If (pVerbose) {
   Do $System.Status.DisplayError(tSC)
  }
  If ($G(tID)'="") {
   Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",tID,tSC)
  }
 }
 Quit tSC
}

/// Update all Facts with data from the source table.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %BuildAllFacts(pVerbose As %Boolean = 0, pFactList As %String = "") As %Status
{
 Set tSC = $$$OK
 New %var,%source,%ROWID,%msg,%dsSourceId,%dsSourceObj
 Try {
 Set (SQLCODE,tStarId) = ""
 Set tLastCount = 0
 Set tID = ""
 Set tRows = 0
  Set tUseFactList = ($G(pFactList)'="")
  &sql(DECLARE sq21113905975 CURSOR FOR
  SELECT %ID,%ID "MessageBodyId",%EXTERNAL(%ID) "DxID",%EXTERNAL(DocType) "DxDocType" FROM EnsLib_HL7.Message
  )
  &sql(OPEN sq21113905975)
  If (SQLCODE'=0) {
   Set tSC = $$$ERROR($$$GeneralError,"Error opening SQL cursor: ("_$G(SQLCODE)_") "_$G(%msg))
   Quit
  }
  &sql(FETCH sq21113905975 INTO :tID,:%var("MessageBodyId"),:%var("DxID"),:%var("DxDocType"))
  If ((SQLCODE=100)&&pVerbose) {
   Write "No source data found.",!
  }
  While (SQLCODE=0) {
  If ($D(%dsmaxfacts)&&(tRows>=+$G(%dsmaxfacts))) Quit
  Try {
 Set %dsSourceId = $G(tID)
 Set tExStartTime = $ZH
 Set x = $I(^IRIS.Temp.DeepSeeBuildStats($namespace,"ENS.MESSAGEBODY","expr"),$ZH-tExStartTime)

 #; invoke method to process this fact
 Set tFactId = ""
 Set tSC = ##class(User.Ens.MessageBody.Fact).%ProcessFact(tID,1,.%var,.tFactId,.tErrorMsg,,,pFactList,.tUpdater)
 Set:$$$ISERR(tSC) err = $I(%dserrcount)
 If ($$$ISERR(tSC)&&pVerbose) {
  Write "Error filing row: ",tID,!
  Write:tErrorMsg'="" tErrorMsg,!
  Write $System.Status.GetOneStatusText(tSC),!!
  Set tSC = $$$OK
 }
 If (tFactId'="") {
  Set tRows = tRows + 1
  Set %dsfactcount = tRows
  If (pVerbose&&'(tRows#1000)) Write $C(13,27)_"[0J"_"Building fact table: ",?25,$J($FN(tRows,",",0),10)," fact(s) updated."
  If (pVerbose&&'(tRows#1000)&&(+$G(%dserrcount))) Write " ",$J($FN(%dserrcount,",",0),10)," error(s)"
 } ;factId
  }
  Catch (ex) {
    Set tSC = ex.AsStatus()
    If ($G(tID)'="") {
      Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",tID,tSC)
    }
  }
  &sql(FETCH sq21113905975 INTO :tID,:%var("MessageBodyId"),:%var("DxID"),:%var("DxDocType"))
 } ;while
  &sql(CLOSE sq21113905975)
 If (pVerbose) Write $C(13,27)_"[0J"_"Building fact table: "_$FN(+$G(tRows),",",0)_" fact(s) updated"
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  &sql(CLOSE sq21113905975)
 }
 If ($$$ISERR(tSC)) {
  Do ..%LogError(tSC)
  If (pVerbose) {
   Do $System.Status.DisplayError(tSC)
  }
  If ($G(tID)'="") {
   Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",tID,tSC)
  }
 }
 Quit tSC
}

/// Create a temp file of all source ids.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %BuildTempFile(pTempKey As %String, Output pImplemented As %Boolean, pVerbose As %Boolean = 0) As %Status
{
 Set tSC = $$$OK
 New %var,%source,%ROWID,%msg,%dsSourceId,%dsSourceObj
 Set pImplemented = 1
 Try {
 Set (SQLCODE,tStarId) = ""
 Kill $$$DeepSeeTempSourceId(pTempKey)
 Set tID = ""
 Set tRows = 0
 Set tUpdate = ..%Count()
  If tUpdate {
   Set %dsmaxfacts = tUpdate
   &sql(DECLARE sq31113905975 CURSOR FOR
   SELECT %sourceId FROM User_Ens_MessageBody.Fact
   )
  }
  Else {
   &sql(DECLARE sq31113905975 CURSOR FOR
   SELECT %ID FROM EnsLib_HL7.Message
   )
  }
  &sql(OPEN sq31113905975)
  If (SQLCODE'=0) {
   Set tSC = $$$ERROR($$$GeneralError,"Error opening SQL cursor: ("_$G(SQLCODE)_") "_$G(%msg))
   Quit
  }
  &sql(FETCH sq31113905975 INTO :tID)
  If ((SQLCODE=100)&&pVerbose) {
   Write "No source data found.",!
  }
  While (SQLCODE=0) {
  Set tRows = tRows+1
  Set tChunk = tRows\64000+1
  Set tOffset = tRows#64000+1
  Set:tID'="" $$$DeepSeeTempSourceId(pTempKey,tChunk,tOffset) = $LB(tID,''tUpdate)
  If (pVerbose&&'(tRows#10000)) Write $C(13,27)_"[0J"_"Building temp file: ",?25,$J($FN(tRows,",",0),10)," record(s) processed."
  If ($D(%dsmaxfacts)&&(tRows>=+$G(%dsmaxfacts))) Quit
  &sql(FETCH sq31113905975 INTO :tID)
 } ;while
  &sql(CLOSE sq31113905975)
 If (pVerbose) Write $C(13,27)_"[0J"_"Building temp file: "_$FN(+$G(tRows),",",0)_" record(s) processed"
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  &sql(CLOSE sq31113905975)
 }
 If ($$$ISERR(tSC)) {
  Do ..%LogError(tSC)
  If (pVerbose) {
   Do $System.Status.DisplayError(tSC)
  }
 }
 Quit tSC
}

/// Check for the existence of a single ID in the source table.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %CheckSourceId(pTestId As %String, pVerbose As %Boolean = 0, Output pSC As %Status) As %Boolean
{
 // Method generation added by DTB422
 Set tSourceExists = 0
 Set pSC = $$$OK
 Try {
  &sql(SELECT COUNT(%ID) INTO :tExists FROM EnsLib_HL7.Message WHERE %ID = :pTestId)
  If (tExists) {
   Set tSourceExists = 1
  }
 }
 Catch(ex) {
  Set pSC = ex.AsStatus()
 }
 If ($$$ISERR(pSC)) {
  Do ..%LogError(pSC)
  If (pVerbose) {
   Do $System.Status.DisplayError(pSC)
  }
 }
 Quit tSourceExists
}

/// Perform the work of updating one fact in the cube.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %ProcessFact(pID As %String, pBatchMode As %Boolean = 0, ByRef %var As %String, ByRef pFactId As %Integer, Output pErrorMsg As %String, ByRef pDimTables, pDimensionsOnly As %Boolean = 0, pFactList As %String = "", ByRef pSQLUpdate As %SQL.StatementResult = {$$$NULLOREF}) As %Status
{
 Set tSC = $$$OK
 New %ROWID,%msg,%value,%source,%expression
 Try {
  Set (SQLCODE,tStarId) = ""
  Set pErrorMsg = ""
  Set pFactId = $G(pFactId)
  Set %value = ""

  // + DTB886 - Consult the pFactList. If defined, remove anything that is not in the list from %var
  // It is assumed that pFactList is a $lb in this method
  Set tLimitedList=0
  If (pFactList'="") {
    Set tLimitedList = 1
    Set pBatchMode = 0
    Merge tOriginalVar = %var
    Set tFact = $O(%var(""))
    While (tFact'="") {
      Kill:'$ListFind(pFactList,tFact) %var(tFact)
      Set tFact = $O(%var(tFact))
    }
  }
  If tLimitedList {
    If '$G($$$DeepSeeMetaGLVN("cubes","ENS.MESSAGEBODY","namedFactNums")) {
      Set tSC = $$$ERROR($$$GeneralError,"Cube 'ENS.MESSAGEBODY' does not support updates using a fact list.")
      Quit
    }
  }
  // - DTB886

  #; Transform relationship properties
  Set tUseCurrFact = $D(%var("MessageBodyId"))
  Set tRItem=$G(%var("MessageBodyId"))
  If (tRItem'="") {
   Set tRItem = $O($$$DeepSeeIndexGLVN("MESSAGEVOLUME","%sourceId",tRItem,""))
   If ($D(%dsMissingRef)&&(tRItem="")) {
    Set x = $I(%dsMissingRef)
    Set tSC = $$$ERROR($$$GeneralError,"Missing relationship reference in "_..#CUBENAME_": source ID "_pID_" missing reference to MessageBodyId "_%var("MessageBodyId"))
    Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",pID,tSC)
   }
  }
  Set:tUseCurrFact %var("MessageBodyId") = tRItem


  #; apply null replacements
  Set:$D(%var("DxDocType"))&&(($G(%var("DxDocType"))="")||($G(%var("DxDocType"))=$C(0))) %var("DxDocType") = "<null>"
  Set:$D(%var("DxID"))&&(($G(%var("DxID"))="")||($G(%var("DxID"))=$C(0))) %var("DxID") = "<null>"

  If (pDimensionsOnly) {
   Set tFactId=""
   Set tIsInsert = 1
  }
  ElseIf (pBatchMode) {
   Set zuSetting = $zu(115,1,0)
   Set tIsInsert = 1
  }
  ElseIf (pID'="") {
   Set tFactId = $O($$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceId",pID,""))
   Set tIsInsert = ''(tFactId="")
  }
  ElseIf (pFactId'="") {
   If ($D($$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceIdReverse",pFactId))) {
    Set tFactId = pFactId
    Set tIsInsert = 0
   }
   Else {
    Set tFactId = ""
    Set tIsInsert = 1
   }
  }
  Else {
   Set tFactId = ""
   Set tIsInsert = 1
  }

  If ('pBatchMode && tLimitedList && tIsInsert) {
    Quit
  }

 #; STAR Table: User.Ens.MessageBody.StarDocType
 If ($G(%var("DxDocType"))'="") {
  Set tStarId = $O(^DeepSee.DimensionI("USER.ENS.MESSAGEBODY.STARDOCTYPE","Primary",$zu(28,$G(%var("DxDocType")),7,113),""))
  If (tStarId '= "") {
   Set %var("DxDocType") = tStarId
  }
  Else {
  Set tLockKey = $zu(28,%var("DxDocType"),7,113)
  Lock +$$$DeepSeeIndexGLVN("User.Ens.MessageBody.StarDocType",tLockKey):15
  If '$Test {
   Set tSC = $$$ERROR($$$GeneralError,"Unable to acquire lock for dimension table: 'User_Ens_MessageBody.StarDocType'")
   Quit
  }
  Set tStarId = $O(^DeepSee.DimensionI("USER.ENS.MESSAGEBODY.STARDOCTYPE","Primary",$zu(28,$G(%var("DxDocType")),7,113),""))
   If (tStarId '= "") {
    Set %var("DxDocType") = tStarId
   }
   Else {
    &sql(INSERT INTO User_Ens_MessageBody.StarDocType (DxDocType) VALUES (:%var("DxDocType")))
    If (SQLCODE'=0) {
     Lock -$$$DeepSeeIndexGLVN("User.Ens.MessageBody.StarDocType",tLockKey)
     Set tSC = $$$ERROR($$$GeneralError,"Insert into dimension table failed: 'User_Ens_MessageBody.StarDocType' SQLCODE="_SQLCODE)
     Quit
    }
    Set %var("DxDocType") = %ROWID
   }
   Lock -$$$DeepSeeIndexGLVN("User.Ens.MessageBody.StarDocType",tLockKey)
  }
 }

 #; STAR Table: User.Ens.MessageBody.StarID
 If ($G(%var("DxID"))'="") {
  Set tStarId = $O(^DeepSee.DimensionI("USER.ENS.MESSAGEBODY.STARID","Primary",$zu(28,$G(%var("DxID")),7,113),""))
  If (tStarId '= "") {
   Set %var("DxID") = tStarId
  }
  Else {
  Set tLockKey = $zu(28,%var("DxID"),7,113)
  Lock +$$$DeepSeeIndexGLVN("User.Ens.MessageBody.StarID",tLockKey):15
  If '$Test {
   Set tSC = $$$ERROR($$$GeneralError,"Unable to acquire lock for dimension table: 'User_Ens_MessageBody.StarID'")
   Quit
  }
  Set tStarId = $O(^DeepSee.DimensionI("USER.ENS.MESSAGEBODY.STARID","Primary",$zu(28,$G(%var("DxID")),7,113),""))
   If (tStarId '= "") {
    Set %var("DxID") = tStarId
   }
   Else {
    &sql(INSERT INTO User_Ens_MessageBody.StarID (DxID) VALUES (:%var("DxID")))
    If (SQLCODE'=0) {
     Lock -$$$DeepSeeIndexGLVN("User.Ens.MessageBody.StarID",tLockKey)
     Set tSC = $$$ERROR($$$GeneralError,"Insert into dimension table failed: 'User_Ens_MessageBody.StarID' SQLCODE="_SQLCODE)
     Quit
    }
    Set %var("DxID") = %ROWID
   }
   Lock -$$$DeepSeeIndexGLVN("User.Ens.MessageBody.StarID",tLockKey)
  }
 }
 If ('pBatchMode) {
    Set tVal = $G(%var("DxID"))
    If ((tVal'="")&&('$D($$$DeepSeeIndexGLVN("ENS.MESSAGEBODY",2,tVal)))) {
     Set ts = $I($$$DeepSeeResultsGLVN("ENS.MESSAGEBODY","fact",2))
    }
    Set tVal = $G(%var("DxDocType"))
    If ((tVal'="")&&('$D($$$DeepSeeIndexGLVN("ENS.MESSAGEBODY",3,tVal)))) {
     Set ts = $I($$$DeepSeeResultsGLVN("ENS.MESSAGEBODY","fact",3))
    }
 }

 #; INSERT or UPDATE data into fact table
 // DTB886 - Build these for relevant cases below.
 Set tListINTO = "%sourceId"
 Set tListParameters = "?"
 Set tListVALUES($I(tListVALUES)) = pID
 Set tFact = $O(%var(""))
 While (tFact'="") {
   Set tListINTO = tListINTO _ $S($L(tListINTO):",",1:"") _ tFact
   Set tListParameters = tListParameters _ $S($L(tListParameters):",",1:"") _ "?"
   Set tListVALUES($I(tListVALUES)) = $G(%var(tFact))
   Set tFact = $O(%var(tFact))
 }
 Set:'tIsInsert tListVALUES($I(tListVALUES)) = tFactId

 If (pDimensionsOnly) {
 }
 ElseIf (pBatchMode) {
  If tLimitedList {
    // DTB886 - Handle a defined incoming pFactList. This forces use of dynamic SQL and has trimmed the available %var
    If '$IsObject(pSQLUpdate) {
    	Set tSQL = "INSERT %NOLOCK %NOINDEX INTO User_Ens_MessageBody.Fact ("_tListINTO_") VALUES ("_tListParameters_")"

    	Set pSQLUpdate = ##class(%SQL.Statement).%New()
    	Set tSC = pSQLUpdate.%Prepare(tSQL)
    	If $$$ISERR(tSC) Quit
    }
    Set tListResult = pSQLUpdate.%Execute(tListVALUES...)

    Set pFactId = tListResult.%ROWID
    Set SQLCODE = tListResult.%SQLCODE
  }
  Else {
    &sql(INSERT %NOLOCK %NOINDEX INTO User_Ens_MessageBody.Fact (%sourceId,DxDocType,DxID,MessageBodyId)
         VALUES (:pID,:%var("DxDocType"),:%var("DxID"),:%var("MessageBodyId")))
    Set pFactId = %ROWID
  }
  If (pFactId'="") {
    Set:pID'="" $$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceId",pID,pFactId) = ""
    Set $$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceIdReverse",pFactId) = pID
  }
 }
 Else {
  If ($G(tFactId)'="") {
   If tLimitedList {
    // DTB886 - Handle a defined incoming pFactList. This forces use of dynamic SQL and has trimmed the available %var
    If '$IsObject(pSQLUpdate) {
    	Set tSQL = "UPDATE User_Ens_MessageBody.Fact ("_tListINTO_") VALUES ("_tListParameters_") WHERE %ID = ?"

    	Set pSQLUpdate = ##class(%SQL.Statement).%New()
    	Set tSC = pSQLUpdate.%Prepare(tSQL)
    	If $$$ISERR(tSC) Quit
    }
    Set tListResult = pSQLUpdate.%Execute(tListVALUES...)

    Set pFactId = tFactId
    Set SQLCODE = tListResult.%SQLCODE
   }
   Else {
    &sql(UPDATE User_Ens_MessageBody.Fact (%sourceId,DxDocType,DxID,MessageBodyId)
         VALUES (:pID,:%var("DxDocType"),:%var("DxID"),:%var("MessageBodyId")) WHERE %ID = :tFactId)
    Set pFactId = tFactId
   }
  }
  Else {
   If tLimitedList {
     // DTB886 - Handle a defined incoming pFactList. This forces use of dynamic SQL and has trimmed the available %var
    If '$IsObject(pSQLUpdate) {
    	Set tSQL = "INSERT INTO User_Ens_MessageBody.Fact ("_tListINTO_") VALUES ("_tListParameters_")"

    	Set pSQLUpdate = ##class(%SQL.Statement).%New()
    	Set tSC = pSQLUpdate.%Prepare(tSQL)
    	If $$$ISERR(tSC) Quit
    }
    Set tListResult = pSQLUpdate.%Execute(tListVALUES...)

    Set pFactId = tListResult.%ROWID
    Set SQLCODE = tListResult.%SQLCODE
   }
   Else {
     &sql(INSERT INTO User_Ens_MessageBody.Fact (%sourceId,DxDocType,DxID,MessageBodyId)
          VALUES (:pID,:%var("DxDocType"),:%var("DxID"),:%var("MessageBodyId")))
     Set pFactId = %ROWID
   }
  }
  If (pFactId'="") {
    Set:pID'="" $$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceId",pID,pFactId) = ""
    Set $$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceIdReverse",pFactId) = pID
  }
 }
 If (SQLCODE'=0) {
  Set pErrorMsg = $G(%msg)
  Set tSC = $$$ERROR($$$GeneralError,"Error inserting/updating fact: (Source ID:'"_pID_"') "_pErrorMsg)
 }
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  Set pErrorMsg = $ZE
 }
 Set:$D(zuSetting) zuSetting = $zu(115,1,zuSetting)

 // DTB886 - Restore original %var if it was trimmed by pFactList
 Merge %var=tOriginalVar

 If $$$ISERR(tSC) {
  Do ..%LogError(tSC)
  If ($G(pID)'="") {
  Do ##class(%DeepSee.Utils).%LogBuildError("ENS.MESSAGEBODY",pID,tSC)
 }
 }
 Quit tSC
}

/// Notification that a batch of facts are about to be processed.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %OnStartBatch(pCubeName As %String, pVerbose As %Boolean = 0) As %Status
{
 Quit $$$OK
}

/// Notification that a batch of facts have just been processed.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %OnEndBatch(pCubeName As %String, pVerbose As %Boolean = 0) As %Status
{
 Quit $$$OK
}

/// Perform the work of injecting one fact into the cube without associated source data.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %InjectFact(ByRef pFactId As %Integer, ByRef pValues As %String, Output pChunks As %Integer, pDimensionsOnly As %Boolean = 0, pFactList As %String = "") As %Status
{
 New %var,%source,%value
 Set tSC = $$$OK
 Try {
  Set %value=""
  Set %var("MessageBodyId") = $G(pValues("%ID"))
  Set %var("DxID") = $G(pValues("%ID~~EXTERNAL"),$G(pValues("%ID")))
  Set %var("DxDocType") = $G(pValues("DocType~~EXTERNAL"),$G(pValues("DocType")))
  Set tUseFactList = ($G(pFactList)'="")

  #; invoke method to process this fact
  Set pFactId = $G(pFactId)
  Set tSC = ##class(User.Ens.MessageBody.Fact).%ProcessFact("",0,.%var,.pFactId,.pErrorMsg,,pDimensionsOnly,pFactList,.tUpdater)
  If $$$ISOK(tSC) {
   Set:(pFactId'="")&&('pDimensionsOnly) pChunks(pFactId\64000+1) = ""
  }
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  Do ..%LogError(tSC)
 }
 Quit tSC
}

/// Perform the work of deleting one fact in the cube.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %DeleteFact(pID As %String, Output pFactId As %Integer, Output pErrorMsg As %String) As %Status
{
 Set tSC = $$$OK
 New %ROWID,%msg
 Try {
  Set (SQLCODE,tStarId) = ""
  Set pErrorMsg = ""
  Set pFactId = ""
  Set pFactId = $O($$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceId",pID,""))
  If (pFactId'="") {
   &sql(DELETE FROM User_Ens_MessageBody.Fact WHERE %ID = :pFactId)
   Kill $$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceId",pID,pFactId)
   Kill $$$DeepSeeIndexGLVN("ENS.MESSAGEBODY","%sourceIdReverse",pFactId)
  }
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  Set pErrorMsg = $ZE
  Do ..%LogError(tSC)
 }
 Quit tSC
}

/// Notification that this cube is being killed.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %OnKillFacts() As %Status
{
 Set tSC = $$$OK
 Try {
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  Do ..%LogError(tSC)
 }
 Quit tSC
}

/// Pre-compute certain aggregates.<br/>
/// Generated by %DeepSee.Generator:%CreateFactTable.<br/>
/// DO NOT CALL THIS METHOD DIRECTLY
ClassMethod %PrecomputeAggregates(pStartChunk As %Integer, pEndChunk As %Integer, pAggGLVN As %String, pVerbose As %Boolean = 0, pTaskGroup As %String = "", ByRef pCount As %Integer = 0) As %Status
{
 Set tSC = $$$OK
 New %ROWID,%msg,%var
 Kill @pAggGLVN
 Try {
  Set (SQLCODE) = ""
  Set tLastCount = 0
 If (pTaskGroup'="") {
  Set tDelta = pCount - tLastCount
  Set inc=$I(^IRIS.Temp.DeepSeeUpdate($namespace,pTaskGroup,"facts"),tDelta)
 }
 }
 Catch(ex) {
  Set tSC = ex.AsStatus()
  Set pErrorMsg = $ZE
  Do ..%LogError(tSC)
 }
 Quit tSC
}

Parameter BITMAPCHUNKINMEMORY = 0;

Parameter CUBENAME = "Ens.MessageBody";

Parameter SOURCECLASS = "EnsLib.HL7.Message";

ForeignKey DxDocType(DxDocType) References User.Ens.MessageBody.StarDocType() [ NoCheck ];

ForeignKey DxID(DxID) References User.Ens.MessageBody.StarID() [ NoCheck ];

ForeignKey MessageBodyId(MessageBodyId) References User.MessageVolume.Fact() [ NoCheck ];

Storage Default
{
<Data name="FactDefaultData">
<Value name="1">
<Value>%sourceId</Value>
</Value>
<Value name="2">
<Value>DxID</Value>
</Value>
<Value name="3">
<Value>DxDocType</Value>
</Value>
<Value name="4">
<Value>MessageBodyId</Value>
</Value>
</Data>
<DataLocation>^DeepSee.Fact("USER.ENS.MESSAGEBODY.FACT")</DataLocation>
<DefaultData>FactDefaultData</DefaultData>
<ExtentSize>10000000</ExtentSize>
<IdLocation>^DeepSee.Fact("USER.ENS.MESSAGEBODY.FACT")</IdLocation>
<Index name="$Fact">
<Location>^DeepSee.Index("ENS.MESSAGEBODY","$Fact")</Location>
</Index>
<Index name="%InverseMessageBodyId">
<Location>^DeepSee.FactRelation("ENS.MESSAGEBODY","MESSAGEBODYID")</Location>
</Index>
<Index name="DxDocType">
<Location>^DeepSee.Index("ENS.MESSAGEBODY",3)</Location>
</Index>
<Index name="DxID">
<Location>^DeepSee.Index("ENS.MESSAGEBODY",2)</Location>
</Index>
<Index name="MessageBodyId">
<Location>^DeepSee.Index("ENS.MESSAGEBODY",4)</Location>
</Index>
<IndexLocation>^User.Ens.MessageBody.FactI</IndexLocation>
<StreamLocation>^DeepSee.FactS("USER.ENS.MESSAGEBODY.FACT")</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}