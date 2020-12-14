{{/*
Expand the name of the chart.
*/}}
{{- define "servlet-example.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "servlet-example.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "servlet-example.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "servlet-example.labels" -}}
helm.sh/chart: {{ include "servlet-example.chart" . }}
{{ include "servlet-example.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "servlet-example.selectorLabels" -}}
app.kubernetes.io/name: {{ include "servlet-example.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
define the imagePullSecret
*/}}
{{- define "imagePullSecret" }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\": {\"auth\": \"%s\"}}}" .Values.imageCredentials.registry (printf "%s:%s" .Values.imageCredentials.username .Values.imageCredentials.password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "servlet-example.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "servlet-example.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
