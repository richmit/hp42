;; -*- Mode:emacs-lisp; Syntax:ANSI-Common-LISP; Coding:utf-8-unix; fill-column:158 -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;; @file      hp42s-mode.el
;; @author    Mitch Richling <https://www.mitchr.me>
;; @date      2021-10-27
;; @brief     Define a simple mode for HP42/free42/DM42 source code.@EOL
;; @std       Emacs Lisp
;; @see       
;; @copyright 
;;  @parblock
;;  Copyright (c) 2021, Mitchell Jay Richling <https://www.mitchr.me> All rights reserved.
;;
;;  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
;;
;;  1. Redistributions of source code must retain the above copyright notice, this list of conditions, and the following disclaimer.
;;
;;  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the following disclaimer in the documentation
;;     and/or other materials provided with the distribution.
;;
;;  3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software
;;     without specific prior written permission.
;;
;;  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;;  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
;;  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;;  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
;;  DAMAGE.
;;  @endparblock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
(define-generic-mode hp42s-mode
  '()
  '()
  (list
   (cons (concat "^"
                 (regexp-opt
                  '("├"
                    "%"
                    "%CH"
                    "+"
                    "+/-"
                    "-"
                    "0<? ST" 
                    "0=? ST"
                    "0=? ST" 
                    "0>? ST"
                    "0>? ST" 
                    "0≠? ST"
                    "0≠? ST" 
                    "0≠Y ST"
                    "0≤? ST"
                    "0≤? ST" 
                    "0≥? ST"
                    "0≥? ST" 
                    "1/X"
                    "10↑X"
                    "4STK"
                    "A2LINE"
                    "ABS"
                    "ACCEL"
                    "ACOS"
                    "ACOSH"
                    "ADATE"
                    "ADV"
                    "AGRAPH"
                    "AIP"
                    "ALENG"
                    "ALL"
                    "ALLΣ"
                    "AND"
                    "ANUM"
                    "AOFF" 
                    "AON"
                    "APPEND"
                    "ARCL"
                    "ARCL ST"
                    "AROT"
                    "ASHF"
                    "ASIN"
                    "ASINH"
                    "ASSIGN"
                    "ASTO"
                    "ATAN"
                    "ATANH"
                    "ATIME"
                    "ATOX"
                    "AVIEW"
                    "BASE+"
                    "BASE+/-"
                    "BASE-" 
                    "BASE×"
                    "BASE÷"
                    "BEEP"
                    "BEST"
                    "BINM"
                    "BIT?" 
                    "BRESET"
                    "BSIGNED"
                    "BWRAP"
                    "CF"
                    "CLA"
                    "CLD"
                    "CLK12"
                    "CLK24"
                    "CLKEYS"
                    "CLLCD"
                    "CLMENU"
                    "CLP"
                    "CLRG" 
                    "CLST"
                    "CLV"
                    "CLX"
                    "CLΣ"
                    "COMB"
                    "COMPLEX"
                    "CORR"
                    "COS" 
                    "COSH"
                    "CPX?"
                    "CPXRES"
                    "CROSS"
                    "CUSTOM"
                    "C→N"
                    "DATE"
                    "DATE+" 
                    "DDAYS"
                    "DECM"
                    "DEG"
                    "DELAY" 
                    "DELR"
                    "DEPTH"
                    "DET"
                    "DIM?"
                    "DMY"
                    "DOT"
                    "DOW"
                    "DROP"
                    "DROPN"
                    "DSE"
                    "DUP"
                    "DUPN"
                    "EDIT"
                    "EDITN"
                    "END" 
                    "ENG"
                    "ENTER"
                    "ERRMSG" 
                    "ERRNO"
                    "EXITALL"
                    "EXPF"
                    "EXTEND"
                    "E↑X"
                    "E↑X-1"
                    "FC?"
                    "FC?C" 
                    "FCSTX"
                    "FCSTY"
                    "FIX"
                    "FMA"
                    "FNRM"
                    "FP"
                    "FS?"
                    "FS?C"
                    "FUNC"
                    "GAMMA"
                    "GETKEY"
                    "GETKEY1"
                    "GETM"
                    "GRAD"
                    "GROW"
                    "GTO IND ST"
                    "GTO IND"
                    "GTO"
                    "HEAD"
                    "HEADING"
                    "HEXM"
                    "HMS+"
                    "HMS-"
                    "I+"
                    "I-"
                    "INDEX"
                    "INPUT"
                    "INSR"
                    "INTEG"
                    "INVRT"
                    "IP"
                    "ISG"
                    "J+"
                    "J-"
                    "KEY"
                    "KEYASN"
                    "L4STK"
                    "LASTO"
                    "LASTX"
                    "LBL"
                    "LCLBL"
                    "LENGTH"
                    "LINF"
                    "LINΣ"
                    "LIST?"
                    "LN"
                    "LN1+X"
                    "LNSTK"
                    "LOCAT"
                    "LOG"
                    "LOGF"
                    "LSTO"
                    "LXASTO"
                    "MAN"
                    "MAT" 
                    "MDY"
                    "MEAN"
                    "MENU"
                    "MOD"
                    "MVAR"
                    "N!"  
                    "NEWMAT"
                    "NEWLIST"
                    "NEWSTR"
                    "NOP"
                    "NORM"
                    "NOT"
                    "NSTK"
                    "N→C"
                    "N→S"
                    "OCTM"
                    "OFF"
                    "OLD"
                    "ON"
                    "OR"
                    "PCOMPLX"
                    "PERM"
                    "PGMINT"
                    "PGMMENU"
                    "PGMSLV"
                    "PI"
                    "PICK"
                    "PIXEL"
                    "POLAR"
                    "POS"
                    "POSA"
                    "PRA"
                    "PRLCD"
                    "PRMVAR"
                    "PROFF"
                    "PROMPT"
                    "PRON"
                    "PRSTK" 
                    "PRUSR"
                    "PRV"
                    "PRX"
                    "PRΣ"
                    "PSE"
                    "PUTM"
                    "PWRF"
                    "R<>R"
                    "RAD" 
                    "RAN"
                    "RCL IND ST"
                    "RCL ST"
                    "RCL"
                    "RCL+ IND ST"
                    "RCL+ ST"
                    "RCL+"
                    "RCL- IND ST"
                    "RCL- ST"
                    "RCL-"
                    "RCLEL IND ST" 
                    "RCLEL ST"
                    "RCLEL"
                    "RCLFLAG"
                    "RCLIJ IND ST"
                    "RCLIJ ST"
                    "RCLIJ"
                    "RCL× IND ST"
                    "RCL× ST"
                    "RCL×"
                    "RCL÷ IND ST"
                    "RCL÷ ST"
                    "RCL÷" 
                    "RCOMPLX"
                    "RDX,"
                    "RDX."
                    "REAL?"
                    "REALRES"
                    "RECT"
                    "REV"
                    "RND"
                    "RNRM"
                    "ROTXY"
                    "RSUM"
                    "RTN"
                    "RTNERR"
                    "RTNNO"
                    "RTNYES"
                    "R↑"
                    "R↑N"
                    "R↓"
                    "R↓N"
                    "SCI"
                    "SDEV"
                    "SEED"
                    "SF" 
                    "SIGN"
                    "SIN"
                    "SINH"
                    "SIZE"
                    "SLOPE"
                    "SOLVE"
                    "SQRT"
                    "SST↑"
                    "SST→" 
                    "SST↓" 
                    "STO IND ST"
                    "STO ST"
                    "STO" 
                    "STO+ IND ST"
                    "STO+ ST"
                    "STO+"
                    "STO- IND ST"
                    "STO- ST"
                    "STO-"
                    "STOEL IND ST"
                    "STOEL ST"
                    "STOEL"
                    "STOFLAG"
                    "STOIJ IND ST" 
                    "STOIJ ST"
                    "STOIJ"
                    "STOP IND ST"
                    "STOP ST"
                    "STOP"
                    "STO× IND ST"
                    "STO× ST"
                    "STO×"
                    "STO÷ IND ST"
                    "STO÷ ST"
                    "STO÷"
                    "STR"
                    "STRACE"
                    "SUBSTR"
                    "SUM"
                    "S→N"
                    "TAN"
                    "TANH"
                    "TIME"
                    "TONE"
                    "TRACE"
                    "TRANS"
                    "UNPICK"
                    "UVEC"
                    "VARMENU"
                    "VARMNU1"
                    "VIEW"
                    "WMEAN"
                    "WRAP"
                    "WSIZE"
                    "WSIZE?"
                    "X2LINE"
                    "X<0?"
                    "X<>" 
                    "X<>F"
                    "X<>Y"
                    "X<? ST"
                    "X<Y?"
                    "X=0?"
                    "X=? ST"
                    "X=Y?"
                    "X>0?"
                    "X>? ST"
                    "X>Y?"
                    "XASTO"
                    "XEQ IND ST"
                    "XEQ IND"
                    "XEQ"
                    "XSTR"
                    "XTOA" 
                    "X↑2?"
                    "X≠0?"
                    "X≠? ST"
                    "X≠Y?"
                    "X≤0?"
                    "X≤? ST"
                    "X≤Y?"
                    "X≥0?"
                    "X≥? ST"
                    "X≥Y?"
                    "YINT" 
                    "YMD"
                    "Y↑X"
                    "X↑2"
                    "[FIND]"
                    "[MAX]"
                    "[MIN]"
                    "×"
                    "÷"
                    "Σ+"
                    "Σ-"
                    "ΣREG?"
                    "←"
                    "↑"
                    "→"
                    "→DEC"
                    "→DEG"
                    "→HMS"
                    "→HR"
                    "→OCT" 
                    "→POL"
                    "→RAD"
                    "→REC"
                    "↓"
                    )
                  t)
                 "[[:space:]\"]")                                                      '(1 font-lock-keyword-face t))           ;; Commands
   (cons (concat "^KEY [0-9] \\(" (regexp-opt '("XEQ" "GTO") t) "\\) ")                '(1 font-lock-keyword-face t))           ;; KEY GTO/XEQ
   (cons (concat (regexp-opt '("GTO" "XEQ") t) " \\(\"[^\"]+\"\\|[0-9][0-9]\\)")       '(2 font-lock-function-name-face t))     ;; Labels
   (cons "LBL \\(\"[^\"]+\"\\|[0-9][0-9]\\)"                                           '(1 font-lock-function-name-face t))     ;; Labels
   (cons (concat (regexp-opt '("@@@@" "@@##" "@NM@") t)
                 ".*$")                                                                '(0 font-lock-comment-delimiter-face t)) ;; Comments

   (cons "@@## REQ:.*"                                                                 '(0  font-lock-preprocessor-face t))     ;; Preprocessor
   )
  '(".42s\\'")
  nil
  "Major mode for editing HP-42s programs")

;; ASSIGN "CUST" TO 01

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
(defun MJR-ins42char (charn)
  "Insert free42 character at point."
  (interactive "sCharacter Number(s): ")
  (if charn
      (cl-loop for c in (split-string charn)
               do (insert (nth (eval (car (read-from-string c))) '("÷" "×" "√"  "∫" "▒" "Σ" "▸" "π" "¿" "≤"  "[LF]" "≥"     "≠"  "↵" "↓" "→"
                                                                   ;; CHAR 30 & CHAR 4 are the same unicode.  How to put 30 in a string?
                                                                   "←" "μ" "£"  "°" "Å" "Ñ" "Ä" "∡" "ᴇ" "Æ"  "…"    "[ESC]" "Ö"  "Ü" "▒" "•"  
                                                                   " " "!" "\"" "#" "$" "%" "&" "'" "(" ")"  "*"    "+"     ","  "-" "." "/"
                                                                   "0" "1" "2"  "3" "4" "5" "6" "7" "8" "9"  ":"    ";"     "<"  "=" ">" "?"
                                                                   "@" "A" "B"  "C" "D" "E" "F" "G" "H" "I"  "J"    "K"     "L"  "M" "N" "O"
                                                                   "P" "Q" "R"  "S" "T" "U" "V" "W" "X" "Y"  "Z"    "["     "\\" "]" "↑" "_"
                                                                   "`" "a" "b"  "c" "d" "e" "f" "g" "h" "i"  "j"    "k"     "l"  "m" "n" "o"
                                                                   "p" "q" "r"  "s" "t" "u" "v" "w" "x" "y"  "z"    "{"     "|"  "}" "~" "├"
                                                                   ":" "ʏ"))))))


;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
(defvar MJR-target-free42-version nil)
(setq MJR-target-free42-version "3.0.5")

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
(defun MJR-process-buffer-as-42s-code ()
  "Prepare tangled hp42s code for upload"
  (interactive)
  (let ((zap-loc-too-new 0)
        (zap-loc-too-old 0))
  ;; Remove code requireing a newer version of free42 than our target
  (goto-char (point-min))
  (while (re-search-forward "^.*@@## REQ:free42>=\\([0-9.]+\\) *$" nil t)
    (if (and MJR-target-free42-version (version< MJR-target-free42-version (match-string 1)))
        (progn (cl-incf zap-loc-too-new)
               (replace-match ""))))
  ;; Remove code only needed for an older version of free42 than our target
  (goto-char (point-min))
  (while (re-search-forward "^.*@@## REQ:free42<\\([0-9.]+\\) *$" nil t)
    (if (and MJR-target-free42-version (version<= (match-string 1) MJR-target-free42-version))
        (progn (cl-incf zap-loc-too-old)
               (replace-match ""))))
  ;; Zap comments
  (goto-char (point-min))
  (while (re-search-forward "\\(@@@@\\|@@##\\|@NM@\\).*$" nil t)
    (replace-match ""))
  ;; Zap trailing whitespace
  (goto-char (point-min))
  (while (re-search-forward "  *$" nil t)
    (replace-match ""))
  ;; Zap blank lines
  (goto-char (point-min))  
  (flush-lines "^[[:space:]]*$")
  ;; Add lines after END commands
  (goto-char (point-min))
  (while (re-search-forward "^END$" nil t)
    (replace-match "END\n"))
  ;; Save the buffer
  (if (buffer-file-name)
      (save-buffer))
  ;; Report our status
  (if MJR-target-free42-version
      (message "MJR-process-buffer-as-42s-code (%s): Tangle complete. Zapped %d loc too old, and %d loc too new." (buffer-name) zap-loc-too-old zap-loc-too-new)
      (message "MJR-process-buffer-as-42s-code (%s): Tangle complete. MJR-target-free42-version not set." (buffer-name) zap-loc-too-old zap-loc-too-new))))

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------
(defun MJR-copy-42s-code-in-region ()
  "Copy region and prepare it for paste into free42"
  (interactive)
  (let ((pmin (min (point) (mark)))
        (pmax (max (point) (mark))))
    (if (< pmin pmax)
        (progn (kill-ring-save (min (point) (mark)) (max (point) (mark)))
               (with-temp-buffer  (yank)
                                  (MJR-process-buffer-as-42s-code)
                                  (kill-ring-save (point-min) (point-max)))))))

