@echo off
rem Licensed to the Apache Software Foundation (ASF) under one or more
rem contributor license agreements.  See the NOTICE file distributed with
rem this work for additional information regarding copyright ownership.
rem The ASF licenses this file to You under the Apache License, Version 2.0
rem (the "License"); you may not use this file except in compliance with
rem the License.  You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

rem ---------------------------------------------------------------------------
rem Start script for the CATALINA Server
rem ---------------------------------------------------------------------------

setlocal

rem Guess CATALINA_HOME if not defined 创建当前目录的环境变量
set "CURRENT_DIR=%cd%"
rem 判断当前tomcat的安装目录是否正确，如果正确转入gotHmoe
if not "%CATALINA_HOME%" == "" goto gotHome
rem 如果不正确则将当前目录设置为软看根目录
set "CATALINA_HOME=%CURRENT_DIR%"   
rem  查看当前目录是否有catalina.bat，有的话就转入okHome
if exist "%CATALINA_HOME%\bin\catalina.bat" goto okHome
cd ..
set "CATALINA_HOME=%cd%"
cd "%CURRENT_DIR%"
:gotHome
if exist "%CATALINA_HOME%\bin\catalina.bat" goto okHome
echo The CATALINA_HOME environment variable is not defined correctly
echo This environment variable is needed to run this program
goto end
:okHome
rem 将EXECUTABLE设置成catalina.bat
set "EXECUTABLE=%CATALINA_HOME%\bin\catalina.bat"

rem 检查EXECUTABLE是否存在，不存在打印消息退出
if exist "%EXECUTABLE%" goto okExec
echo Cannot find "%EXECUTABLE%"
echo This file is needed to run this program
goto end
:okExec

rem Get remaining unshifted command line arguments and TEMsave them in the
set CMD_LINE_ARGS=
:setArgs
rem %[0-9]表示参数，%0表示批处理本身，%1-9表示以空格分开的参数 eg：xx.bat aa bb 则%1=aa。2%=bb
rem 如果当前只是批处理本身则跳转到doneSetArgs
if ""%1""=="""" goto doneSetArgs
rem 否则带上参数（这里有个shift，貌似是起移位参数的，mac上无法证实https://blog.csdn.net/xin_l_o/article/details/6497983）
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
rem 删除第一个参数（不知道为什么）
shift 
goto setArgs
:doneSetArgs
rem 调用catalina.bat 带上start的参数
call "%EXECUTABLE%" start %CMD_LINE_ARGS%

:end
