set Path=%PATH%;C:\adt32\ant\bin
set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.7.0_21
cd C:\android-neon\eclipse\workspace\AppNumberPickerDemo1
ant clean -Dtouchtest.enabled=true debug
