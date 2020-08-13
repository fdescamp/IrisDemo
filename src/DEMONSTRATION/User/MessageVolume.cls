Include EnsUtil

/// 
Class User.MessageVolume Extends %DeepSee.CubeDefinition [ DependsOn = Ens.MessageHeader, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="MessageVolume" displayName="Message Volume" disabled="false" abstract="false" sourceClass="Ens.MessageHeader" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="SourceConfigName" displayName="Source Config Name" disabled="false" hasAll="false" allCaption="All SourceConfigName" allDisplayName="SourceConfigName" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="SourceConfigName" displayName="Source Config Name" disabled="false" sourceProperty="SourceConfigName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TargetConfigName" displayName="Target Config Name" disabled="false" hasAll="false" allCaption="All TargetConfigName" allDisplayName="TargetConfigName" type="data" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="TargetConfigName" displayName="Target Config Name" disabled="false" sourceProperty="TargetConfigName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="TimeProcessed" disabled="false" hasAll="false" allCaption="All TimeProcessed" allDisplayName="TimeProcessed" sourceProperty="TimeProcessed" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="TimeProcessed" displayName="Time Processed" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Hour Processed" displayName="Hour Processed" disabled="false" hasAll="false" allCaption="All Hour Processed" allDisplayName="Hour Processed" sourceProperty="TimeProcessed" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Hour Processed" displayName="Hour Processed" disabled="false" timeFunction="HourNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="IsError" disabled="false" hasAll="false" allCaption="All IsError" allDisplayName="IsError" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="IsError" disabled="false" sourceProperty="IsError" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Status" disabled="false" hasAll="false" allCaption="All Status" allDisplayName="Status" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Status" disabled="false" sourceProperty="Status" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Status" disabled="false" sourceProperty="Status" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <relationship name="MessageBody" disabled="true" sourceProperty="MessageBodyId" factName="%ID" relatedCube="Ens.MessageBody" inverse="MessageHeader" cardinality="one">
  </relationship>
  <listing name="Listing" disabled="false" listingType="table" fieldList="SourceConfigName,TargetConfigName,TimeCreated,TimeProcessed,SessionId,MessageBodyId,Status">
    <additionalDescription>undefined</additionalDescription>
  </listing>
</cube>
}

Parameter DOMAIN;

}
