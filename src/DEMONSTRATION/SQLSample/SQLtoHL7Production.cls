Class SQLSample.SQLtoHL7Production Extends Ens.Production [ ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="SQLSample.SQLtoHL7Production" TestingEnabled="false" LogGeneralTraceEvents="false">
  <Description>NewProduction</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Setting Target="Production" Name="ShutdownTimeout">10</Setting>
  <Item Name="MsgRouter" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles message routing logic." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="BusinessRuleName">SQLSample.RoutingRule</Setting>
  </Item>
  <Item Name="HL7FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="Filename">SQLtoHL7output.txt</Setting>
    <Setting Target="Host" Name="AutoBatchParentSegs">0</Setting>
    <Setting Target="Host" Name="Separators"><![CDATA[|^~\&]]></Setting>
    <Setting Target="Host" Name="SearchTableClass"></Setting>
    <Setting Target="Host" Name="DefCharEncoding">Latin1</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="AlertRetryGracePeriod">0</Setting>
    <Setting Target="Host" Name="FailureTimeout">-1</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Host" Name="Framing">AsciiLF</Setting>
    <Setting Target="Adapter" Name="FilePath">c:\OUTHL7\</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="SQLSample.SQLBusinessService" Category="" ClassName="SQLSample.SQLBusinessService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="AlertGracePeriod">0</Setting>
    <Setting Target="Host" Name="AlertOnError">0</Setting>
    <Setting Target="Host" Name="ArchiveIO">0</Setting>
    <Setting Target="Adapter" Name="Query">select Name,Address,Address2,City,State,Zip,QID from QMCTable2</Setting>
    <Setting Target="Adapter" Name="Parameters"></Setting>
    <Setting Target="Adapter" Name="DeleteQuery"></Setting>
    <Setting Target="Adapter" Name="KeyFieldName">QID</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Adapter" Name="DSN">TestDSN</Setting>
    <Setting Target="Adapter" Name="Credentials">sa</Setting>
    <Setting Target="Adapter" Name="JDBCDriver"></Setting>
    <Setting Target="Adapter" Name="JDBCClasspath"></Setting>
    <Setting Target="Adapter" Name="ConnectionAttributes"></Setting>
    <Setting Target="Adapter" Name="JGService"></Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
  </Item>
</Production>
}

}
