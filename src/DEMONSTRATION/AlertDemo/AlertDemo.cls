Class AlertDemo.AlertDemo Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="AlertDemo.AlertDemo" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description>Nemours POC production</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Setting Target="Adapter" Name="AlertNotificationManager">AlertNotificationProcess</Setting>
  <Setting Target="Adapter" Name="AlertNotificationOperation">EMailAlert</Setting>
  <Setting Target="Adapter" Name="AlertNotificationRecipients">InterfaceAlerts@InterSystems.com</Setting>
  <Setting Target="Adapter" Name="AlertActionWindow">1</Setting>
  <Setting Target="Adapter" Name="ShutdownTimeout">10</Setting>
  <Item Name="ADTRouter" Category="ADT" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="This handles ADT message routing logic" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">Nemours.NewProduction.RoutingRule</Setting>
  </Item>
  <Item Name="ADTtoLab" Category="ADT,Lab" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertGroups"></Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="QueueCountAlert">0</Setting>
    <Setting Target="Host" Name="RetryInterval">500</Setting>
    <Setting Target="Adapter" Name="IPAddress">1.2.3.4</Setting>
  </Item>
  <Item Name="ADTtoOther" Category="ADT" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">4.5.6</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="ADTtoRadiology" Category="ADT,Radiology" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Operation." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">ADTtoRadiology.txt</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
    <Setting Target="Host" Name="AlertGroups">TEST</Setting>
  </Item>
  <Item Name="AlertManager" Category="Alerts" ClassName="Ens.Alerting.AlertManager" PoolSize="0" Enabled="true" Foreground="false" Comment="Decides if incoming alerts should be managed or not." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="CreateManagedAlertRule">Nemours.AlertManagerRules</Setting>
  </Item>
  <Item Name="AlertMonitor" Category="Alerts" ClassName="Ens.Alerting.AlertMonitor" PoolSize="1" Enabled="true" Foreground="false" Comment="Checks on a regular basis to see if alerts need updated,etc." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="OverdueAlertRule">Nemours.AlertMonitorRule</Setting>
  </Item>
  <Item Name="AlertNotificationProcess" Category="Alerts" ClassName="Ens.Alerting.NotificationManager" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="NotificationTransform">Nemours.AlertNotificationVer2DTL</Setting>
  </Item>
  <Item Name="AlertsOutToFile" Category="Alerts" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="Sends standard alerts to a file" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">Alerts.txt</Setting>
    <Setting Target="Host" Name="RecordMap">Demo.AlertRecordMap</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageOut\</Setting>
  </Item>
  <Item Name="EMailAlertISCinternal" Category="Alerts" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="IncludeDetails">1</Setting>
    <Setting Target="Host" Name="IncludeManagedAlertHistory">2</Setting>
    <Setting Target="Host" Name="IncludeNodeinSubject">1</Setting>
    <Setting Target="Host" Name="SubjectPrefix">"Test Alerte ISC"</Setting>
    <Setting Target="Host" Name="SystemName">ManagedAlertTestSystem</Setting>
    <Setting Target="Adapter" Name="Credentials">fdescamp</Setting>
    <Setting Target="Adapter" Name="From">srenshaw@intersystems.com</Setting>
    <Setting Target="Adapter" Name="SMTPServer">moon.iscinternal.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
  </Item>
  <Item Name="Ens.Alert" Category="Alerts" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="0" Enabled="true" Foreground="false" Comment="Regular alert router." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">Nemours.NewProduction.AlertRule</Setting>
  </Item>
  <Item Name="FromADT" Category="ADT" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="This is a default HL7 File Service." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">ADTRouter</Setting>
    <Setting Target="Host" Name="MessageSchemaCategory">NemoursADT</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\MessageIn\</Setting>
    <Setting Target="Host" Name="BatchHandling">Indiv</Setting>
  </Item>
  <Item Name="ADTToIntellilab" Category="" ClassName="EnsLib.HL7.Operation.TCPOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="IPAddress">1.1.1.1</Setting>
    <Setting Target="Adapter" Name="Port">55555</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="AlertGroups">Lab</Setting>
  </Item>
  <Item Name="EMailAlertGmail" Category="Alerts" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="IncludeDetails">1</Setting>
    <Setting Target="Host" Name="IncludeManagedAlertHistory">2</Setting>
    <Setting Target="Host" Name="IncludeNodeinSubject">1</Setting>
    <Setting Target="Host" Name="SubjectPrefix">"Test Alert "</Setting>
    <Setting Target="Host" Name="SystemName">ManagedAlertTestSystem</Setting>
    <Setting Target="Adapter" Name="Credentials">medecin</Setting>
    <Setting Target="Adapter" Name="From">healthshare@gmail.com</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">TLStoGmail*</Setting>
    <Setting Target="Adapter" Name="Recipient">medecin.isc2018@gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">1</Setting>
  </Item>
  <Item Name="EmailAlert" Category="Alerts" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="This sends alerts via e-mail." LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="IncludeDetails">1</Setting>
    <Setting Target="Host" Name="IncludeManagedAlertHistory">2</Setting>
    <Setting Target="Host" Name="IncludeNodeinSubject">1</Setting>
    <Setting Target="Host" Name="SubjectPrefix">"Alerte Health Connect"</Setting>
    <Setting Target="Host" Name="SystemName">ManagedAlertTestSystem</Setting>
    <Setting Target="Adapter" Name="Credentials">fdescamp</Setting>
    <Setting Target="Adapter" Name="From">healthshare@intersystems.com</Setting>
    <Setting Target="Adapter" Name="SMTPServer">moon.iscinternal.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig"></Setting>
    <Setting Target="Adapter" Name="Recipient">medecin.isc2018@gmail.com</Setting>
    <Setting Target="Adapter" Name="Cc">fdescamps.intersystems@gmail.com</Setting>
  </Item>
  <Item Name="test" Category="" ClassName="EnsLib.HL7.Service.TCPService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
