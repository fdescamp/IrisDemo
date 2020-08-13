/// Dimension table for cube 'MessageVolume'
/// THIS IS A GENERATED CLASS, DO NOT EDIT.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
Class User.MessageVolume.StarSourceConfigName Extends %DeepSee.DimensionTable [ GeneratedBy = User.MessageVolume.CLS, Owner = {}, ProcedureBlock ]
{

Index Primary On DxSourceConfigName [ Unique ];

/// Dimension property: DxSourceConfigName<br/>
/// Source: SourceConfigName
Property DxSourceConfigName As %String(COLLATION = "SQLUPPER(113)", MAXLEN = 2000) [ Required ];

/// Return the total number of members within this dimension.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %Count() As %Integer
{
 Set tCount = 0
 &sql(SELECT COUNT(*) INTO :tCount FROM User_MessageVolume.StarSourceConfigName)
 Quit tCount
}

/// Validate the KEY value for this dimension.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod DxSourceConfigNameIsValid(pArg As %String) As %Status
{
 Quit ##class(%DeepSee.DimensionTable).%ValidateKEY(pArg)
}

/// Return the specification string for the given member.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %GetMemberSpec(pMemberId As %String, pCubeName As %String, pDimNo As %Integer, pHierNo As %Integer, pLevelNo As %Integer) As %String
{
 Set tSpec = ""
 Set:pMemberId'="" tSpec = "&["_$$$dsEscapeIdent(..DxSourceConfigNameGetStored(pMemberId))_"]"
 Quit tSpec
}

/// Fetch the value of a given dimension property.<br/>
/// Generated by %DeepSee.Generator:%CreateStarTable.
ClassMethod %GetDimensionProperty(pProp As %String, pID As %String, Output pFormat As %String, Output pType As %String) As %String
{
 Set pProp = $$$UPPER(pProp)
 Set tValue=""
 Set pFormat=""
 If (pProp="DXSOURCECONFIGNAME") {
  &sql(SELECT DxSourceConfigName INTO :tValue FROM User_MessageVolume.StarSourceConfigName WHERE %ID = :pID)
  Set pType="%String"
 }
 Quit tValue
}

Parameter CUBENAME = "MessageVolume";

Parameter DESCRIPTIONPROPERTY;

Parameter KEYPROPERTY = "DxSourceConfigName";

Storage Default
{
<Data name="StarSourceConfigNameDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DxSourceConfigName</Value>
</Value>
</Data>
<DataLocation>^DeepSee.Dimension("USER.MESSAGEVOLUME.STARSOURCECONFIGNAME")</DataLocation>
<DefaultData>StarSourceConfigNameDefaultData</DefaultData>
<ExtentSize>100</ExtentSize>
<IdLocation>^DeepSee.Dimension("USER.MESSAGEVOLUME.STARSOURCECONFIGNAME")</IdLocation>
<IndexLocation>^DeepSee.DimensionI("USER.MESSAGEVOLUME.STARSOURCECONFIGNAME")</IndexLocation>
<StreamLocation>^DeepSee.DimensionS("USER.MESSAGEVOLUME.STARSOURCECONFIGNAME")</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}