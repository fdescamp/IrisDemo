Class Demo.FHIR.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.FHIR.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="HL7FromFile" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5.1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HS.Gateway.HL7.InboundProcess</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageIn</Setting>
    <Setting Target="Adapter" Name="ArchivePath"></Setting>
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
  </Item>
  <Item Name="HS.FHIR.REST.Operation" Category="" ClassName="HS.FHIR.REST.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validate">0</Setting>
    <Setting Target="Host" Name="MetadataClass">HS.FHIR.InteractionMetadata</Setting>
    <Setting Target="Host" Name="ServiceName">HSFHIRService</Setting>
  </Item>
  <Item Name="HS.Test.Service" Category="" ClassName="HS.Test.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIR.FromSDA.DTL.Transaction.Process" Category="" ClassName="HS.FHIR.FromSDA.DTL.Transaction.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIR.REST.Operation</Setting>
    <Setting Target="Host" Name="CustomDTLPackage">Demo.FHIR.DTL.FromSDA</Setting>
    <Setting Target="Host" Name="FHIRFormat">JSON</Setting>
    <Setting Target="Host" Name="FormatFHIROutput">1</Setting>
  </Item>
  <Item Name="HS.Gateway.HL7.InboundProcess" Category="" ClassName="HS.Gateway.HL7.InboundProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ECRTarget">HS.FHIR.FromSDA.DTL.Transaction.Process</Setting>
  </Item>
</Production>
}

}
