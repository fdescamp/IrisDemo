Class Hospital.HospitalProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Hospital.HospitalProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>8</ActorPoolSize>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Gestion Administrative" Category="Cerner,CernerDictaphone,CernerLab,MySecondNewCategory" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.4</Setting>
    <Setting Target="Host" Name="TargetConfigNames">Gestion Administrative Routeur</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageIn\</Setting>
    <Setting Target="Adapter" Name="ArchivePath"></Setting>
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
    <Setting Target="Host" Name="AckMode">App</Setting>
  </Item>
  <Item Name="Gestion Administrative Routeur" Category="CernerDictaphone,Randy" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="Validation">1</Setting>
    <Setting Target="Host" Name="BusinessRuleName">Hospital.FromCernerADTRoutingRule</Setting>
    <Setting Target="Host" Name="RuleLogging">a</Setting>
    <Setting Target="Host" Name="AlertOnBadMessage">1</Setting>
    <Setting Target="Host" Name="ActOnValidationError">1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="ResponseFrom">TrakCare_TCP</Setting>
    <Setting Target="Host" Name="ResponseTargetConfigNames">ACK_File</Setting>
    <Setting Target="Host" Name="BadMessageHandler">ACK_File</Setting>
  </Item>
  <Item Name="Dictaphone" Category="Cerner,Dictaphone,CernerDictaphone,Critical" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
    <Setting Target="Host" Name="Filename">DictaphoneOutput.txt</Setting>
  </Item>
  <Item Name="Laboratoire" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="please call jesse, not joyce or ellen, if there is a problem." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">1.1.1.1</Setting>
    <Setting Target="Adapter" Name="Port">5000</Setting>
    <Setting Target="Host" Name="Filename">IntellilabOutput.txt</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
  </Item>
  <Item Name="DPI" Category="Cerner,CernerLab" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
    <Setting Target="Host" Name="Filename">LabOutput.txt</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Pharmacie" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
    <Setting Target="Host" Name="Filename">Pharmacie.txt</Setting>
  </Item>
  <Item Name="Radiologie_TCP2" Category="" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.24.104.82</Setting>
    <Setting Target="Adapter" Name="Port">3000</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?E=W</Setting>
  </Item>
  <Item Name="ACK_File" Category="CH Amiens" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut</Setting>
    <Setting Target="Host" Name="Filename">ACK.txt</Setting>
  </Item>
  <Item Name="TrakCare_TCP" Category="" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">172.31.112.1</Setting>
    <Setting Target="Adapter" Name="Port">3000</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">:?E=D</Setting>
  </Item>
  <Item Name="Radiologie" Category="" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">1.2.3</Setting>
    <Setting Target="Adapter" Name="Port">1234</Setting>
  </Item>
</Production>
}

}
