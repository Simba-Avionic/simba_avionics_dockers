#!/bin/bash
java -jar agent.jar -url http://srv25.mikr.us:20226/ -secret "${JENKINS_SECRET}" -name "${NODE_NAME}" -workDir "/jenkins/"
