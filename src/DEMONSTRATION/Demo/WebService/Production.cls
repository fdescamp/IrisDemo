Class Demo.WebService.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Demo.WebService.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="PatientProcess" Category="" ClassName="Demo.WebService.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Allergies" Category="" ClassName="Demo.WebService.SOAP.Operation.AllergyServiceSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">superuser</Setting>
    <Setting Target="Adapter" Name="SOAPCredentials">superuser</Setting>
  </Item>
  <Item Name="Demographies" Category="" ClassName="Demo.WebService.PatientSQLOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DSN">HC20191 User</Setting>
    <Setting Target="Adapter" Name="Credentials">superuser</Setting>
  </Item>
  <Item Name="PatientAppOp" Category="" ClassName="Demo.WebService.REST.PatientOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">9980</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/Patient/MRN</Setting>
  </Item>
  <Item Name="PatientApp" Category="" ClassName="Demo.WebService.REST.PatientService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9980</Setting>
    <Setting Target="Host" Name="Target">PatientProcess</Setting>
  </Item>
  <Item Name="Demo.WS.Test.Operation.AllergyServiceSoap" Category="" ClassName="Demo.WS.Test.Operation.AllergyServiceSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SOAPCredentials">_system</Setting>
  </Item>
</Production>
}

}
