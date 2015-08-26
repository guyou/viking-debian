;;  vim:syn=winbatch:fileencoding=cp1252:
;;
;;  spanish.nsh
;;
;;  Spanish language strings for the Windows Viking NSIS installer.
;;  Windows Code page: 1252
;;
;;  Author: Roberto
;;
;; Modified for Viking by Mathieu Albinet <mathieu_a@users.sourceforge.net>

; Make sure to update the VIKING_MACRO_LANGUAGEFILE_END macro in
; langmacros.nsh when updating this file

; Startup Checks
!define INSTALLER_IS_RUNNING			"El programa de instalaci�n ya se est� ejecutando."
!define VIKING_IS_RUNNING				"Una instancia de Viking se est� ejecutando. Por favor, salga de Viking y vuelva a intentarlo."

; License Page
!define VIKING_LICENSE_BUTTON			"Siguiente >"
!define VIKING_LICENSE_BOTTOM_TEXT		"$(^Name) est� disponible bajo licencia GNU General Public License (GPL). El siguiente texto de licencia es ofrecido �nicamente a titulo informativo. $_CLICK" 

; Components Page
!define VIKING_SECTION_TITLE			"Viking, software de edici�n y de an�lisis de datos GPS (obligatorio)"
!define VIKING_SHORTCUTS_SECTION_TITLE		"Accesos directos"
!define VIKING_DESKTOP_SHORTCUT_SECTION_TITLE	"Escritorio"
!define VIKING_STARTMENU_SHORTCUT_SECTION_TITLE	"Men� Inicio"
!define VIKING_FILE_ASSOCIATION_SECTION_TITLE	"Extensi�n.gpx"
!define VIKING_SECTION_DESCRIPTION		"Ficheros y DLLs de base de Viking"
!define VIKING_GPSBABEL_SECTION_TITLE	"GPSBabel 1.5.2"

!define VIKING_SHORTCUTS_SECTION_DESCRIPTION	"Accesos directos para lanzar Viking"
!define VIKING_DESKTOP_SHORTCUT_DESC		"Crear un acceso directo a Viking en el escritorio"
!define VIKING_STARTMENU_SHORTCUT_DESC		"Crear un acceso directo a Viking en el men� de inicio"
!define VIKING_FILE_ASSOCIATION_DESC    "Asociar Viking con la extensi�n .gpx"
!define VIKING_INSTALL_GPSBABEL_DESC	"Instalar GPSBabel Programa"

; Installer Finish Page
!define VIKING_FINISH_VISIT_WEB_SITE		"Visite la p�gina web de Viking" 

; Viking Section Prompts and Texts
!define VIKING_PROMPT_CONTINUE_WITHOUT_UNINSTALL	"Desinstalaci�n de la versi�n actual de Viking imposible. La nueva versi�n ser� instalada sin suprimir la versi�n actual."

; Uninstall Section Prompts
!define un.VIKING_UNINSTALL_ERROR_1		"El programa de desinstalaci�n no ha encontrado las entradas de Viking en la base de registros.$\rLa aplicaci�n quiz� haya sido instalada por un usuario distinto."
!define un.VIKING_UNINSTALL_ERROR_2		"Usted no tiene los permisos necesarios para suprimir esta aplicaci�n."

!define VIKING_UNINSTALL_COMMENTS		"Edici�n y de an�lisis de datos GPS"
