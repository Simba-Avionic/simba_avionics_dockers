#!/bin/bash
java -jar agent.jar -url https://simbaj.toadres.pl/ -secret "${JENKINS_SECRET}" -name "${NODE_NAME}" -webSocket -workDir "/jenkins/"