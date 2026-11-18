; Instalador do Bob para Windows (Inno Setup 6). Instala só para o usuário atual, sem pedir administrador.
; Antes, gere o executável (ver README). Depois, nesta pasta: ISCC bob.iss
; Sai em instalador\saida\. A memória fica em %LOCALAPPDATA%\Bob e não é apagada ao desinstalar.

#define Versao "0.8.0"

[Setup]
AppId={{14B5C0D9-AD12-47AE-9145-EB3AC23DAF10}
AppName=Bob
AppVersion={#Versao}
DefaultDirName={localappdata}\Programs\Bob
DefaultGroupName=Bob
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=saida
OutputBaseFilename=Bob-{#Versao}-instalador
UninstallDisplayIcon={app}\Bob.exe
LicenseFile=..\LICENSE
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "atalho"; Description: "Criar atalho na área de trabalho"; Flags: unchecked

[Files]
Source: "..\build\onefile\Bob.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\assets\*"; DestDir: "{app}\assets"; Flags: ignoreversion recursesubdirs
Source: "..\pets\*"; DestDir: "{app}\pets"; Flags: ignoreversion recursesubdirs
Source: "..\LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PRIVACIDADE.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Bob"; Filename: "{app}\Bob.exe"
Name: "{group}\Configurar o Bob"; Filename: "{app}\Bob.exe"; Parameters: "--configurar"
Name: "{userdesktop}\Bob"; Filename: "{app}\Bob.exe"; Tasks: atalho

[Registry]
; A opção "abrir ao entrar no Windows" não pode sobreviver ao programa
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueName: "Bob"; Flags: dontcreatekey uninsdeletevalue

[Run]
Filename: "{app}\Bob.exe"; Description: "Abrir o Bob"; Flags: nowait postinstall skipifsilent
