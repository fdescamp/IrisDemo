Class Demo.iKnow.Prod Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.iKnow.Prod" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="FromAthenaMDM" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">FromAthenaMDM_Router</Setting>
    <Setting Target="Adapter" Name="FilePath">c:\MessageIn</Setting>
    <Setting Target="Adapter" Name="ArchivePath"></Setting>
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
  </Item>
  <Item Name="FromAthenaMDM_Router" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">Demo.iKnow.FromAthenaMDMRoutingRule</Setting>
  </Item>
  <Item Name="ToCernerObservations" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">c:\MessageOut</Setting>
    <Setting Target="Host" Name="Filename">CernerObservations.txt</Setting>
  </Item>
</Production>
}

}
