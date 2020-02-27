; �ýű�ʹ�� HM VNISEdit �ű��༭���򵼲���

; ��װ�����ʼ���峣��
!define PRODUCT_NAME "Chrome_С����"
!define PRODUCT_VERSION "4.0"
!define PRODUCT_PUBLISHER "�Τα˷�"
!define PRODUCT_WEB_SITE "https://www.xgxdmx.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\Main.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor lzma

; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "E:\NSI\�Τα˷�\favicon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��ʼ�˵�����ҳ��
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Chrome_С����"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\Main.exe"
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

; ��װԤ�ͷ��ļ�
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Chrome_С����.exe"
InstallDir "$PROGRAMFILES\Chrome_С����"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUnInstDetails show
BrandingText "�Τα˷�"

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\fonts"
  SetOverwrite ifnewer
  File "C:\Users\ʯ��\Desktop\Chrome_С����\fonts\FZSJ-TXJW.TTF"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\fonts\simkai.ttf"
  SetOutPath "$INSTDIR\images\backgrounds"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\backgrounds\background_1.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\backgrounds\background_2.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\backgrounds\background_3.png"
  SetOutPath "$INSTDIR\images\characters"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\characters\afraid.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\characters\dino.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\characters\dino_ducking.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\characters\flying.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\characters\running.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\characters\wait.png"
  SetOutPath "$INSTDIR\images"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\favicon.ico"
  SetOutPath "$INSTDIR\images\modules"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\call_out.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\cloud.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\gameover.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\ground.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\restart.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\text.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\������������.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\������ɫ.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\�Ѷ�����.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\modules\�ѶȽ���.png"
  SetOutPath "$INSTDIR\images\obstacles"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\plant1.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\plant2.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\plant3.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\plant4.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\plant_big.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\plant_small.png"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\images\obstacles\ptera.png"
  SetOutPath "$INSTDIR"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\Main.exe"
  SetOutPath "$INSTDIR\music"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\music\bg_music.mp3"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\music\bg_music2.mp3"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\music\bg_music3.mp3"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\music\bg_music4.mp3"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\music\die.wav"
  File "C:\Users\ʯ��\Desktop\Chrome_С����\music\jump.wav"

; ������ʼ�˵���ݷ�ʽ
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  SetOutPath "$INSTDIR"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Chrome_С����.lnk" "$INSTDIR\Main.exe"
  SetOutPath "$INSTDIR"
  CreateShortCut "$DESKTOP\Chrome_С����.lnk" "$INSTDIR\Main.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\Main.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\Main.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

/******************************
 *  �����ǰ�װ�����ж�ز���  *
 ******************************/

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\music\jump.wav"
  Delete "$INSTDIR\music\die.wav"
  Delete "$INSTDIR\music\bg_music4.mp3"
  Delete "$INSTDIR\music\bg_music3.mp3"
  Delete "$INSTDIR\music\bg_music2.mp3"
  Delete "$INSTDIR\music\bg_music.mp3"
  Delete "$INSTDIR\Main.exe"
  Delete "$INSTDIR\images\obstacles\ptera.png"
  Delete "$INSTDIR\images\obstacles\plant_small.png"
  Delete "$INSTDIR\images\obstacles\plant_big.png"
  Delete "$INSTDIR\images\obstacles\plant4.png"
  Delete "$INSTDIR\images\obstacles\plant3.png"
  Delete "$INSTDIR\images\obstacles\plant2.png"
  Delete "$INSTDIR\images\obstacles\plant1.png"
  Delete "$INSTDIR\images\modules\�ѶȽ���.png"
  Delete "$INSTDIR\images\modules\�Ѷ�����.png"
  Delete "$INSTDIR\images\modules\������ɫ.png"
  Delete "$INSTDIR\images\modules\������������.png"
  Delete "$INSTDIR\images\modules\text.png"
  Delete "$INSTDIR\images\modules\restart.png"
  Delete "$INSTDIR\images\modules\ground.png"
  Delete "$INSTDIR\images\modules\gameover.png"
  Delete "$INSTDIR\images\modules\cloud.png"
  Delete "$INSTDIR\images\modules\call_out.png"
  Delete "$INSTDIR\images\favicon.ico"
  Delete "$INSTDIR\images\characters\wait.png"
  Delete "$INSTDIR\images\characters\running.png"
  Delete "$INSTDIR\images\characters\flying.png"
  Delete "$INSTDIR\images\characters\dino_ducking.png"
  Delete "$INSTDIR\images\characters\dino.png"
  Delete "$INSTDIR\images\characters\afraid.png"
  Delete "$INSTDIR\images\backgrounds\background_3.png"
  Delete "$INSTDIR\images\backgrounds\background_2.png"
  Delete "$INSTDIR\images\backgrounds\background_1.png"
  Delete "$INSTDIR\fonts\simkai.ttf"
  Delete "$INSTDIR\fonts\FZSJ-TXJW.TTF"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$DESKTOP\Chrome_С����.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Chrome_С����.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\music"
  RMDir "$INSTDIR\images\obstacles"
  RMDir "$INSTDIR\images\modules"
  RMDir "$INSTDIR\images\characters"
  RMDir "$INSTDIR\images\backgrounds"
  RMDir "$INSTDIR\images"
  RMDir "$INSTDIR\fonts"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���������е������" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش����ļ�����Ƴ���"
FunctionEnd
