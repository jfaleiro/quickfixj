test:
	./mvnw package -Dmaven.javadoc.skip=true -DskipTests -PskipBundlePlugin,minimal-fix-latest

test-fast:
	./mvnw clean package -Dmaven.javadoc.skip=true -DskipTests -PskipBundlePlugin,minimal-fix-latest

test-slower:
	./mvnw clean package -Dmaven.javadoc.skip=true -DskipAT=true -PskipBundlePlugin,minimal-fix-latest

test-slow:
	./mvnw clean package -Dmaven.javadoc.skip=true -PskipBundlePlugin,minimal-fix-latest

prepare-ide:
	./mvnw clean install -Dmaven.javadoc.skip=true -DskipTests -PskipBundlePlugin,minimal-fix-latest

prepare-ide-fast:
	./mvnw install -Dmaven.javadoc.skip=true -DskipTests -PskipBundlePlugin,minimal-fix-latest

run-banzai:
	./mvnw exec:java -pl org.quickfixj:quickfixj-examples-banzai -Dexec.mainClass="quickfix.examples.banzai.Banzai"

run-executor:
	./mvnw exec:java -pl org.quickfixj:quickfixj-examples-executor -Dexec.mainClass="quickfix.examples.executor.Executor"