#tomcat 8.5的pom源码
 ##导入idea后在vm options下添加运行指令
  * -Dcatalina.home=[your tomcat sources code dir]
  * -Dcatalina.base=[your tomcat sources code dir]
  * -Djava.endorsed.dirs=[your tomcat sources code dir]/endorsed 
  * -Djava.io.tmpdir=[your tomcat sources code dir]/temp 
  * -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager 
  * -Djava.util.logging.config.file=[your tomcat sources code dir]/conf/logging.properties