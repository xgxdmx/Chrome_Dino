; 该脚本使用 HM VNISEdit 脚本编辑器向导产生

; 安装程序初始定义常量
!define PRODUCT_NAME "Chrome_小恐龙"
!define PRODUCT_VERSION "4.0"
!define PRODUCT_PUBLISHER "梦の彼方"
!define PRODUCT_WEB_SITE "https://www.xgxdmx.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\Main.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor lzma

; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI.nsh"

; MUI 预定义常量
!define MUI_ABORTWARNING
!define MUI_ICON "E:\NSI\梦の彼方\favicon.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; 欢迎页面
!insertmacro MUI_PAGE_WELCOME
; 安装目录选择页面
!insertmacro MUI_PAGE_DIRECTORY
; 开始菜单设置页面
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Chrome_小恐龙"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; 安装过程页面
!insertmacro MUI_PAGE_INSTFILES
; 安装完成页面
!define MUI_FINISHPAGE_RUN "$INSTDIR\Main.exe"
!insertmacro MUI_PAGE_FINISH

; 安装卸载过程页面
!insertmacro MUI_UNPAGE_INSTFILES

; 安装界面包含的语言设置
!insertmacro MUI_LANGUAGE "SimpChinese"

; 安装预释放文件
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI 现代界面定义结束 ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Chrome_小恐龙.exe"
InstallDir "$PROGRAMFILES\Chrome_小恐龙"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUnInstDetails show
BrandingText "梦の彼方"

Section "MainSection" SEC01
  SetOutPath "$INSTDIR\fonts"
  SetOverwrite ifnewer
  File "C:\Users\石运\Desktop\Chrome_小恐龙\fonts\FZSJ-TXJW.TTF"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\fonts\simkai.ttf"
  SetOutPath "$INSTDIR\images\backgrounds"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\backgrounds\background_1.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\backgrounds\background_2.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\backgrounds\background_3.png"
  SetOutPath "$INSTDIR\images\characters"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\characters\afraid.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\characters\dino.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\characters\dino_ducking.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\characters\flying.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\characters\running.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\characters\wait.png"
  SetOutPath "$INSTDIR\images"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\favicon.ico"
  SetOutPath "$INSTDIR\images\modules"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\call_out.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\cloud.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\gameover.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\ground.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\restart.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\text.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\更换背景音乐.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\更换角色.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\难度增加.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\modules\难度降低.png"
  SetOutPath "$INSTDIR\images\obstacles"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\plant1.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\plant2.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\plant3.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\plant4.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\plant_big.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\plant_small.png"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\images\obstacles\ptera.png"
  SetOutPath "$INSTDIR"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\Main.exe"
  SetOutPath "$INSTDIR\music"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\music\bg_music.mp3"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\music\bg_music2.mp3"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\music\bg_music3.mp3"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\music\bg_music4.mp3"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\music\die.wav"
  File "C:\Users\石运\Desktop\Chrome_小恐龙\music\jump.wav"

; 创建开始菜单快捷方式
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  SetOutPath "$INSTDIR"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Chrome_小恐龙.lnk" "$INSTDIR\Main.exe"
  SetOutPath "$INSTDIR"
  CreateShortCut "$DESKTOP\Chrome_小恐龙.lnk" "$INSTDIR\Main.exe"
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
 *  以下是安装程序的卸载部分  *
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
  Delete "$INSTDIR\images\modules\难度降低.png"
  Delete "$INSTDIR\images\modules\难度增加.png"
  Delete "$INSTDIR\images\modules\更换角色.png"
  Delete "$INSTDIR\images\modules\更换背景音乐.png"
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
  Delete "$DESKTOP\Chrome_小恐龙.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Chrome_小恐龙.lnk"

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

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "您确实要完全移除 $(^Name) ，及其所有的组件？" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从您的计算机移除。"
FunctionEnd
