Class Demo.XMLToCSV Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.XMLToCSV" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="PatientXML" Category="" ClassName="EnsLib.EDI.XML.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\MessageIn</Setting>
    <Setting Target="Host" Name="DocSchemaCategory">Patients</Setting>
    <Setting Target="Host" Name="TargetConfigNames">PatientXMLRouter</Setting>
    <Setting Target="Adapter" Name="Charset">utf-8</Setting>
  </Item>
  <Item Name="PatientCSV" Category="" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">PatientCSV</Setting>
    <Setting Target="Host" Name="RecordMap">PatientCSV</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="PatientXMLRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">Demo.XMLCSV.PatientXMLRouter</Setting>
  </Item>
</Production>
}

}
