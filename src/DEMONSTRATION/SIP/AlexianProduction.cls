Class SIP.AlexianProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="SIP.AlexianProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="MsgRouter" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">SIP.TCPLookupProduction.RoutingRule</Setting>
    <Setting Target="Host" Name="BadMessageHandler">BadMessageHandler</Setting>
  </Item>
  <Item Name="HL7FileService" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Service." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">MsgRouter</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Adapter" Name="FilePath">c:\INHL7</Setting>
  </Item>
  <Item Name="TCPOutbound" Category="" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">192.168.40.1</Setting>
    <Setting Target="Adapter" Name="Port">13350</Setting>
    <Setting Target="Host" Name="DownstreamSystem"></Setting>
    <Setting Target="Host" Name="UseTCPLookupTable">0</Setting>
  </Item>
  <Item Name="ToLabORM" Category="Lab,ORM,Marc,Cerner" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.40.1.1</Setting>
    <Setting Target="Adapter" Name="Port">13360</Setting>
    <Setting Target="Host" Name="DownstreamSystem">Lab</Setting>
    <Setting Target="Host" Name="UsePortAuthority">1</Setting>
  </Item>
  <Item Name="ToLabADT" Category="Lab,ADT,Marc,Cerner" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.40.1.1</Setting>
    <Setting Target="Adapter" Name="Port">13370</Setting>
    <Setting Target="Host" Name="DownstreamSystem">Lab</Setting>
    <Setting Target="Host" Name="UsePortAuthority">1</Setting>
  </Item>
  <Item Name="ToLabMDM" Category="Lab,MDM,Marc,Cerner" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.40.1.1</Setting>
    <Setting Target="Adapter" Name="Port">13380</Setting>
    <Setting Target="Host" Name="DownstreamSystem">Lab</Setting>
    <Setting Target="Host" Name="UsePortAuthority">1</Setting>
  </Item>
  <Item Name="ToLabDFT" Category="Lab,DFT,Marc,Cerner" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.40.1.1</Setting>
    <Setting Target="Adapter" Name="Port">13347</Setting>
    <Setting Target="Host" Name="DownstreamSystem">Lab</Setting>
    <Setting Target="Host" Name="UsePortAuthority">1</Setting>
  </Item>
  <Item Name="ToLabORU" Category="Lab,ORU,Marc,Cerner" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.40.1.1</Setting>
    <Setting Target="Adapter" Name="Port">13348</Setting>
    <Setting Target="Host" Name="DownstreamSystem">Lab</Setting>
    <Setting Target="Host" Name="UsePortAuthority">1</Setting>
  </Item>
  <Item Name="ToRadORM" Category="Rad,ORM,Marc,Pacs" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">236.876.3.36</Setting>
    <Setting Target="Adapter" Name="Port">41000</Setting>
  </Item>
  <Item Name="ToRadADT" Category="Rad,ADT,Marc,Pacs" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">236.876.3.36</Setting>
    <Setting Target="Adapter" Name="Port">41001</Setting>
  </Item>
  <Item Name="ToRadMDM" Category="Rad,MDM,Marc,Pacs" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">236.876.3.36</Setting>
    <Setting Target="Adapter" Name="Port">41002</Setting>
  </Item>
  <Item Name="ToRadDFT" Category="Rad,DFT,Marc,Pacs" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">236.876.3.36</Setting>
    <Setting Target="Adapter" Name="Port">41003</Setting>
  </Item>
  <Item Name="ToRadORU" Category="Rad,ORU,Marc,Pacs" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">236.876.3.36</Setting>
    <Setting Target="Adapter" Name="Port">41004</Setting>
  </Item>
  <Item Name="ToEncompassORM" Category="Encompass,ORM,Randy,Cerner" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">127.40.1.47</Setting>
    <Setting Target="Adapter" Name="Port">42000</Setting>
    <Setting Target="Host" Name="DownstreamSystem">Encompass</Setting>
  </Item>
 
</Production>
}

}
