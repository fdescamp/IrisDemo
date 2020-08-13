Class FHIRSERVERPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FHIRSERVERPKG.FoundationProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.Test.Service" Category="" ClassName="HS.Test.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="PIXmConsumerOperationsDSTU2">HS.FHIR.PIXm.Consumer.Operations.DSTU2</Setting>
    <Setting Target="Host" Name="PDQmConsumerOperationsDSTU2">HS.FHIR.PDQm.Consumer.Operations.DSTU2</Setting>
  </Item>
  <Item Name="HS.FHIR.Service.DSTU2" Category="" ClassName="HS.FHIR.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIR.Server.Process.DSTU2</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HS.FHIR.REST.Operation" Category="" ClassName="HS.FHIR.REST.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MetadataClass">HS.FHIR.InteractionMetadata</Setting>
    <Setting Target="Host" Name="ServiceName">FHIR.Service.DSTU2</Setting>
  </Item>
  <Item Name="HS.Util.Trace.Operations" Category="" ClassName="HS.Util.Trace.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HS.FHIR.Server.Process.DSTU2" Category="" ClassName="HS.FHIR.Server.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIR.Repository.Operations.DSTU2</Setting>
    <Setting Target="Host" Name="ResourceSchemaRoot">HS.FHIR.vDSTU2.Model.Resource</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HS.FHIR.Repository.Operations.DSTU2" Category="" ClassName="HS.FHIR.vDSTU2.Repository.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIR.PIXm.Manager.Service.DSTU2" Category="" ClassName="HS.FHIR.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIR.PIXm.Manager.Process.DSTU2</Setting>
    <Setting Target="Host" Name="FHIRVersion">DSTU2</Setting>
  </Item>
  <Item Name="HS.FHIR.PIXm.Manager.Process.DSTU2" Category="" ClassName="HS.FHIR.vDSTU2.PIXm.Manager.Process" PoolSize="2" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MPIOperations"></Setting>
    <Setting Target="Host" Name="HUB"></Setting>
  </Item>
  <Item Name="HS.FHIR.PIXm.Consumer.Operations.DSTU2" Category="" ClassName="HS.FHIR.vDSTU2.PIXm.Consumer.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ServiceName">PIXm.Manager.DSTU2</Setting>
    <Setting Target="Host" Name="FHIRVersion">DSTU2</Setting>
  </Item>
  <Item Name="HS.FHIR.PDQm.Supplier.Service.DSTU2" Category="" ClassName="HS.FHIR.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIR.PDQm.Supplier.Process.DSTU2</Setting>
    <Setting Target="Host" Name="FHIRVersion">DSTU2</Setting>
  </Item>
  <Item Name="HS.FHIR.PDQm.Supplier.Process.DSTU2" Category="" ClassName="HS.FHIR.vDSTU2.PDQm.Supplier.Process" PoolSize="2" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MPIOperations"></Setting>
  </Item>
  <Item Name="HS.FHIR.PDQm.Consumer.Operations.DSTU2" Category="" ClassName="HS.FHIR.vDSTU2.PDQm.Consumer.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="ServiceName">PDQm.Supplier.DSTU2</Setting>
    <Setting Target="Host" Name="FHIRVersion">DSTU2</Setting>
  </Item>
  <Item Name="HS.FHIR.FromSDA.DTL.Transaction.Process" Category="" ClassName="HS.FHIR.FromSDA.DTL.Transaction.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.FHIR.REST.Operation</Setting>
  </Item>
  <Item Name="Demo.FHIR.FromCCDAToSDA" Category="" ClassName="Demo.FHIR.FromCCDAToSDA" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="CCDA" Category="" ClassName="EnsLib.EDI.XML.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageIn</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Demo.FHIR.FromCCDAToSDA</Setting>
  </Item>
</Production>
}

}
