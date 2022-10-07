#!/bin/bash
export JENKINS_SECRET="$(curl -L -s -u admin:123456  -X GET ${JENKINS_URL}/computer/slave-01/slave-agent.jnlp|sed 's/<jnlp><application-desc><argument>\([a-z0-9]*\).*/\1/')"
/usr/local/bin/jenkins-agent
