/// 
Class User.Ens.MessageBody Extends %DeepSee.CubeDefinition [ DependsOn = EnsLib.HL7.Message, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Ens.MessageBody" displayName="Ens.MessageBody" disabled="false" abstract="false" sourceClass="EnsLib.HL7.Message" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="%ID" disabled="false" hasAll="false" allCaption="All %ID" allDisplayName="%ID" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="%ID" disabled="false" sourceProperty="%ID" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="DocType" disabled="false" hasAll="false" allCaption="All DocType" allDisplayName="DocType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="DocType" disabled="false" sourceProperty="DocType" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <relationship name="MessageHeader" disabled="false" sourceProperty="%ID" factName="MessageBodyId" relatedCube="MessageVolume" inverse="MessageBody" cardinality="one">
  </relationship>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="Name">
  </listing>
</cube>
}

Parameter DOMAIN;

}
