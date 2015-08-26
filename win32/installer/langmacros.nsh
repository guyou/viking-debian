;;
;; Windows Viking NSIS installer language macros
;; Based on Win32 Pidgin installer

!macro VIKING_MACRO_DEFAULT_STRING LABEL VALUE
  !ifndef "${LABEL}"
    !define "${LABEL}" "${VALUE}"
    !ifdef INSERT_DEFAULT
      !warning "${LANG} lang file missing ${LABEL}, using default..."
    !endif
  !endif
!macroend

!macro VIKING_MACRO_LANGSTRING_INSERT LABEL LANG
  LangString "${LABEL}" "${LANG_${LANG}}" "${${LABEL}}"
  !undef "${LABEL}"
!macroend

!macro VIKING_MACRO_LANGUAGEFILE_BEGIN LANG
  !define CUR_LANG "${LANG}"
!macroend

!macro VIKING_MACRO_LANGUAGEFILE_END
  !define INSERT_DEFAULT
  !include "${VIKING_DEFAULT_LANGFILE}"
  !undef INSERT_DEFAULT

  ; Viking Language file Version 3
  ; String labels should match those from the default language file.

  ; Startup checks
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT INSTALLER_IS_RUNNING		${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_IS_RUNNING			${CUR_LANG}

  ; License Page
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_LICENSE_BUTTON			${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_LICENSE_BOTTOM_TEXT		${CUR_LANG}

  ; Components Page
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_SECTION_TITLE			${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_SHORTCUTS_SECTION_TITLE	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_DESKTOP_SHORTCUT_SECTION_TITLE ${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_STARTMENU_SHORTCUT_SECTION_TITLE	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_FILE_ASSOCIATION_SECTION_TITLE	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_GPSBABEL_SECTION_TITLE	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_SECTION_DESCRIPTION		${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_SHORTCUTS_SECTION_DESCRIPTION	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_DESKTOP_SHORTCUT_DESC		${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_STARTMENU_SHORTCUT_DESC	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_FILE_ASSOCIATION_DESC	${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_INSTALL_GPSBABEL_DESC	${CUR_LANG}

  ; Installer Finish Page
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_FINISH_VISIT_WEB_SITE		${CUR_LANG}

  ; Viking Section Prompts and Texts
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_PROMPT_CONTINUE_WITHOUT_UNINSTALL	${CUR_LANG}

  ; Uninstall Section Prompts
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT un.VIKING_UNINSTALL_ERROR_1		${CUR_LANG}
  !insertmacro VIKING_MACRO_LANGSTRING_INSERT un.VIKING_UNINSTALL_ERROR_2		${CUR_LANG}

  !insertmacro VIKING_MACRO_LANGSTRING_INSERT VIKING_UNINSTALL_COMMENTS		${CUR_LANG}

  !undef CUR_LANG
!macroend

!macro VIKING_MACRO_INCLUDE_LANGFILE LANG FILE
  !insertmacro VIKING_MACRO_LANGUAGEFILE_BEGIN "${LANG}"
  !include "${FILE}"
  !insertmacro VIKING_MACRO_LANGUAGEFILE_END
!macroend
