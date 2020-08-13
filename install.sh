#!/bin/bash
# Usage install.sh [instanceName]

DIR=$(dirname $0)
if [ "$DIR" = "." ]; then
DIR=$(pwd)
fi

instanceName=$1
password=password

ClassImportDirFHIR=$DIR/src/HL7FHIR
ClassImportDirDEMO=$DIR/src/DEMONSTRATION
ClassImportDirFHIRServer=$DIR/src/FHIRServer
NameSpaceFHIR=""FHIRHL7V2DEMO""
NameSpaceDemo=""DEMONSTRATION""
NameSpaceFHIRServer=""FHIRSERVER""

irissession $instanceName -U USER <<EOF 
sys
sys
zn "HSLIB"

//                INSTALL FHIR NAMESPACE                       //
Set appKey = "/fhirhl7v2demo/fhir/r4"
Set strategyClass = "HS.FHIRServer.Storage.Json.InteractionsStrategy"
Set metadataConfigKey = "HL7v40"

//Install a Foundation namespace and change to it
Do ##class(HS.HC.Util.Installer).InstallFoundation("$NameSpaceFHIR")
zn "$NameSpaceFHIR" 

// Install elements that are required for a FHIR-enabled namespace
Do ##class(HS.FHIRServer.Installer).InstallNamespace()

// Install an instance of a FHIR Service into the current namespace
Do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, strategyClass, metadataConfigKey)
do ##class(Ens.Director).StopProduction()
do \$system.OBJ.ImportDir("$ClassImportDirFHIR","*.cls","cdk",.errors,1)

zw \$classmethod("Ens.Director", "SetAutoStart", "FHIRHL7V2DEMOPKG.FoundationProduction", 0)

set cspConfig = ##class(HS.Util.RESTCSPConfig).URLIndexOpen(appKey)
set cspConfig.ServiceConfigName = "HS.FHIRServer.Interop.Service"
set cspConfig.AllowUnauthenticatedAccess = 1
zw cspConfig.%Save()

set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(appKey)
set config = strategy.GetServiceConfigData()
set config.DebugMode = 4
do strategy.SaveServiceConfigData(config)


zn "%SYS"
set props2("NameSpace") = "$NameSpaceFHIR"
set props2("DispatchClass") = "FHIRDemo.REST.Dispatch"
set props2("CookiePath") = "/csp/demo/rest/"
set props2("Description") = "Demo REST API"
set props2("MatchRoles") = ":%All"
set props2("AutheEnabled") = 64
set tSC = ##class(Security.Applications).Create("/csp/demo/rest", .props2)
zw tSCs


//                INSTALL DEMONSTRATION NAMESPACE                    //
//Install a Foundation namespace and change to it
zn "HSLIB"
Do ##class(HS.HC.Util.Installer).InstallFoundation("$NameSpaceDemo")
zn "$NameSpaceDemo" 



//Import demo pkg
do \$system.OBJ.ImportDir("$ClassImportDirDEMO","*.cls","cdk",.errors,1)

//                   END INSTALL DEMONSTRATION NAMESPACE                 //


//                INSTALL FHIRSERVER NAMESPACE                    //
//Install a Foundation namespace and change to it
zn "HSLIB"
Do ##class(HS.HC.Util.Installer).InstallFoundation("$NameSpaceFHIRServer")
zn "$NameSpaceFHIRServer" 



//Import demo pkg
//do \$system.OBJ.ImportDir("$ClassImportDirFHIRServer","*.cls","cdk",.errors,1)


//                   END INSTALL FHIRSERVER NAMESPACE                 //


halt
EOF
