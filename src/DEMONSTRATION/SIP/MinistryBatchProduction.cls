Class SIP.MinistryBatchProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="SIP.MinistryBatchProductiond" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="MinistryBatchFileService" Category="" ClassName="EnsLib.RecordMap.Service.BatchFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="BatchClass">ASCN.Msg.RecMap.LFO5.Batch.Msg16</Setting>
    <Setting Target="Host" Name="RecordMap">ASCN.Msg.RecMap.LFO5.Msg16</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageIn\</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MinistryBatchProcessor</Setting>
    <Setting Target="Host" Name="BatchHandling">Whole</Setting>
    <Setting Target="Host" Name="FatalErrors">ParseOnly</Setting>
  </Item>
  <Item Name="MinistryBatchProcessor" Category="" ClassName="SIP.MinistryBatchProcessor" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="NashvilleBatchFileOutput" Category="" ClassName="EnsLib.RecordMap.Operation.BatchFileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DelayDefaultBatchOutput">1</Setting>
    <Setting Target="Host" Name="Filename">NashvilleBatchOutput.txt</Setting>
    <Setting Target="Host" Name="RecordMap">ASCN.Msg.RecMap.LFO5.Msg16</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
  </Item>
  <Item Name="AustinX12BatchOutput" Category="" ClassName="EnsLib.EDI.X12.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
    <Setting Target="Host" Name="Filename">AustinX12BatchOutput.txt</Setting>
  </Item>
  <Item Name="IndianapolisBatchFileOutput" Category="" ClassName="EnsLib.RecordMap.Operation.BatchFileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">IndianapolisBatchFile.txt</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
    <Setting Target="Host" Name="DelayDefaultBatchOutput">1</Setting>
    <Setting Target="Host" Name="RecordMap">ASCN.Msg.RecMap.LFO5.Msg16</Setting>
  </Item>
  <Item Name="NationalFileRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">SIP.NationalFileRouterRoutingRule</Setting>
  </Item>
  <Item Name="NationalBatchFileOutput" Category="" ClassName="EnsLib.RecordMap.Operation.BatchFileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DelayDefaultBatchOutput">1</Setting>
    <Setting Target="Host" Name="Filename">NationalBatchOutput.txt</Setting>
    <Setting Target="Host" Name="RecordMap">ASCN.Msg.RecMap.LFO5.Msg16</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
  </Item>
  <Item Name="MinistryFileRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="12" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">SIP.MinistryFileRouterRoutingRule</Setting>
  </Item>
</Production>
}

}
